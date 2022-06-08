<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: xck
  Date: 2022/1/3
  Time: 20:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<title>乾坤未定，你我皆是黑马。</title>
<style>
    .title {
        font-size: 20px;
        color: black;
        font-weight: bold;
    }

    .title:hover{
        text-decoration: none;
        color: black;
    }

    .body {
        margin-top: 20px;
    }

    .foot {
        margin-top: 20px;
    }

    .blog {
        margin-top: 20px;
        font-size: 16px;
    }

    #panel-heading{
        background-color: white;
    }

    li{
        list-style: none;
    }
</style>
<body>
<jsp:include page="head.jsp"/>
<div class="container">
    <div class="row">
        <div class="col-xs-12">
            <div class="col-xs-9">
                <div class="panel panel-default">
                    <div class="panel-heading" id="panel-heading">博客 <c:if test="${num > 0}"><span class="pull-right">共${pageInfo.total}篇</span></c:if></div>
                    <div class="panel-body">
                        <c:forEach items="${blogList}" var="blog">
                            <div class="blog clearfix" style="border-bottom: 1px #c5c5c5 solid;height: 130px">
                                <div class="col-xs-12 head">
                                    <a class="title" href="${pageContext.request.contextPath}/blog?id=${blog.id}">${blog.title}</a>
                                </div>
                                <div class="col-xs-12 body">
                                    <c:if test="${blog.content.length() > 40}">
                                        <span>${blog.content.replace("#", "").substring(0, 40)} ...</span>
                                    </c:if>
                                    <c:if test="${blog.content.length() <= 40}">
                                        <span>${blog.content.replace("#", "")}</span>
                                    </c:if>
                                </div>
                                <div class="col-xs-12 foot">
                                    <span>${blog.admin.username}</span>
                                    <span class="col-xs-offset-3">${blog.create_time}</span>
<%--                                    <span class="col-xs-offset-1">--%>
<%--                                        <c:forEach items="${blog.blogTagList}" var="blogTag">--%>
<%--                                            <a href="${pageContext.request.contextPath}/index?tag_id=${blogTag.id}">${blogTag.tag_name}</a>&nbsp;&nbsp;--%>
<%--                                        </c:forEach>--%>
<%--                                    </span>--%>
                                    <span class="col-xs-offset-1">
                                            <a href="${pageContext.request.contextPath}/index?type_id=${blog.blogType.id}">${blog.blogType.name}</a>
                                    </span>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div class="col-xs-3 pull-right">
                <div class="panel panel-default">
                    <div class="panel-heading">博客类型</div>
                    <div class="panel-body">
                        <c:forEach items="${blogTypeList}" var="blogType">
                            <li><a href="${pageContext.request.contextPath}/index?type_id=${blogType.id}" class="">${blogType.name}</a></li>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
        <c:if test="${pageInfo.hasPreviousPage}">
            <c:if test='${title != "" && type_id == 0}'>
                <a style="margin-left: 30px" class="pull-left btn btn-default" href="${pageContext.request.contextPath}/index?page=${pageInfo.prePage}&title=${title}">上一页</a>
            </c:if>
            <c:if test='${type_id != 0 && title == ""}'>
                <a style="margin-left: 30px" class="pull-left btn btn-default" href="${pageContext.request.contextPath}/index?page=${pageInfo.prePage}&type_id=${type_id}">上一页</a>
            </c:if>
            <c:if test='${title != "" && type_id != 0}'>
                <a style="margin-left: 30px" class="pull-left btn btn-default" href="${pageContext.request.contextPath}/index?page=${pageInfo.prePage}&type_id=${type_id}&title=${title}">上一页</a>
            </c:if>
            <c:if test='${title == "" && type_id == 0}'>
                <a style="margin-left: 30px" class="pull-left btn btn-default" href="${pageContext.request.contextPath}/index?page=${pageInfo.prePage}">上一页</a>
            </c:if>
        </c:if>
        <c:if test="${pageInfo.hasNextPage}">
            <c:if test='${title != "" && type_id == 0}'>
                <a style="margin-left: 30px" class="btn btn-default" href="${pageContext.request.contextPath}/index?page=${pageInfo.nextPage}&title=${title}">下一页</a>
            </c:if>
            <c:if test='${type_id != 0 && title == ""}'>
                <a style="margin-left: 30px" class="btn btn-default" href="${pageContext.request.contextPath}/index?page=${pageInfo.nextPage}&type_id=${type_id}">下一页</a>
            </c:if>
            <c:if test='${title != "" && type_id != 0}'>
                <a style="margin-left: 30px" class="btn btn-default" href="${pageContext.request.contextPath}/index?page=${pageInfo.nextPage}&type_id=${type_id}&title=${title}">下一页</a>
            </c:if>
            <c:if test='${title == "" && type_id == 0}'>
                <a style="margin-left: 30px" class="btn btn-default" href="${pageContext.request.contextPath}/index?page=${pageInfo.nextPage}">下一页</a>
            </c:if>
        </c:if>
    </div>
</div>
</body>
</html>
