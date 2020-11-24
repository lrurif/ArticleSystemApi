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
//   利用页码获取文章数据,(包括利用专栏来获取文章，利用作者来获取文章，以及随机推荐)
router.post('/getArticle', function (req, res, next) {
    function getArticleData() {
        var sql = "";
        if(req.body.zhuanlan_id) {
            sql = `select article.*,user.realName,user.avatar from user inner join article on user.id = article.user_id and zhuanlan_id = ${req.body.zhuanlan_id} LIMIT ${(req.body.page - 1) * 10},${(req.body.page - 1) * 10 + 10}`;
        }else if(req.body.author_id){
            sql = `select article.*,user.realName,user.avatar from user inner join article on user.id = article.user_id and user_id = ${req.body.author_id} LIMIT ${(req.body.page - 1) * 10},${(req.body.page - 1) * 10 + 10}`;
        }else if(req.body.search_word){
            sql = `select article.*,user.realName,user.avatar from user inner join article on user.id = article.user_id and article_title like '%${req.body.search_word.trim()}%' LIMIT ${(req.body.page - 1) * 10},${(req.body.page - 1) * 10 + 10}`;
        }else {
            sql = `select article.*,user.realName,user.avatar from user inner join article on user.id = article.user_id order by rand() LIMIT 0,10`;
        }
        console.log(sql)
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
                // delete item.article_content;
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
            new Promise(resolve => {
                if(result.length==0)resolve(result);
            })
            var arr = [];
            result.forEach((item, index)=> {
                arr.push(
                    new Promise((resolve, reject)=> {
                        let querySql = `SELECT count(*) as num from article_likes where article_id = ${item.article_id}`;
                        connection.query(querySql, (err, result2) => {
                            if (err) reject();
                            result[index].article_like_num = result2[0].num;
                            resolve();
                        })
                    })
                )
            })
            return new Promise((resolve,reject)=> {
                Promise.all(arr).then(()=> {
                    resolve(result);
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
    // 获取文章是否被收藏
    function isCollect() {
        var sql = `select * from article_collection where article_id = ${req.body.id} and user_id = ${req.body.userId}`
        return new Promise((resolve,reject)=> {
            connection.query(sql, (err,result)=> {
                return resolve(!!result.length>0);
            })
        })
    }
    // 获取文章是否被点赞
    function isLike() {
        var sql = `select * from article_likes where article_id = ${req.body.id} and user_id = ${req.body.userId}`
        return new Promise((resolve,reject)=> {
            connection.query(sql, (err,result)=> {
                return resolve(!!result.length>0);
            })
        })
    }
    // 获取是否关注此作者
    function isFocus(id) {
        var sql = `select * from focus_person where user_id = '${req.body.userId}' and focus_person_id = '${id}'`
        return new Promise((resolve,reject)=> {
            connection.query(sql, (err,result)=> {
                return resolve(!!result.length>0);
            })
        })

    }
    function getCollectionNum(id) {
        var sql = `select count(*) as num from article_collection where article_id = '${id}'`
        return new Promise((resolve,reject)=> {
            connection.query(sql, (err,result)=> {
                return resolve(result[0].num);
            })
        })
    }
    function getZanNum(id) {
        var sql = `select count(*) as num from article_likes where article_id = '${id}'`
        return new Promise((resolve,reject)=> {
            connection.query(sql, (err,result)=> {
                return resolve(result[0].num);
            })
        })
    }
    async function getData() {
        var result;
        result = await getArticleDetail();
        result[0].isCollect = await isCollect();
        result[0].isLike = await isLike();
        result[0].isFocus = await isFocus(result[0].user_id);
        result[0].collectionNum = await getCollectionNum(req.body.id);
        result[0].zanNum = await getZanNum(req.body.id);
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
// 获取可投稿的文章
router.post('/getContributeArticle', (req, res, next) => {
    var sql = `select article_id,article_title,article_time from article where user_id = ${req.body.user_id} and zhuanlan_id is null`;
    connection.query(sql, (err, result) => {
        if (err) res.json({ message: '失败' })
        res.json({
            data: {
                result
            },
            message: '成功'
        })
    })
})
// 获取浏览历史
router.post('/getBrowsingArticle', (req, res, next) => {
    var sql = `select article.article_title,article.article_id,browsing_history.browsing_time from article,browsing_history where browsing_history.user_id=${req.body.userId} and article.article_id = browsing_history.article_id order by browsing_time desc LIMIT ${(req.body.page - 1) * 10},${(req.body.page - 1) * 10 + 10}`;
    connection.query(sql, (err, result) => {
        if (err) res.json({ message: '失败' })
        res.json({
            length: result.length,
            data: result,
            message: '成功'
        })
    })
})
// 新增浏览历史或修改浏览历史时间
router.post('/addBrowsingHistory', (req, res, next) => {
    var sql = `select * from browsing_history where user_id = ${req.body.userId} and article_id = ${req.body.articleId}`;
    connection.query(sql, (err, result) => {
        if (err) res.json({ message: '失败' })
        if(result.length > 0) {
            update();
        }else {
            add();
        }
    })
    function add() {
        var sql = `INSERT into browsing_history(user_id,article_id) values(${req.body.userId},${req.body.articleId})`;
        connection.query(sql, (err, result) => {
            if (err) res.json({ message: '失败' })
            res.json({message: '成功'});
        })
    }
    function update() {
        var sql = `update browsing_history set browsing_time = now() where user_id = ${req.body.userId} and article_id = ${req.body.articleId}`;
        connection.query(sql, (err, result) => {
            if (err) res.json({ message: '失败' })
            res.json({message: '成功'});
        })
    }
})
// 收藏文章
router.post('/addCollection', (req, res, next) => {
    var sql = `INSERT into article_collection(user_id,article_id) values(${req.body.userId},${req.body.articleId})`;
    console.log(sql)
    connection.query(sql, (err, result) => {
        if (err) res.json({ message: '失败' })
        res.json({
            length: result.length,
            message: '成功'
        })
    })
})
// 取消收藏文章
router.post('/cancelCollection', (req, res, next) => {
    var sql = `delete from  article_collection where user_id = ${req.body.userId} and article_id = ${req.body.articleId}`;
    console.log(sql)
    connection.query(sql, (err, result) => {
        if (err) res.json({ message: '失败' })
        res.json({
            length: result.length,
            message: '成功'
        })
    })
})
// 获取可投稿文章
router.post('/getSubmitArticle', (req, res, next) => {
    var sql = "";
    if(req.body.search_word) {
        sql = `select article_id, article_title from article where article_title like '%${req.body.search_word}%' and user_id = '${req.body.user_id}' and zhuanlan_id is null`;
    }else {
        sql = `select article_id, article_title from article where user_id = '${req.body.user_id}' and zhuanlan_id is null order by rand() limit 0,3`;
    }
    console.log(sql);
    connection.query(sql, (err, result) => {
        if (err) res.json({ message: '失败' })
        res.json({
            length: result.length,
            message: '成功',
            data: result
        })
    })
})
// 利用id获取文章信息
router.post('/getArticleById', function (req, res, next) {
    function getArticleData() {
        var sql = `select article.*,user.realName,user.avatar from user inner join article on user.id = article.user_id and article_id = ${req.body.articleId}`;
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
                // delete item.article_content;
                var reg=/<[^>]+>/gim;
                item.article_content = item.article_content.replace(reg, "");
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
            new Promise(resolve => {
                if(result.length==0)resolve(result);
            })
            var arr = [];
            result.forEach((item, index)=> {
                arr.push(
                    new Promise((resolve, reject)=> {
                        let querySql = `SELECT count(*) as num from article_likes where article_id = ${item.article_id}`;
                        connection.query(querySql, (err, result2) => {
                            if (err) reject();
                            result[index].article_like_num = result2[0].num;
                            resolve();
                        })
                    })
                )
            })
            return new Promise((resolve,reject)=> {
                Promise.all(arr).then(()=> {
                    resolve(result);
                })
            })

    }
    async function getData() {
        var result = await getArticleData();
        result = await isLike(result, -1);
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