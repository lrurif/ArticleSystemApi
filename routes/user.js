var express = require('express');
var router = express.Router();
const connection = require('./mysql.js')
/* GET users listing. */
router.post('/login', function (req, res, next) {
  const sql = `select * from user where userName = '${req.body.userName}' And userPassword = '${req.body.password}'`;
  connection.query(sql, (err, result) => {
    if (result && result.length > 0) {
      res.json({
        message: 'success',
        id: result[0].id,
        userName: result[0].userName,
      });
    } else {
      res.json({
        message: 'fail'
      })
    }
  })
});


router.post('/register', function (req, res, next) {
  const sql = `select * from user where userName = ${req.body.userName}`;
  connection.query(sql, (err, result) => {
    if (result && result.length > 0) {
      res.json({
        message: '用户名已被注册',
      });
    } else {
      let sql = `insert into user(userName,userPassword,realName) values('${req.body.userName}','${req.body.password}','${req.body.userName}')`;
      connection.query(sql, (err, result) => {
        res.json({
          message: '注册成功'
        });
      })
    }
  })
});
// 获取推荐作者
router.post('/getRecommend', function (req, res, next) {
  function getUser() {
    return new Promise((resolve, reject) => {
      var sql = `select * from user order by rand() limit 5`;
      connection.query(sql, (err, result) => {
        result.forEach(item => {
          delete item.userName;
          delete item.userPassword;
          delete item.sex;
          delete item.status;
          delete item.registerTime;
        })
        resolve(result);
      })
    })
  }
  function getFocusNum(result) {
    return new Promise((resolve,reject)=> {
      result.forEach((item,index)=> {
        var sql = `select count(*) as num from focus_person where focus_person_id = ${item.id}`;
        connection.query(sql,(err,res)=> {
          item.focus_num = res[0].num;
          if(index == result.length-1) {
            resolve(result);
          }
        })
        
      })
    })
  }
  async function getData() {
    var result;
    result = await getUser();
    result = await getFocusNum(result);
    return result;
  }
  getData().then(data=> {
    res.json(data);
  })

});
module.exports = router;
