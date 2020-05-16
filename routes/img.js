var express = require('express');
var router = express.Router();
var multer = require('multer')
const fs = require('fs')
const path = require('path')

var upload = multer({
    dest: './public/images'
});
var baseUrl = '';
var env = process.env.NODE_ENV || 'development';
if ('development' === env) {
    baseUrl = "http://127.0.0.1:3000/"
}else{
    baseUrl = "http://101.201.152.125:8088/"
}
router.post('/single', upload.single('imageFile'), function (req, res, next) {
    if (req.file.length === 0) {  //判断一下文件是否存在，也可以在前端代码中进行判断。
        res.render("error", { message: "上传文件不能为空！" });
        return
    } else {
        let file = req.file;
        let fileInfo = {};
        let oldname = req.file.path //获取path: 'public\\upload\\0f625978d5d1a783b12e149718f8b634',
        let newname = req.file.path + path.parse(req.file.originalname).ext //.jpg
        //    fs.renameSync('../uploads/' + file.filename, '../uploads/' + file.originalname);//这里修改文件名字，比较随意。
        fs.renameSync(oldname, newname)//将老的文件名改成新的有后缀的文件 #同步写法
        // 获取文件信息
        fileInfo.path = (baseUrl + newname).replace(/\\/g, "/").replace("public/", "");
        // 设置响应类型及编码
        fileInfo.code = 200;
        res.set({
            'content-type': 'application/json; charset=utf-8'
        });

        res.json(fileInfo);
    }
});

router.post('/multiple', upload.array('imageFile', 5), function (req, res, next) {  //这里10表示最大支持的文件上传数目
    let files = req.files;
    if (files.length === 0) {
        res.render("error", { message: "上传文件不能为空！" });
        return
    } else {
        let fileInfos = [];
        for (var i in files) {
            let file = files[i];
            let fileInfo = {};

            let oldname = file.path //获取path: 'public\\upload\\0f625978d5d1a783b12e149718f8b634',
            let newname = file.path + path.parse(file.originalname).ext //.jpg
            //    fs.renameSync('../uploads/' + file.filename, '../uploads/' + file.originalname);//这里修改文件名字，比较随意。
            fs.renameSync(oldname, newname)//将老的文件名改成新的有后缀的文件 #同步写法

            //获取文件基本信息
            fileInfo.mimetype = file.mimetype;
            fileInfo.originalname = file.originalname;
            fileInfo.size = file.size;
            fileInfo.path = (baseUrl + newname).replace(/\\/g, "/").replace("public/", "");

            fileInfos.push(fileInfo);
        }
        // 设置响应类型及编码
        res.set({
            'content-type': 'application/json; charset=utf-8'
        });
        res.json(fileInfos);
    }
});
module.exports = router;
