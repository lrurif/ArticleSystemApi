var express = require('express');
var router = express.Router();
const connection = require('./mysql.js')

// 新增专栏
router.post('/add', function (req, res, next) {
  const sql = `INSERT INTO zhuanlan(zhuanlan_name,zhuanlan_img,zhuanlan_abstract) values('${req.body.title}','${req.body.img}','${req.body.abstract}')`;
  connection.query(sql, (err, result) => {
    if (result && result.length > 0) {
      res.json({
        message: 'success',
      });
    } else {
      res.json({
        message: 'fail'
      })
    }
  })
});
// 获取推荐专栏
router.post('/getRecommend', function (req, res, next) {
  function getList() {
    var sql = `SELECT *  FROM zhuanlan where zhuanlan_id not in (select focus_zhuanlan_id from focus_zhuanlan where user_id = ${req.body.user_id})  order by rand() limit 8;`;
    return new Promise((resolve, reject) => {
      connection.query(sql, (err, result) => {
        if (err) reject();
        return resolve(result);
      })
    })
  }
  // 获取专栏关注数
  function getFocusNum(result) {
    return new Promise((resolve, reject) => {
      result.forEach((item, index) => {
        let sql = `select count(*) as num from article where zhuanlan_id = ${item.zhuanlan_id}`
        connection.query(sql, (err, res) => {
          item.article_num = res[0].num;
          if (index == result.length - 1) {
            resolve(result);
          }
        })
      })

    })
  }
  // 获取专栏文章数量
  function getArticleNum(result) {
    var promiseList = [];
    result.forEach((item, index) => {
      promiseList.push(
        new Promise((resolve, rejct) => {
          var sql = `select count(*) as num from focus_zhuanlan where focus_zhuanlan_id = ${item.zhuanlan_id}`
          connection.query(sql, (err, res) => {
            result[index].focus_num = res[0].num;
            resolve();
            // if (index == result.length - 1) {
            //   return resolve(result);
            // }
          })
        })
      )

    })
    return Promise.all(promiseList);
  }
  async function getRecommend() {
    var result;
    result = await getList();
    result = await getFocusNum(result);
    await getArticleNum(result);
    return result;
  }
  getRecommend().then(data => {
    res.json(data);
  });
});
// 获取专栏详情
router.post('/getZhuanlanDetail', (req, res, next) => {

  function getZhuanlan() {
    return new Promise((resolve, reject) => {
      var sql = `SELECT * from zhuanlan where zhuanlan_id = '${req.body.id}'`;
      connection.query(sql, (err, result) => {
        resolve(result[0]);
      })
    })

  }
  function getFocusNum(data) {
    return new Promise((resolve, reject) => {
      var sql = `SELECT count(*) as num from focus_zhuanlan where focus_zhuanlan_id = '${req.body.id}'`;
      connection.query(sql, (err, result) => {
        data.focus_num = result[0].num;
        data.code = 200;
        data.message = 'success'
        resolve(data);
      })

    })
  }
  function isFocus(data) {
    return new Promise((resolve, reject) => {
      var sql = `SELECT  * from focus_zhuanlan where focus_zhuanlan_id = '${req.body.id}' and user_id = ${req.body.user_id}`;
      console.log(sql)
      connection.query(sql, (err, result) => {
        data.isFocus = result.length > 0 ? true : false;
        resolve(data);
      })

    })
  }
  async function getData() {
    var data = {};
    data.zhuanlan = await getZhuanlan();
    await getFocusNum(data);
    await isFocus(data);
    return data;
  }
  getData().then(data => {
    res.json(data);
  })
});
// 关注专栏或者取消关注
router.post('/focus', function (req, res, next) {
  if (req.body.type == 'cancel') {
    var sql = `delete from focus_zhuanlan where user_id = ${req.body.user_id} And focus_zhuanlan_id = ${req.body.zhuanlan_id}`;
  } else {
    var sql = `INSERT INTO focus_zhuanlan(user_id,focus_zhuanlan_id) values(${req.body.user_id},${req.body.zhuanlan_id})`;
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
module.exports = router;