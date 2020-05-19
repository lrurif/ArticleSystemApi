var express = require('express');
var router = express.Router();
const connection = require('./mysql.js')

router.post('/add',function(req, res, next) {
    const sql = `INSERT INTO zhuanlan(zhuanlan_name,zhuanlan_img,zhuanlan_abstract) values('${req.body.title}','${req.body.img}','${req.body.abstract}')`;
    connection.query(sql,(err,result)=> {
      if(result && result.length>0) {
        res.json({
          message: 'success',
        });
      }else {
        res.json({
          message: 'fail'
        })
      }
    })
  });
// 获取推荐专栏
  router.post('/getRecommend',function(req, res, next) {
    function getList() {
      var sql = `SELECT * FROM zhuanlan order by rand() limit 8`;
      return new Promise((resolve,reject)=> {
        connection.query(sql,(err,result)=> {
          if(err)reject();
          resolve(result);
        })
      })
    }
    // 获取专栏关注数
    function getFocusNum(result) {
      return new Promise((resolve,reject)=> {
        result.forEach((item,index)=> {
          let sql = `select count(*) as num from article where zhuanlan_id = ${item.zhuanlan_id}`
          connection.query(sql,(err,res)=> {
            item.article_num = res[0].num;
            if(index == result.length-1) {
              resolve(result);
            }
          })
        })
        
      })
    }
    // 获取专栏文章数量
    function getArticleNum(result) {
      return new Promise((resolve,reject)=> {
        result.forEach((item,index)=> {
          let sql = `select count(*) as num from focus_zhuanlan where focus_zhuanlan_id = ${item.zhuanlan_id}`
          connection.query(sql,(err,res)=> {
            item.focus_num = res[0].num;
            if(index == result.length-1) {
              resolve(result);
            }
          })
          
        })
      })
    }
    async function getRecommend() {
      var result;
      result = await getList();
      result = await getFocusNum(result);
      result = await getArticleNum(result);
      return result;
    }
    getRecommend().then(data=> {
      res.json(data);
    });
  });
  // 获取专栏详情
  router.post('/getZhuanlanDetail',(req, res, next)=> {
    var data = {};
    function getZhuanlan() {
        var sql = `SELECT * from zhuanlan where zhuanlan_id = '${req.body.id}'`;
        connection.query(sql,(err,result)=> {
          data.zhuanlan = result[0];
        })
    }
    function getFocusNum() {
      var sql = `SELECT count(*) as num from focus_zhuanlan where focus_zhuanlan_id = '${req.body.id}'`;
      connection.query(sql,(err,result)=> {
        data.focus_num = result[0].num;
        data.code = 200;
        data.message = 'success'
        res.json(data);
      })
    }
    getZhuanlan();
    getFocusNum();
  });
  module.exports = router;