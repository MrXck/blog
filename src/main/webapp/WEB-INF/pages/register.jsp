<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2022/1/3
  Time: 15:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/ico/favicon.ico" type="image/x-icon">
    <script src="${pageContext.request.contextPath}/static/js/jQuery.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css">
</head>
<style>
    .account {
        width: 350px;
        margin-top: 10%;
        margin-left: auto;
        margin-right: auto;
        border: 1px solid #f0f0f0;
        padding: 10px 30px 30px 30px;
        -webkit-box-shadow: 5px 10px 10px rgba(0, 0, 0, .05);
        box-shadow: 5px 10px 10px rgba(0, 0, 0, .05);
    }

    .error {
        color: red;
        position: absolute;
        font-size: 12px;
    }
</style>
<body>
<div class="account">
    <h1 align="center">用户注册</h1>
    <form action="${pageContext.request.contextPath}/register" method="post" novalidate>
        <div class="form-group">
            <label for="username">用户名</label>
            <div class="clearfix">
                <div class="col-xs-12" style="padding-left: 0">
                    <input id="username" type="text" class="form-control" name="username" minlength="6" maxlength="16">
                </div>
            </div>
        </div>
        <div class="form-group">
            <label for="password">密码</label>
            <div class="clearfix">
                <div class="col-xs-12" style="padding-left: 0">
                    <input id="password" type="password" class="form-control" name="password" minlength="6" maxlength="16">
                </div>
            </div>
            <div class="error">${error}</div>
        </div>
        <input type="submit" class="btn btn-success" value="注册">
        <a href="${pageContext.request.contextPath}/login" style="line-height: 34px;margin-left: 40%">回到登录页面</a>
    </form>
</div>
</body>
</html>
