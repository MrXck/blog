<%--
  Created by IntelliJ IDEA.
  User: xck
  Date: 2022/1/5
  Time: 18:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人信息</title>
</head>
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
</style>
<script src="${pageContext.request.contextPath}/static/js/jQuery.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/plugins/bootstrap-3.3.7-dist/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/static/plugins/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<body>
<div class="account">
    <h1 align="center">管理员信息</h1>
    <form action="" method="post" class="clearfix" novalidate>
        <div class="form-group">
            <label for="username">用户名</label>
            <div class="clearfix">
                <div class="col-xs-12" style="padding-left: 0">
                    <input id="username" type="text" class="form-control" name="username" value="${admin.username}">
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
        </div>
        <input type="submit" class="btn btn-success pull-right" value="修改">
    </form>
</div>
</body>
</html>
