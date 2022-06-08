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
</head>
<header class="blog-header py-3">
    <div class="row flex-nowrap justify-content-between align-items-center">
        <div class="col-4 pt-1">
            <a class="text-muted" href="${pageContext.request.contextPath}/index">首页</a>
        </div>
        <div class="col-4 text-center">
            <a class="blog-header-logo text-dark" href="#">Large</a>
        </div>
        <div class="col-4 d-flex justify-content-end align-items-center">
            <input type="text" class="form-control col-md-8" placeholder="请输入你要搜索的标题" id="title">
            <a class="text-muted" href="#" aria-label="Search" id="search">
                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor"
                     stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="mx-3" role="img"
                     viewBox="0 0 24 24" focusable="false"><title>Search</title>
                    <circle cx="10.5" cy="10.5" r="7.5"/>
                    <path d="M21 21l-5.2-5.2"/>
                </svg>
            </a>
            <c:if test="${user != null}">
                <a class="btn btn-sm btn-outline-secondary"
                   href="${pageContext.request.contextPath}/login">${user.username}</a>
            </c:if>
            <c:if test="${user == null}">
                <a class="btn btn-sm btn-outline-secondary" href="${pageContext.request.contextPath}/login">登录</a>
            </c:if>
        </div>
    </div>
</header>


<script>
    $('#search').click(function () {
        location.href = '${pageContext.request.contextPath}/index?title=' + $('#title').val();
    })
</script>