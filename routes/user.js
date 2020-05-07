var express = require('express');
var router = express.Router();
const connection = require('./mysql.js')
/* GET users listing. */
router.post('/login',function(req, res, next) {
  const sql = `select * from user where userName = '${req.body.userName}' And userPassword = '${req.body.password}'`;
  connection.query(sql,(err,result)=> {
    if(result && result.length>0) {
      res.json({
        message: 'success',
        id: result[0].id,
        userName: result[0].userName,
      });
    }else {
      res.json({
        message: 'fail'
      })
    }
  })
});


router.post('/register',function(req, res, next) {
  const sql = `select * from user where userName = ${req.body.userName}`;
  connection.query(sql,(err,result)=> {
    if(result && result.length>0) {
      res.json({
        message: '用户名已被注册',
      });
    }else {
      let sql = `insert into user(userName,userPassword,realName) values('${req.body.userName}','${req.body.password}','${req.body.userName}')`;
      console.log(sql)
      connection.query(sql,(err,result)=> {
        console.log(result);
        res.json({
          message: '注册成功'
        });
      })
    }
  })
});
module.exports = router;
