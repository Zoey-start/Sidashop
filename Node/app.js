var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var mysql = require('mysql');
var session = require("express-session");

var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');
var books = require('./routes/books');
var sms_util = require('./util/sms_util');
var svgCaptcha = require('svg-captcha');
var md5 = require('blueimp-md5');
var app = express();


let users = {};

var reqsession='';
//设置跨域访问
app.all('*', function(req, res, next) {  
	res.header("Access-Control-Allow-Origin", "*");  
	res.header("Access-Control-Allow-Headers", "X-Requested-With");  
	res.header("Access-Control-Allow-Methods", "PUT,POST,GET,DELETE,OPTIONS");  
	res.header("X-Powered-By", ' 3.2.1');  
	res.header("Content-Type", "application/json;charset=utf-8");  
	next();
});

//创建数据库连接对象
var conn = mysql.createConnection({
	host: '127.0.0.1', //数据库地址
	user: 'root', //账号
	password: '', //密码
	database: 'tes01', //库名
	multipleStatements: true
})

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({
	extended: false
}));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use(session({
	secret:'12345',
	cookie:{maxAge:1000*60*60*24},
	resave:false,
	saveUninitialized:true
}));

app.use('/', indexRouter);
app.use('/users', usersRouter);

//获取一次性图形验证码
app.get('/api/captcha', function(req, res, next) {
	let captcha = svgCaptcha.create({
		color: true,
		noise: 3,
		ignoreChars: '0o1i',
		size: 4
	})
	req.session.captcha = captcha.text.toLocaleLowerCase()
	res.type('svg');
	res.send(captcha.data);
	reqsession = req.session;
})


/*
发送验证码短信
*/
app.get('/api/sendcode', function (req, res) {
	//1. 获取请求参数数据
	let phone = req.query.phone;
	//2. 处理数据
	//生成验证码(6位随机数)
	let code = sms_util.randomCode(6);
	//发送给指定的手机号
	sms_util.sendCode(phone,code,function (success) {
		if(success){
			users[phone] = code;
			res.json({success_code: 200,message:code});
			console.log(code);
		}else {
			res.json({err_code:0,message:'验证码获取失败'});
			console.log(res);
		}
	})
})


/*
手机验证码登陆
 */
app.post('/api/logincode', (req,res,next) => {
	//获取数据
	var phone = req.query.phone;
	var code = req.query.code;
	//res.json({err_code:0,message:{phone,code}});
	// 验证码是否正确
	if(users[phone] != code){
		res.json({err_code:0,message:'验证码不正确！'})
	}
	delete users[phone];
	let sqlStr = "SELECT * FROM `user` where phone = '" + phone + "' limit 1";
	conn.query(sqlStr,(error,results) => {
		if(error){
			res.json({err_code:0,message:'请求数据失败'});
		}
		else {
			results = JSON.parse(JSON.stringify(results));

			if (results[0]) {//用户已经存在
				req.session.id = results[0].id;

				res.json({
					success_code: 200,
					message: {
						id: results[0].id,
						username: results[0].username,
						phone: results[0].phone
					}
				});
			} else{
				const addSql = "INSERT INTO `user` (username,phone) VALUES (?,?)";
				const addSqlParams = [phone,phone];
				conn.query(addSql,addSqlParams,(error,results,fields) => {
					results = JSON.parse(JSON.stringify(results));
					if(!error){
						req.session.userId = results.insertId;
						let sqlStr = "SELECT * FROM `user` where id = '"+ results.insertId + "' limit 1";
						conn.query(sqlStr,(error,results,fields) => {
							if(error){
								res.json({err_code:0,message:'请求数据失败'});
							}else{
								results = JSON.parse(JSON.stringify(results));
								res.json({
									success_code:200,
									message:{id:results[0].id,username:results[0].username,phone:results[0].phone}
								})
							}
						})
					}
				})
			}
		}
	})

})

/*
用户名和密码登录
 */
app.post('/api/logincaptcha',(req,res,next) => {
	// 获取数据
	var username = req.query.usernames;
	var pwd = md5(req.query.pwd);
	var captcha = req.query.captcha.toLowerCase();
	//校验验证码是否正确
	if(captcha !== reqsession.captcha){
		res.json({err_code:0,message:'图形验证码不正确！'})
		return;
	}
	delete req.session.captcha;

	let sqlStr = "SELECT * FROM `user` where username = '" + username + "' limit 1";
	conn.query(sqlStr,(error,results) => {
		if(error){
			res.json({err_code:0,message:'用户名不正确！'});
		}
		else {
			results = JSON.parse(JSON.stringify(results));
			console.log(results);
			if (results[0]) {//用户已经存在
				//验证密码是否正确

				if(md5(results[0].password) !== pwd){
					res.json({err_code:0,message:'密码不正确！'});
				}else {
					req.session.userId = results[0].id;

					res.json({
						success_code: 200,
						message: {
							id: results[0].id,
							username: results[0].username,
							phone: results[0].phone
						},
						info:'登陆成功!'
					});
				}

			} else{//新用户
				const addSql = "INSERT INTO `user` (username,pwd) VALUES (?,?)";
				const addSqlParams = [username,pwd];
				conn.query(addSql,addSqlParams,(error,results,fields) => {
					results = JSON.parse(JSON.stringify(results));
					if(!error){
						req.session.userId = results.insertId;
						let sqlStr = "SELECT * FROM `user` where id = '"+ results.insertId + "' limit 1";
						conn.query(sqlStr,(error,results,fields) => {
							if(error){
								res.json({err_code:0,message:'请求数据失败'});
							}else{
								results = JSON.parse(JSON.stringify(results));
								res.json({
									success_code:200,
									message:{id:results[0].id,username:results[0].username,phone:results[0].phone}
								})
							}
						})
					}
				})
			}
		}
		 console.log(req.session);
	});
})

/*
根据Session中的用户id获取用户信息
 */
// app.get('api/userinfo',(req,res)=>{
// 	//获取信息
// 	let userId = req.session.userId;
// 	let sqlStr = "SELECT * FROM `user` where id = '" + userId + "' limit 1";
// 	conn.query(sqlStr,(error,results) => {
// 		if(error){
// 			res.json({err_code:0,message:'！'});
// 		}
// 		else {
// 			results = JSON.parse(JSON.stringify(results));
//
// 			if (results[0]) {//用户已经存在
// 				//验证密码是否正确
//
// 				if(md5(results[0].password) !== pwd){
// 					res.json({err_code:0,message:'密码不正确！'});
// 				}else {
// 					req.session.userId = results[0].id;
//
// 					res.json({
// 						success_code: 200,
// 						message: {
// 							id: results[0].id,
// 							username: results[0].username,
// 							phone: results[0].phone
// 						},
// 						info:'登陆成功!'
// 					});
// 				}
//
// 			} else{//新用户
// 				const addSql = "INSERT INTO `user` (username,pwd) VALUES (?,?)";
// 				const addSqlParams = [username,pwd];
// 				conn.query(addSql,addSqlParams,(error,results,fields) => {
// 					results = JSON.parse(JSON.stringify(results));
// 					if(!error){
// 						req.session.userId = results.insertId;
// 						let sqlStr = "SELECT * FROM `user` where id = '"+ results.insertId + "' limit 1";
// 						conn.query(sqlStr,(error,results,fields) => {
// 							if(error){
// 								res.json({err_code:0,message:'请求数据失败'});
// 							}else{
// 								results = JSON.parse(JSON.stringify(results));
// 								res.json({
// 									success_code:200,
// 									message:{id:results[0].id,username:results[0].username,phone:results[0].phone}
// 								})
// 							}
// 						})
// 					}
// 				})
// 			}
// 		}
// 		console.log(req.session);
// 	});
// })

app.get('/banner', function(req, res) {
	const id = req.query.id
	const sqlStr = 'select * from banner'

	conn.query(sqlStr, id, (err, results) => {
		if(err) {
			console.log(err);
		} else {

			res.json(results)
		}
	})
});

app.get('/recommend', function(req, res) {
	const id = req.query.id
	const sqlStr = 'select * from recommends'

	conn.query(sqlStr, id, (err, results) => {
		if(err) {
			(err);
		} else {

			res.json(results)
		}
	})
});

app.get('/feature', function(req, res) {
	const id = req.query.id
	const sqlStr = 'select * from feature'

	conn.query(sqlStr, id, (err, results) => {
		if(err) {
			console.log(err);
		} else {

			res.json(results)
		}
	})
});

app.get('/designer', function(req, res) {
	const id = req.query.id
	const sqlStr = 'select * from designer where 1=1 limit 4'

	conn.query(sqlStr, id, (err, results) => {
		if(err) {
			console.log(err);
		} else {

			res.json(results)
		}
	})
});

app.get('/designersort', function(req, res) {
	const id = req.query.id
	const sqlStr = 'select * from designer '

	conn.query(sqlStr, id, (err, results) => {
		if(err) {
			console.log(err);
		} else {

			res.json(results)
		}
	})
});

app.get('/designerById', function(req, res) {
	const id = req.query.designerid
	const sqlStr = 'select * from designer where designerid = ?'
	conn.query(sqlStr, id, (err, results) => {
		if(err) return res.json({
			err_code: 1,
			message: '获取数据失败',
			affectedRows: 0
		})
		if(results.length !== 1) return res.json({
			err_code: 1,
			message: '数据不存在',
			affectedRows: 0
		})
		res.json({
			err_code: 0,
			message: results[0],
			affectedRows: 0,
		})
	})
});

app.get('/goodsbypop', function(req, res) {
	const id = req.query.id
	const sqlStr = "select * from goods where type='pop'"

	conn.query(sqlStr, id, (err, results) => {
		if(err) {
			console.log(err);
		} else {

			res.json(results)
		}
	})
});

app.get('/goodsbynews', function(req, res) {
	const id = req.query.id
	const sqlStr = "select * from goods where type='news'"

	conn.query(sqlStr, id, (err, results) => {
		if(err) {
			console.log(err);
		} else {

			res.json(results)
		}
	})
});

app.get('/goodsbyselected', function(req, res) {
	const id = req.query.id
	const sqlStr = "select * from goods where type='seleted'"

	conn.query(sqlStr, id, (err, results) => {
		if(err) {
			console.log(err);
		} else {

			res.json(results)
		}
	})
});
app.get('/bannerlistById', function(req, res) {
	const id = req.query.id
	const sqlStr = 'select * from banner where id = ?'
	conn.query(sqlStr, id, (err, results) => {
		if(err) return res.json({
			err_code: 1,
			message: '获取数据失败',
			affectedRows: 0
		})
		if(results.length !== 1) return res.json({
			err_code: 1,
			message: '数据不存在',
			affectedRows: 0
		})
		res.json({
			err_code: 0,
			message: results[0],
			affectedRows: 0,
		})
	})
});
app.get('/goodsById', function(req, res) {
	const id = req.query.id
	const sqlStr = 'select * from goods where id = ?'
	conn.query(sqlStr, id, (err, results) => {
		if(err) return res.json({
			err_code: 1,
			message: '获取数据失败',
			affectedRows: 0
		})
		if(results.length !== 1) return res.json({
			err_code: 1,
			message: '数据不存在',
			affectedRows: 0
		})
		res.json({
			err_code: 0,
			message: results[0],
			affectedRows: 0,
		})
	})
});
app.get('/typegoods', function(req, res) {
	const id = req.query.id
	const sqlStr = 'select typegoods from category group by typegoods'

	conn.query(sqlStr, id, (err, results) => {
		if(err) {
			console.log(err);
		} else {

			res.json(results)
		}
	})
});
app.get('/categorybypop', function(req, res) {
	const id = req.query.id
	const sqlStr = "select * from category where typegoods= 'pop'"

	conn.query(sqlStr, id, (err, results) => {
		if(err) {
			console.log(err);
		} else {

			res.json(results)
		}
	})
});
app.get('/categorybyclothes', function(req, res) {
	const id = req.query.id
	const sqlStr = "select * from category where typegoods= 'clothes'"

	conn.query(sqlStr, id, (err, results) => {
		if(err) {
			console.log(err);
		} else {

			res.json(results)
		}
	})
});
app.get('/categorybydress', function(req, res) {
	const id = req.query.id
	const sqlStr = "select * from category where typegoods= 'dress'"

	conn.query(sqlStr, id, (err, results) => {
		if(err) {
			console.log(err);
		} else {

			res.json(results)
		}
	})
});
app.get('/categorybypregnant', function(req, res) {
	const id = req.query.id
	const sqlStr = "select * from category where typegoods= 'pregnant'";

	conn.query(sqlStr, id, (err, results) => {
		if(err) {
			console.log(err);
		} else {

			res.json(results)
		}
	})
});
app.get('/categorybychildren', function(req, res) {
	const id = req.query.id
	const sqlStr = "select * from category where typegoods= 'children'"

	conn.query(sqlStr, id, (err, results) => {
		if(err) {
			console.log(err);
		} else {

			res.json(results)
		}
	})
});
app.get('/categorybyshoes', function(req, res) {
	const id = req.query.id
	const sqlStr = "select * from category where typegoods= 'shoes'"

	conn.query(sqlStr, id, (err, results) => {
		if(err) {
			console.log(err);
		} else {

			res.json(results)
		}
	})
});
app.get('/categorybybag', function(req, res) {
	const id = req.query.id
	const sqlStr = "select * from category where typegoods= 'bag'"

	conn.query(sqlStr, id, (err, results) => {
		if(err) {
			console.log(err);
		} else {

			res.json(results)
		}
	})
});
app.get('/categorybydecorate', function(req, res) {
	const id = req.query.id
	const sqlStr = "select * from category where typegoods= 'decorate'"

	conn.query(sqlStr, id, (err, results) => {
		if(err) {
			console.log(err);
		} else {

			res.json(results)
		}
	})
});

// catch 404 and forward to error handler
app.use(function(req, res, next) {
	next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
	// set locals, only providing error in development
	res.locals.message = err.message;
	res.locals.error = req.app.get('env') === 'development' ? err : {};

	// render the error page
	res.status(err.status || 500);
	res.render('error');
});

module.exports = app;