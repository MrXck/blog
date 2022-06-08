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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/dashboard.css">
</head>

<style>
    .blog-pagination {
        margin-bottom: 4rem;
    }

    .blog-pagination > .btn {
        border-radius: 2rem;
    }

    .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
    }

    @media (min-width: 768px) {
        .bd-placeholder-img-lg {
            font-size: 3.5rem;
        }
    }
</style>

<nav class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
    <a class="navbar-brand col-md-3 col-lg-2 mr-0 px-3" href="${pageContext.request.contextPath}/admin/blogs">管理后台</a>
    <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-toggle="collapse"
            data-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <select class="form-control form-control-dark w-25" name="type_id" id="select">
        <option value="0">请选择分类</option>
        <c:forEach items="${blogTypeList}" var="blogType">
            <option value="${blogType.id}">${blogType.name}</option>
        </c:forEach>
    </select>
        <input id="title" class="form-control form-control-dark w-50" type="text" placeholder="Search" aria-label="Search">
    <a class="text-muted w-25" href="#" aria-label="Search" id="search">
        <svg width="20" height="20" fill="none" stroke="currentColor"
             stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="mx-3" role="img"
             viewBox="0 0 24 24" focusable="false"><title>Search</title>
            <circle cx="10.5" cy="10.5" r="7.5"/>
            <path d="M21 21l-5.2-5.2"/>
        </svg>
    </a>
    <ul class="navbar-nav px-3">
        <li class="nav-item text-nowrap">
            <c:if test="${admin != null}">
                <a class="nav-link" href="${pageContext.request.contextPath}/admin/info">${admin.username}</a>
            </c:if>
            <c:if test="${admin == null}">
                <a class="nav-link" href="${pageContext.request.contextPath}/login">登录</a>
            </c:if>
        </li>
    </ul>
    <ul class="navbar-nav px-3">
        <li class="nav-item text-nowrap">
            <a class="nav-link" href="${pageContext.request.contextPath}/about.jsp">ABOUT</a>
        </li>
    </ul>
</nav>

<script>
    $('#search').click(function () {
        location.href = '${pageContext.request.contextPath}/admin/blogs?title=' + $('#title').val() + '&type_id=' + $('select').val();
    })
</script>
