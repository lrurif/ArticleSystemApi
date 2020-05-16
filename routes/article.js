var express = require('express');
var router = express.Router();
const connection = require('./mysql.js')

// 新增文章
router.post('/add', function (req, res, next) {
    const sql = `INSERT INTO article(user_id,article_title,article_img,article_content,article_abstract) VALUES(${req.body.userId},'${req.body.title}','${req.body.img}','${req.body.content}','${req.body.abstract}')`;
    connection.query(sql, (err, result) => {
        if (err) {
            res.json({
                message: '未知错误'
            })
        }
        res.json({
            message: '发布成功'
        });
    })
});
//   利用页码获取文章数据
router.post('/getArticle', function (req, res, next) {
    function getArticleData() {
        var sql = "";
        if(req.body.zhuanlan_id) {
            sql = `select article.*,user.realName,user.avatar from user inner join article on user.id = article.user_id and zhuanlan_id = ${req.body.zhuanlan_id} LIMIT ${(req.body.page - 1) * 10},${(req.body.page - 1) * 10 + 10}`;
        }else if(req.body.author_id){
            sql = `select article.*,user.realName,user.avatar from user inner join article on user.id = article.user_id and zhuanlan_id is null and user_id = ${req.body.author_id} LIMIT ${(req.body.page - 1) * 10},${(req.body.page - 1) * 10 + 10}`;
        }else {
            sql = `select article.*,user.realName,user.avatar from user inner join article on user.id = article.user_id and zhuanlan_id is null LIMIT ${(req.body.page - 1) * 10},${(req.body.page - 1) * 10 + 10}`;
        }
        return new Promise((resolve, reject) => {
            connection.query(sql, (err, result) => {
                resolve(result);
            })
        })
    }
    function isLike(result, id) {
        return new Promise((resolve, reject) => {
            result.forEach((item, index) => {
                let querySql = `SELECT * from article_likes where article_id = ${item.article_id} And user_id = ${id}`;
                delete item.article_content;
                connection.query(querySql, (err, result2) => {
                    if (err) return reject();
                    if (result2.length > 0) {
                        result[index].isLike = true;
                    } else {
                        result[index].isLike = false;
                    }
                    if (index == result.length - 1) {
                        return resolve(result);
                    }
                })
            })

        })
    }
    function getCommentsNum(result) {
        return new Promise((resolve, reject) => {
            result.forEach((item, index) => {
                let querySql = `SELECT count(*) as num from comments where article_id = ${item.article_id}`;
                connection.query(querySql, (err, result2) => {
                    if (err) return reject();
                    result[index].comments_num = result2[0].num;
                    if (index == result.length - 1) {
                        return resolve(result);
                    }
                })
            })

        })
    }
    function getLikeNum(result) {
        return new Promise((resolve, reject) => {
            result.forEach((item, index) => {
                let querySql = `SELECT count(*) as num from article_likes where article_id = ${item.article_id}`;
                connection.query(querySql, (err, result2) => {
                    if (err) return reject();
                    result[index].article_like_num = result2[0].num;
                    if (index == result.length - 1) {
                        return resolve(result);
                    }
                })
            })
        })

    }
    async function getData() {
        var result = await getArticleData();
        result = await isLike(result, req.body.id);
        result = await getCommentsNum(result);
        result = await getLikeNum(result);
        return result;
    }
    getData().then(data => {
        var res2 = {};
        res2.length = data.length;
        res2.code = 200;
        res2.data = data;
        res.json(res2);
    })

})
//   阅读量增加
router.post('/addReadNums', function (req, res, next) {
    const sql = `UPDATE article SET article_reading = article_reading+1 WHERE article_id = ${req.body.id}`;
    connection.query(sql, (err, result) => {
        if (err) {
            res.json({
                message: '未知错误'
            })
        }
        res.json({
            message: 'success'
        });
    })
});
//   获取文章细节
router.post('/getArticleDetail', function (req, res, next) {
    function getArticleDetail() {
        const sql = `select article.*,user.realName,user.avatar from user inner join article on user.id = article.user_id AND article_id = ${req.body.id}`;
        return new Promise((resolve, reject) => {
            connection.query(sql, (err, result) => {
                if (err) return;
                return resolve(result);
            })
        })
    }
    async function getData() {
        var result = await getArticleDetail();
        return result;
    }
    getData().then(data => {
        res.json(data);
    })
});
//   点赞
router.post('/likeArticle', (req, res, next) => {
    var sql = "";
    if (req.body.type == 'cancel') {
        sql = `delete from article_likes where article_id = ${req.body.article_id} And user_id = ${req.body.id}`;
    } else {
        sql = `INSERT INTO article_likes(article_id,user_id) values(${req.body.article_id},${req.body.id})`;
    }
    connection.query(sql, (err, result) => {
        if (err) res.json({ message: '失败' })
        res.json({
            message: '成功'
        })
    })
})
// 测试async异步
//   router.post('/getArticle2',function(req, res, next) {
//     const sql = `SELECT * FROM article LIMIT ${(req.body.page-1)*10},${(req.body.page-1)*10+10}`
//     function getData(sql) {
//         return new Promise((resolve,reject)=> {
//             connection.query(sql,(err,result)=> {
//                 if(err) return reject();
//                 return resolve(result);
//             })
//         })
//     }
//     function getData2(result) {
//         return new Promise((resolve,reject)=> {
//             result.forEach((item,index)=> {
//                 let querySql = `SELECT * from user where id = ${item.user_id}`;
//                 connection.query(querySql,(err,result2)=> {
//                     if(err) return reject();
//                     result[index].author = result2[0].userName;
//                     result[index].avatar = result2[0].avatar;
//                     if(index==result.length-1) {
//                         return resolve(result);
//                     }
//                 })
//             })

//         })
//     }
//     async function getAllData() {
//         let result = await getData(sql);
//         let result2 = await getData2(result);
//        return result2;
//     }
//     getAllData().then(data=> {
//         res.json(data);
//     }).catch(err=> {
//         res.json({
//             message: '未知错误'
//         })
//     })
// })
module.exports = router;