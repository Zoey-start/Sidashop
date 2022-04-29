var md5 = require('blueimp-md5');
var moment = require('moment');
var Base64 = require('js-base64').Base64;
var request = require('request');

//生产指定长度的随机数

function randomCode(length) {
	var chars = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
	var result = "";
	for(var i = 0; i < length; i++) {
		var index = Math.ceil(Math.random() * 9);
		result += chars[index];
	}
	return result;
}
exports.randomCode = randomCode;

function sendCode(phone, code, callback) {
	var ACCOUNT_SID = '3bb2bab04677071a5dc1b3c22678ede1';
	var AUTH_TOKEN = '2d99ad6e8fe**********25df199649e';
	var Rest_URL = 'https://open.ucpaas.com/ol/sms/{function}';
	var AppID = 'f07626bf28b845a39da8a2a90929f92a';

	//	1.准备请求url
	var sigParameter = '';
	var time = moment().format('YYYYMMDDHHmmss');
	sigParameter = md5(ACCOUNT_SID+AUTH_TOKEN+time);
	var url = Rest_URL + '/2013-12-26/Accounts/' + ACCOUNT_SID + '/SMS/TemplateSMS?sig=' + sigParameter;
	//2.准备请求体
	var body = {
		to: phone,
		appId: AppID,
		templateId: '1',
		'datas': [code, "1"]
	}
	//3.准备请求头

	var authorization = ACCOUNT_SID + ':' + time;
	authorization = Base64.encode(authorization);
	var header = {
		'Accept': 'application/json',
		'Content-Type': 'application/json;charset-utf-8',
		'Content-Length': JSON.stringify(body).length + '',
		'Authorization': authorization
	}

	//发送请求,并得到返回的结果,调用callback
	request({
		method: 'POST',
		url: url,
		headers: header,
		body: body,
		json:true
	}, function(error, response, body) {
		callback(true);
	});

}

exports.sendCode = sendCode;