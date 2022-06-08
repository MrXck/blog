<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: xck
  Date: 2022/1/5
  Time: 18:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>分类管理</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/ico/favicon.ico" type="image/x-icon">
</head>
<body>
<jsp:include page="head.jsp"/>
<div class="container-fluid">
    <div class="row">
        <jsp:include page="leftBar.jsp"/>
        <main style="margin-top: 10px" role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
            <h1>分类管理</h1>
            <a href="${pageContext.request.contextPath}/admin/types/add">
                <button type="button" class="btn btn-sm btn-outline-secondary">新增</button>
            </a>
            <div class="table-responsive">
                <table class="table table-striped table-sm">
                    <thead>
                    <tr>
                        <th>标题</th>
                        <th>类型</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${blogTypeList}" var="blogType">
                        <tr>
                            <td>${blogType.id}</td>
                            <td>${blogType.name}</td>
                            <td>
                                <a class="btn btn-info"
                                   href="${pageContext.request.contextPath}/admin/types/edit?id=${blogType.id}">编辑</a>
                                <a class="btn btn-danger"
                                   href="${pageContext.request.contextPath}/admin/types/delete?id=${blogType.id}">删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="panel-footer clearfix">
                    <nav class="blog-pagination">
                        <a class="btn btn-outline-primary <c:if test="${!pageInfo.hasPreviousPage}">btn-outline-secondary disabled</c:if>"
                           href="${pageContext.request.contextPath}/admin/types?page=${pageInfo.prePage}">上一页</a>
                        <a class="btn btn-outline-primary <c:if test="${!pageInfo.hasNextPage}">btn-outline-secondary disabled</c:if>"
                           href="${pageContext.request.contextPath}/admin/types?page=${pageInfo.nextPage}">下一页</a>
                    </nav>
                </div>
            </div>
        </main>
    </div>
</div>
</body>
</html>
