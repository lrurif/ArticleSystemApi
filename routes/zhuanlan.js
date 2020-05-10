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
  module.exports = router;