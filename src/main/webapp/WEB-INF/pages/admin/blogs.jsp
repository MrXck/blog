<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2022/1/5
  Time: 10:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="${pageContext.request.contextPath}/static/js/jquery.slim.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.bundle.min.js"></script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>管理后台</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/ico/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/dashboard.css">
</head>

<body>
<jsp:include page="head.jsp"/>
<div class="container-fluid">
    <div class="row">
        <jsp:include page="leftBar.jsp"/>
        <main style="margin-top: 10px" role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
            <h1>博客管理</h1>   <span>共${pageInfo.total}篇</span>
            <a href="${pageContext.request.contextPath}/admin/blogs/add">
                <button type="button" class="btn btn-sm btn-outline-secondary">新增</button>
            </a>
            <div class="table-responsive">
                <table class="table table-striped table-sm">
                    <thead>
                    <tr>
                        <th>标题</th>
                        <th>类型</th>
                        <th>更新时间</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${blogList}" var="blog">
                        <tr>
                            <td>${blog.title}</td>
                            <td>${blog.blogType.name}</td>
                            <td>${blog.create_time}</td>
                            <td>
                                <a class="btn btn-info"
                                   href="${pageContext.request.contextPath}/admin/blogs/edit?id=${blog.id}">编辑</a>
                                <a class="btn btn-danger"
                                   href="${pageContext.request.contextPath}/admin/blogs/delete?id=${blog.id}">删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="panel-footer clearfix">
                    <nav class="blog-pagination">
                        <a class="btn btn-outline-primary <c:if test="${!pageInfo.hasPreviousPage}">btn-outline-secondary disabled</c:if>"
                           href="${pageContext.request.contextPath}/admin/blogs?${path}&page=${pageInfo.prePage}">上一页</a>
                        <a class="btn btn-outline-primary <c:if test="${!pageInfo.hasNextPage}">btn-outline-secondary disabled</c:if>"
                           href="${pageContext.request.contextPath}/admin/blogs?${path}&page=${pageInfo.nextPage}">下一页</a>
                    </nav>
                </div>
            </div>
        </main>
    </div>
</div>
</body>
</html>
