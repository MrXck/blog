<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: xck
  Date: 2022/1/5
  Time: 13:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>博客发布</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/ico/favicon.ico" type="image/x-icon">
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/editor-md/css/editormd.min.css">
<body>
<jsp:include page="head.jsp"/>
<div class="container-fluid">
    <form action="" method="post" style="margin-top: 20px">
        <div class="form-group">
            <input type="text" class="form-control" name="title" placeholder="标题" value="${blog.title}">
        </div>
        <div id="editor">
            <textarea name="content">${blog.content}</textarea>
        </div>
        <select class="form-control" name="type_id" id="">
            <c:forEach items="${blogTypeList}" var="blogType">
                <c:if test="${blog.blogType.id == blogType.id}">
                    <option selected value="${blogType.id}">${blogType.name}</option>
                </c:if>
                <c:if test="${blog.blogType.id != blogType.id}">
                    <option value="${blogType.id}">${blogType.name}</option>
                </c:if>
            </c:forEach>
        </select>
        <button style="margin-top: 10px" type="submit" class="btn btn-success pull-right">提交</button>
    </form>
</div>
</body>
<script src="${pageContext.request.contextPath}/editor-md/editormd.min.js"></script>
<script>
    $(function () {
        editormd('editor', {
            placeholder: '请输入内容',
            height: 700,
            path: "${pageContext.request.contextPath}/editor-md/lib/",
            imageUpload: true,
            imageFormats: ['jpg', 'jpeg', 'png', 'gif'],
            imageUploadURL: "${pageContext.request.contextPath}/image/upload"
        })

    })
</script>
</html>
