<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: xck
  Date: 2022/1/3
  Time: 20:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <script src="${pageContext.request.contextPath}/static/js/jQuery.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/plugins/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/static/plugins/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>

<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${pageContext.request.contextPath}/admin/index">管理中心</a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="${pageContext.request.contextPath}/admin/blogs">博客</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/types">分类</a></li>
            </ul>
            <form action="${pageContext.request.contextPath}/admin/blogs" class="navbar-form navbar-left" role="search">
                <select class="form-control" name="type_id" id="">
                    <option value="0">请选择分类</option>
                    <c:forEach items="${blogTypeList}" var="blogType">
                        <option value="${blogType.id}">${blogType.name}</option>
                    </c:forEach>
                </select>
                <div class="form-group">
                    <input type="text" name="title" class="form-control" placeholder="请输入你要搜索的标题">
                </div>
                <button type="submit" class="btn btn-default"><i class="glyphicon glyphicon-search"></i></button>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <c:if test="${admin != null}">
                    <li><a href="${pageContext.request.contextPath}/admin/info">${admin.username}</a></li>
                </c:if>
                <c:if test="${admin == null}">
                    <li><a href="${pageContext.request.contextPath}/login">登录</a></li>
                </c:if>
                <li><a href="${pageContext.request.contextPath}/about.jsp">ABOUT</a></li>
            </ul>
        </div>
    </div>
</nav>
