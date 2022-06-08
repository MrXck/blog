<%--
  Created by IntelliJ IDEA.
  User: xck
  Date: 2022/1/5
  Time: 18:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>分类新增</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/ico/favicon.ico" type="image/x-icon">
</head>
<body>
<jsp:include page="head.jsp"/>
<div class="container">
    <form action="" method="post" style="margin-top: 20px">
        <div class="form-group">
            <input type="text" class="form-control" name="name" value="${blogType.name}">
        </div>
        <button style="margin-top: 10px" type="submit" class="btn btn-success pull-right">提交</button>
    </form>
</div>
</body>
</html>
