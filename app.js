// 导入 express
const express = require('express')
//导入joi 为表单中携带的每个数据项 定义验证规则
const joi = require('joi')
// 创建服务器的实例对象
const app = express()

// 核心代码开始

// 1.导入并配置 cors 中间件
const cors = require('cors')
// 1.1配置为全局可用的中间件
app.use(cors())

// 2.配置解析表单数据的中间件，注意：这个中间件，只能解析 application/x-www-form-urlencoded 格式的表单数据
app.use(express.urlencoded({
    extended: false
}))

// 4.响应数据的中间件
app.use(function (req, res, next) {
    // status = 0 为成功； status = 1 为失败； 默认将 status 的值设置为 1，方便处理失败的情况
    res.responseInfo = function (err, status = 1) {
        res.send({
            // 状态
            status,
            // 状态描述，判断 err 是 错误对象 还是 字符串
            message: err instanceof Error ? err.message : err,
        })
    }
    next()
})

// 5.配置解析Token的配置文件
// 5.1导入配置文件
const config = require('./config')
// 5.2解析 token 的中间件
const expressJWT = require('express-jwt')
// 5.3使用 .unless({ path: [/^\/api\//] }) 指定哪些接口不需要进行 Token 的身份认证
app.use(expressJWT({
    secret: config.jwtSecretKey
}).unless({
    path: [/^\/api\//]
}))

// 3.1导入并使用用户路由模块
const userRouter = require('./router/user')
// 3.2设置路由模块 访问必须使用 /api开头
app.use('/api', userRouter)


// 导入并使用用户信息路由模块
const userinfoRouter = require('./router/userinfo')
// 注意：以 /my 开头的接口，都是有权限的接口，需要进行 Token 身份认证
app.use('/my', userinfoRouter)

// 错误中间件
app.use(function (err, req, res, next) {
    // 数据验证失败
    if (err instanceof joi.ValidationError) {
        return res.responseInfo(err)
    }
    // 捕获身份认证失败的错误
    if (err.name === 'UnauthorizedError') return res.responseInfo('身份认证失败！')
    // 未知错误
    res.responseInfo(err)
})
// 核心代码结束

// 启动服务器
app.listen(3007, () => {
    console.log('api server running at http://127.0.0.1:3007')
})