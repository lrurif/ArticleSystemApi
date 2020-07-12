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
        userName: result[0].realName,
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
      var sql = `SELECT *  FROM user where id not in (select focus_person_id from focus_person where user_id = ${req.body.user_id}) and id !=${req.body.user_id}  order by rand() limit 5`;
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


// 关注作者或者取消关注
router.post('/toggle_focus', function (req, res, next) {
  if (req.body.type == 'cancel') {
    var sql = `delete from focus_person where user_id = ${req.body.user_id} And focus_person_id = ${req.body.person_id}`;
  } else {
    var sql = `INSERT INTO focus_person(user_id,focus_person_id) values(${req.body.user_id},${req.body.person_id})`;
  }
  connection.query(sql, (err, result) => {
    if (err) {
      res.json({
        message: 'fail'
      })
    }
    res.json({
      message: 'success',
    })


  })
});
//通过Id获取用户信息
router.post('/getUserInfoById', function (req, res, next) {
  var id = req.body.userId;
  var data = {};
  // 获取用户基本信息
  function getBasicInfo(id) {
    var sql = `select * from user where id = ${id}`;
    return new Promise((resolve,rejcet) => {
      connection.query(sql, (err,result) => {
        data.avatar = result[0].avatar=="null"?"":result[0].avatar;
        data.userName = result[0].realName;
        data.sex = result[0].sex;
        data.introduction = result[0].introduction;
        return resolve(data);
      })
    })
  }
  // 获取关注数量
  function getFocusNum(id) {
    var sql = `select count(*) as num from focus_person where user_id = ${id}`;
    return new Promise((resolve,rejcet) => {
      connection.query(sql, (err,result) => {
        data.focusNum = result[0].num;
        return resolve(data);
      })
    })
  }
  // 获取粉丝数量
  function getFansNum(id) {
    var sql = `select count(*) as num from focus_person where focus_person_id = ${id}`;
    return new Promise((resolve,rejcet) => {
      connection.query(sql, (err,result) => {
        data.fansNum = result[0].num;
        return resolve(data);
      })
    })
  }
  // 获取文章数量
  function getArticleNum(id) {
    var sql = `select count(*) as num from article where user_id = ${id}`;
    return new Promise((resolve,rejcet) => {
      connection.query(sql, (err,result) => {
        data.articleNum = result[0].num;
        return resolve(data);
      })
    })
  }
  async function getInfo(id) {
    data = await getBasicInfo(id);
    data = await getFocusNum(id);
    data = await getFansNum(id);
    data = await getArticleNum(id);
  }
  getInfo(id).then(()=> {
    res.json(data);
  });
});
// 修改个人信息
router.post('/editInfo', function(req,res,next) {
  var sql = `update user set realName = '${req.body.realName}',sex = '${req.body.sex}',avatar = '${req.body.avatar||''}',introduction = '${req.body.introduction}' where id = ${req.body.id}`;
  connection.query(sql, (err,result)=> {
    res.json("13")
  })
})
module.exports = router;
