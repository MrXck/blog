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
    <title>博客</title>
</head>
<body>
<jsp:include page="head.jsp"/>
<div class="container">
    <div class="panel panel-default">
        <!-- Default panel contents -->
        <div class="panel-heading clearfix">博客管理  <span>共${pageInfo.total}篇</span><a class="pull-right btn btn-success btn-sm" href="${pageContext.request.contextPath}/admin/blogs/add">新增</a></div>

        <!-- Table -->
        <table class="table">
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
                        <a class="btn btn-info" href="${pageContext.request.contextPath}/admin/blogs/edit?id=${blog.id}">编辑</a>
                        <a class="btn btn-danger" href="${pageContext.request.contextPath}/admin/blogs/delete?id=${blog.id}">删除</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div class="panel-footer clearfix">
            <c:if test="${pageInfo.hasPreviousPage}">
                <c:if test='${title != "" && type_id == 0}'>
                    <a style="margin-left: 30px" class="pull-left btn btn-default" href="${pageContext.request.contextPath}/admin/blogs?page=${pageInfo.prePage}&title=${title}">上一页</a>
                </c:if>
                <c:if test='${type_id != 0 && title == ""}'>
                    <a style="margin-left: 30px" class="pull-left btn btn-default" href="${pageContext.request.contextPath}/admin/blogs?page=${pageInfo.prePage}&type_id=${type_id}">上一页</a>
                </c:if>
                <c:if test='${title != "" && type_id != 0}'>
                    <a style="margin-left: 30px" class="pull-left btn btn-default" href="${pageContext.request.contextPath}/admin/blogs?page=${pageInfo.prePage}&type_id=${type_id}&title=${title}">上一页</a>
                </c:if>
                <c:if test='${title == "" && type_id == 0}'>
                    <a style="margin-left: 30px" class="pull-left btn btn-default" href="${pageContext.request.contextPath}/admin/blogs?page=${pageInfo.prePage}">上一页</a>
                </c:if>
            </c:if>
            <c:if test="${pageInfo.hasNextPage}">
                <c:if test='${title != "" && type_id == 0}'>
                    <a style="margin-left: 30px" class="btn btn-default" href="${pageContext.request.contextPath}/admin/blogs?page=${pageInfo.nextPage}&title=${title}">下一页</a>
                </c:if>
                <c:if test='${type_id != 0 && title == ""}'>
                    <a style="margin-left: 30px" class="btn btn-default" href="${pageContext.request.contextPath}/admin/blogs?page=${pageInfo.nextPage}&type_id=${type_id}">下一页</a>
                </c:if>
                <c:if test='${title != "" && type_id != 0}'>
                    <a style="margin-left: 30px" class="btn btn-default" href="${pageContext.request.contextPath}/admin/blogs?page=${pageInfo.nextPage}&type_id=${type_id}&title=${title}">下一页</a>
                </c:if>
                <c:if test='${title == "" && type_id == 0}'>
                    <a style="margin-left: 30px" class="btn btn-default" href="${pageContext.request.contextPath}/admin/blogs?page=${pageInfo.nextPage}">下一页</a>
                </c:if>
            </c:if>
        </div>
    </div>
</div>
</body>
</html>
