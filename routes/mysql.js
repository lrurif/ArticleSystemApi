const mysql      = require('mysql');
var connection  = mysql.createPool({
    connectionLimit : 10,
    host            : 'localhost',
    user            : 'root',
    password        : '123456',
    database        : 'articlesystem',
    timezone: "Asia/Shanghai"
  });
 
module.exports = connection;