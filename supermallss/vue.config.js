// const json_demo = require('http://localhost:3000/banner');
module.exports = {
    configureWebpack: {
        resolve: {
            alias: {
                'assets': '@/assets',
                'common': '@/common',
                'components': '@/components',
                'network': '@/network',
                'views': '@/views'
            }
        }
    }
    // devServer:{
    //     //http://localhost:8080/json_demo
    //     before(app){
    //         app.get('/json_demo',(req,res) => {
    //             res.json(json_demo);
    //         })
    //     }
    // }

}