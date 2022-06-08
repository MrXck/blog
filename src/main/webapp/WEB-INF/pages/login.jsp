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
    <title>登录</title>
    <script src="${pageContext.request.contextPath}/static/js/jQuery.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/plugins/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/static/plugins/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <style>
        .account {
            width: 400px;
            margin-top: 30px;
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
</head>
<body>
<div class="account">
    <h1 align="center">用户登录</h1>
    <form action="${pageContext.request.contextPath}/login" method="post" novalidate>
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
        <input type="submit" class="btn btn-success" value="登录">
        <a class="pull-right" href="${pageContext.request.contextPath}/register" style="line-height: 34px">还没有账号</a>
    </form>
</div>
</body>
</html>
