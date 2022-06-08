<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>乾坤未定，你我皆是黑马。</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/ico/favicon.ico" type="image/x-icon">
    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/blog.css" rel="stylesheet">
    <style>

        h3 a:hover {
            text-decoration: none;
            color: black;
        }

        h3 a {
            color: black;
        }

        .blog-post{
            overflow: hidden;
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
</head>
<body>

<div class="container">
    <jsp:include page="head.jsp"/>
    <div class="nav-scroller py-1 mb-2">
        <nav class="nav d-flex justify-content-between">
            <c:forEach items="${blogTypeList}" var="blogType">
                <a class="p-2 text-muted" href="${pageContext.request.contextPath}/index?type_id=${blogType.id}"
                   class="">${blogType.name}</a>
            </c:forEach>
        </nav>
    </div>

    <img src="${pageContext.request.contextPath}/static/img/1.jpg" alt="" style="width: 100%">
</div>
<main role="main" class="container">
    <div class="row">
        <div class="col-md-8 blog-main">
            <h3 class="pb-4 mb-4 font-italic border-bottom">
                The latest blog
            </h3>
            <c:forEach items="${blogList}" var="blog">
                <div class="blog-post">
                    <h3><a target="_blank" href="${pageContext.request.contextPath}/blog?id=${blog.id}"
                           class="blog-post-title">${blog.title}</a href="${pageContext.request.contextPath}/blog?id=${blog.id}">
                    </h3>
                    <p class="blog-post-meta">${blog.create_time} by <a href="#">${blog.admin.username}</a></p>
                    <p>
                        <c:if test="${blog.content.length() >= 200}">${blog.content.substring(0, 200).replace("#", "")}</c:if>
                        <c:if test="${blog.content.length() < 200}">${blog.content.substring(0, blog.content.length()).replace("#", "")}</c:if>
                    </p>
                </div>
                <!-- /.blog-post -->
            </c:forEach>
            <nav class="blog-pagination">
                <a class="btn btn-outline-primary <c:if test="${!pageInfo.hasPreviousPage}">btn-outline-secondary disabled</c:if>"
                   href="${pageContext.request.contextPath}/index?${path}&page=${pageInfo.prePage}">上一页</a>
                <a class="btn btn-outline-primary <c:if test="${!pageInfo.hasNextPage}">btn-outline-secondary disabled</c:if>"
                   href="${pageContext.request.contextPath}/index?${path}&page=${pageInfo.nextPage}">下一页</a>
            </nav>

        </div><!-- /.blog-main -->

        <aside class="col-md-4 blog-sidebar">

            <div class="p-4 mb-3 bg-light rounded">
                <h4 class="font-italic">Category</h4>
                <ol class="list-unstyled mb-0">
                    <c:forEach items="${blogTypeList}" var="blogType">
                        <li><a href="${pageContext.request.contextPath}/index?type_id=${blogType.id}">${blogType.name}</a></li>
                    </c:forEach>
                </ol>
            </div>

            <div class="p-4">
                <h4 class="font-italic">Archives</h4>
                <ol class="list-unstyled mb-0">
                    <c:forEach items="${archives}" var="archive">
                        <li>
                            <a href="${pageContext.request.contextPath}/index?date=${archive}">${archive.replace("-", "年")}月</a>
                        </li>
                    </c:forEach>

                </ol>
            </div>

            <div class="p-4">
                <h4 class="font-italic">Elsewhere</h4>
                <ol class="list-unstyled">
                    <li><a href="https://github.com/MrXck" target="_blank">GitHub</a></li>
                </ol>
            </div>
        </aside><!-- /.blog-sidebar -->

    </div><!-- /.row -->

</main><!-- /.container -->

<footer class="blog-footer">
    <p>Blog template built for <a href="https://getbootstrap.com/">Bootstrap</a> by <a href="https://twitter.com/mdo">@mdo</a>.
    </p>
    <p>
        <a href="#">Back to top</a>
    </p>
</footer>


</body>
</html>
