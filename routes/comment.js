var express = require('express');
var router = express.Router();
const connection = require('./mysql.js')
// 新增评论
router.post('/add', function (req, res, next) {
    var sql = "";
    if(req.body.receive_id) {
        sql = `INSERT INTO comments(article_id, user_id, receive_id, receive_person_id, comment_content) VALUES('${req.body.article_id}','${req.body.user_id}','${req.body.receive_id}','${req.body.receive_person_id}','${req.body.comment_content}')`
    }else {
        sql = `INSERT INTO comments(article_id,user_id,comment_content) values('${req.body.article_id}','${req.body.user_id}','${req.body.comment_content}')`;
    }
    connection.query(sql, (err, result) => {
      if (result.affectedRows) {
        res.json({
            insertId: result.insertId,
            message: 'success',
        });
      } else {
        res.json({
          message: 'fail'
        })
      }
    })
  });
// 获取所有评论
router.post('/getAllComments', function (req, res, next) {
    function getArticleComments(article_id) {
        let sql = `SELECT * from comments where article_id = ${article_id} and receive_id is null order by comment_time desc`;
        return new Promise((resolve,rejcet)=> {
            connection.query(sql, (err, result) => {
                if (err) {
                  res.json({
                    message: 'fail',
                  });
                } else {
                    resolve(result);
                }
              })
        })
    }
    function getChildenComments(data) {
        var arr = [];
        data.forEach(item=> {
            let sql = `SELECT * from comments where receive_id = ${item.comments_id};Select * from user where id = ${item.user_id};
                SELECT * from comment_thumb_up where comment_id = '${item.comments_id}' and user_id = '${req.body.user_id}';select count(*) as num from comment_thumb_up where comment_id = '${item.comments_id}';`;
            arr.push(new Promise((resolve,reject)=> {
                connection.query(sql, (err, result) => {
                    item.children = result[0];
                    item.sender = result[1][0];
                    console.log(sql)
                    item.isThumbUp = result[2].length?true:false;
                    item.thumbUpNum = result[3][0].num;
                    resolve();
                  })
            }))
        })
        return new Promise((resolve,reject)=> {
            Promise.all(arr).then(()=> {
                resolve(data);
            })
        })
        
    }
    function getSenderAndReceiver(data) {
        var arr = [];
        data.forEach(items => {
            items.children.forEach(item => {
                let sql = `Select * from user where id = ${item.user_id};SELECT * from user where id = ${item.receive_person_id};
                    SELECT * from comment_thumb_up where comment_id = '${item.comments_id}' and user_id = '${req.body.user_id}';select count(*) as num from comment_thumb_up where comment_id = '${item.comments_id}';`;
            arr.push(new Promise((resolve,reject)=> {
                connection.query(sql, (err, result) => {
                    item.sender = result[0][0];
                    item.receiver = result[1][0];
                    item.isThumbUp = result[2].length?true:false;
                    item.thumbUpNum = result[3][0].num;
                    resolve();
                  })
            }))
            })
        })
        return new Promise((resolve,reject)=> {
            Promise.all(arr).then(()=> {
                resolve(data);

            })
        })
    }
    function handleData(data) {
        data.forEach(items => {
            delete items.article_id;
            delete items.receive_id;
            delete items.receive_person_id;
            delete items.sender.userName;
            delete items.sender.userPassword;
            delete items.sender.sex;
            delete items.sender.status;
            delete items.sender.registerTime;
            delete items.sender.introduction;
            items.children.forEach(item => {
                delete item.article_id;
                delete item.user_id;
                delete item.receive_id;
                delete item.sender.userName;
                delete item.sender.userPassword;
                delete item.sender.sex;
                delete item.sender.status;
                delete item.sender.registerTime;
                delete item.sender.introduction;
                delete item.receiver.userName;
                delete item.receiver.userPassword;
                delete item.receiver.sex;
                delete item.receiver.status;
                delete item.receiver.registerTime;
                delete item.receiver.introduction;
            })
        })
        return data;
    }
    async function getAllData() {
        var data = await getArticleComments(req.body.article_id);
        data = await getChildenComments(data);
        data = await getSenderAndReceiver(data);
        data = handleData(data);
        return data;
    }
    getAllData().then(result=> {
        res.json({
            data: result
        })
    })
  });
//   切换评论点赞
router.post('/toggleThumbUp', function (req, res, next) {
    var sql = "";
    if(req.body.insert) {
        sql = `INSERT into comment_thumb_up values('${req.body.comment_id}','${req.body.user_id}')`
    }else {
        sql = `delete from comment_thumb_up where comment_id = '${req.body.comment_id}' and user_id = '${req.body.user_id}'`;
    }
    connection.query(sql, (err, result) => {
      if (result.affectedRows) {
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



  module.exports = router;