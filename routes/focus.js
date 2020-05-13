var express = require('express');
var router = express.Router();
const connection = require('./mysql.js')

router.post('/get_article', function (req, res, next) {
    // 获取用户关注列表
    function get_focus_person(id, data) {
        return new Promise((resolve, reject) => {
            var sql = `select * from focus_person inner join user on user.id = focus_person.focus_person_id And focus_person.user_id = ${id} `;
            connection.query(sql, (err, result) => {
                data.userList = result;
                resolve(data);
            })
        })
    }
    // 获取专栏关注列表
    function get_focus_zhuanlan(id, data) {
        return new Promise((resolve, reject) => {
            var sql = `select * from focus_zhuanlan inner join zhuanlan on zhuanlan.zhuanlan_id = focus_zhuanlan.focus_zhuanlan_id And focus_zhuanlan.user_id = ${id} `;
            connection.query(sql, (err, result) => {
                data.zhuanlanList = result;
                resolve(data);
            })
        })
    }
    // 遍历数据获取文章
    function get_person_article(result) {
        return new Promise((resolve, reject) => {
            var person_arr = [];
            var zhuanlan_arr = [];
            result.userList.forEach((item, index) => {
                delete item.userPassword;
                delete item.registerTime;
                delete item.sex;
                delete item.status;
                delete item.id;
                person_arr.push(item.focus_person_id);
            })
            result.zhuanlanList.forEach((item, index) => {
                zhuanlan_arr.push(item.focus_zhuanlan_id);
            })
            var sql = `select * from article,user where (user_id in (${(person_arr.toString())}) or zhuanlan_id in (${zhuanlan_arr.toString()})) and user.id = article.user_id limit 10 `
            console.log(sql)
            connection.query(sql, (err, res) => {
                result.articleList = res;
                resolve(result);
            })

        })
    }

    // 遍历专栏获取文章数据,已被覆盖
    // function get_zhuanlan_article(result) {
    //     return new Promise((resolve,reject)=> {
    //         var arr = [];
    //         result.zhuanlanList.forEach((item,index)=> {
    //             arr.push(item.zhuanlan_id);
    //         })
    //         var sql = `select * from article where zhuanlan_id in (${(arr.toString())})`
    //         connection.query(sql,(err,res)=> {
    //             result.articleList = result.articleList.concat(res);
    //             result.articleList = result.articleList.reduce((item,next) => {
    //                 result.articleList[next.article_id] ? "" : result.articleList[next.article_id] = true && item.push(next);
    //                 return item;
    //             },[]);
    //             resolve(result);
    //         })

    //     })
    // }
    // 获取是否点赞
    function isLike(result, id) {
        return new Promise((resolve, reject) => {
            result.forEach((item, index) => {
                let querySql = `SELECT * from article_likes where article_id = ${item.article_id} And user_id = ${id}`;
                
                delete item.article_content;
                connection.query(querySql, (err, result2) => {
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
    //   获取评论数量
    function getCommentsNum(result) {
        return new Promise((resolve, reject) => {
            result.forEach((item, index) => {
                let querySql = `SELECT count(*) as num from comments where article_id = ${item.article_id}`;
                // console.log(querySql)
                connection.query(querySql, (err, result2) => {
                    result[index].comments_num = result2[0].num;
                    if (index == result.length - 1) {
                        return resolve(result);
                    }
                })
            })

        })
    }
    async function getData() {
        var data = {};
        data = await get_focus_person(req.body.userId, data);
        data = await get_focus_zhuanlan(req.body.userId, data);
        data = await get_person_article(data);
        // data = await get_zhuanlan_article(data);
        data.articleList = await isLike(data.articleList, req.body.userId);
        data.articleList = await getCommentsNum(data.articleList);
        return data;
    }

    getData().then(data => {
        res.json(data);
    })
});
module.exports = router;
