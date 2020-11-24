var express = require('express');
var router = express.Router();
const connection = require('./mysql.js')

//   利用页码获取文章数据,(包括利用专栏来获取文章，利用作者来获取文章，以及随机推荐)
router.post('/getCollectArticle', function (req, res, next) {
    function getArticleData() {
        var sql = `select * from article,article_collection,user where article.user_id = user.id and article_collection.user_id = ${req.body.userId} and article.article_id = article_collection.article_id  LIMIT ${(req.body.page - 1) * 10},${(req.body.page - 1) * 10 + 10}`;
        return new Promise((resolve, reject) => {
            connection.query(sql, (err, result) => {
                resolve(result);
            })
        })
    }
    function isLike(result, id) {
        return new Promise((resolve, reject) => {
            if(result.length==0)resolve(result);
            result.forEach((item, index) => {
                let querySql = `SELECT * from article_likes where article_id = ${item.article_id} And user_id = ${id}`;
                delete item.userPassword;
                delete item.sex;
                delete item.status;
                delete item.registerTime;
                item.user_id = item.id;
                delete item.id;
                var reg=/<[^>]+>/gim;
                item.article_content = item.article_content.replace(reg, "");
                item.article_content = item.article_content.slice(0,100);
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
            if(result.length==0)resolve(result);
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
            if(result.length==0)resolve(result);
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
        result = await isLike(result, req.body.userId);
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
module.exports = router;