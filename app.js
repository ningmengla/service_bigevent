// 1.1导入express 模块
const express = require('express');
// 1.2创建 express的服务器实例
const app = express();

// 2.1导入cors中间件
const cors = require('cors');
// 2.2将 cors 注册为全局中间件
app.use(cors());
// 3配置解析 application/x-www-form-urlencoded 格式的表单数据的中间件
app.use(express.urlencoded({ extended: false }))

// 1.3调用 app.listen 方法，指定端口号并启动web服务器
app.listen(3007, function () {
     console.log("服务器启动成功，在http://127.0.0.1:3007");
});