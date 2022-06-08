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
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/ico/favicon.ico" type="image/x-icon">
    <script src="${pageContext.request.contextPath}/static/js/jQuery.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/plugins/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/static/plugins/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
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
</head>
<body>
<div class="account">
    <h1 align="center">管理员登录</h1>
    <form action="${pageContext.request.contextPath}/admin/" method="post">
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
        <div class="form-group">
            <label for="verCode">验证码</label>
            <div class="clearfix">
                <div class="clearfix">
                    <div class="col-xs-7" style="padding-left: 0">
                        <input id="verCode" type="password" class="form-control" name="verCode">
                    </div>
                    <div class="col-xs-5" style="padding-left: 0">
                        <img id="code" src="${pageContext.request.contextPath}/captcha" height="34px" />
                    </div>
                </div>
            </div>
            <div class="error">${error1}</div>
        </div>
        <input type="submit" class="btn btn-success" value="登录">
    </form>
</div>
</body>
<script>
    $('#code').click(function () {
        $(this).attr('src', $(this).attr('src') + '?');
    })
</script>
</html>
