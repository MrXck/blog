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
    <title>分类</title>
</head>
<body>
<jsp:include page="head.jsp"/>
<div class="container">
    <div class="panel panel-default">
        <!-- Default panel contents -->
        <div class="panel-heading clearfix">分类管理<a class="pull-right btn btn-success btn-sm" href="${pageContext.request.contextPath}/admin/types/add">新增</a></div>

        <!-- Table -->
        <table class="table">
            <thead>
            <tr>
                <th>id</th>
                <th>名称</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${blogTypeList}" var="blogType">
                <tr>
                    <td>${blogType.id}</td>
                    <td>${blogType.name}</td>
                    <td>
                        <a class="btn btn-info" href="${pageContext.request.contextPath}/admin/types/edit?id=${blogType.id}">编辑</a>
                        <a class="btn btn-danger" href="${pageContext.request.contextPath}/admin/types/delete?id=${blogType.id}">删除</a>
                    </td>
                </tr>
            </c:forEach>

            </tbody>
        </table>
        <div class="panel-footer clearfix">
            <c:if test="${pageInfo.hasPreviousPage}">
                <a style="margin-left: 30px" class="pull-left btn btn-default" href="${pageContext.request.contextPath}/admin/types?page=${pageInfo.prePage}">上一页</a>
            </c:if>
            <c:if test="${pageInfo.hasNextPage}">
                <a style="" class="col-xs-offset-1 btn btn-default" href="${pageContext.request.contextPath}/admin/types?page=${pageInfo.nextPage}">下一页</a>
            </c:if>
        </div>
    </div>
</div>
</body>
</html>
