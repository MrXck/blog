<%--
  Created by IntelliJ IDEA.
  User: xck
  Date: 2022/1/5
  Time: 19:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>关于我</title>
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
<body>
<jsp:include page="WEB-INF/pages/head.jsp"/>
<div class="account">
    <h2>关于我</h2>
    <div>
        一个热爱后端的普通人，一个想要学完所有感兴趣的东西的普通人，希望结识可以共同成长的小伙伴
    </div>
    <div style="margin-top: 30px">
        <p>QQ：1971877559</p>
        <p>GitHub：<a target="_blank" href="https://github.com/MrXck">https://github.com/MrXck</a></p>
    </div>
</div>
</body>
</html>
