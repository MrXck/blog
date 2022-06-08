<%--
  Created by IntelliJ IDEA.
  User: xck
  Date: 2022/1/4
  Time: 21:05
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/ico/favicon.ico" type="image/x-icon">
    <title>${blog.title}</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/editor-md/css/editormd.preview.min.css">
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/blog.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/tocbot.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/js/tocbot.min.js"></script>
</head>
<style>
    .title {
        text-align: center;
    }

    .comment {
        margin-top: 10px;
        margin-bottom: 20px;
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

        #catalogue{
            display: block !important;
            position: fixed;
            top: 10%;
            right: 20px;
            width: 15%;
        }
    }
</style>

<body>
<div class="container">
    <jsp:include page="head.jsp"/>
</div>

<main role="main" class="container">
    <div class="row">
        <div class="col-md-12 blog-main">
            <div class="blog-post">
                <div class=""><a href="#">${blog.admin.username}</a> ${blog.create_time}</div>
                <div class="">
                    <h2 class="title">${blog.title}</h2>
                    <div id="editor" class="content js-toc-content">
                        <textarea>${blog.content}</textarea>
                    </div>
                </div>
            </div>

            <div class="col-md-12" style="padding: 0">
                <p>评论</p>
                <div class="card mb-12 shadow-sm">
                    <div class="card-body">
                        <div id="body">
                        </div>
                    </div>
                </div>
            </div>

            <div class="blog-post" id="comment">
                <form action="${pageContext.request.contextPath}/comment/add">
                    <input id="comment_id" type="hidden" name="comment_id">
                    <input type="hidden" name="blog_id" value="${blog.id}">
                    <textarea class="form-control" rows="7" name="content" placeholder="请输入评论信息"></textarea>
                    <button type="submit" style="margin-top: 10px" class="btn btn-success pull-right">提交</button>
                    <button type="button" style="margin-top: 10px; margin-right: 20px" id="reset"
                            class="btn btn-info pull-right">取消回复
                    </button>
                </form>
            </div>
        </div><!-- /.blog-main -->
    </div><!-- /.row -->
</main><!-- /.container -->

<footer class="blog-footer">
    <p>Blog template built for <a href="https://getbootstrap.com/">Bootstrap</a> by <a href="https://twitter.com/mdo">@mdo</a>.
    </p>
    <p>
        <a href="#">Back to top</a>
    </p>
</footer>

<div id="catalogue" style="display: none">
    <ol class="js-toc"></ol>
</div>

<div class="comment" id="template" style="display: none">
    <p><span class="username">用户名称</span> <span class="col-xs-offset-2 create_time">评论时间</span></p>
    <p class="content">评论内容</p>
    <a href="#comment" class="huifu" style="margin-left: 10%">回复</a>
    <div class="comment-children" style="margin-left: 10%">
    </div>
</div>
</body>

<script src="${pageContext.request.contextPath}/editor-md/editormd.min.js"></script>
<script src="${pageContext.request.contextPath}/editor-md/lib/marked.min.js"></script>
<script src="${pageContext.request.contextPath}/editor-md/lib/prettify.min.js"></script>
<script src="${pageContext.request.contextPath}/editor-md/lib/raphael.min.js"></script>
<script src="${pageContext.request.contextPath}/editor-md/lib/underscore.min.js"></script>
<script src="${pageContext.request.contextPath}/editor-md/lib/sequence-diagram.min.js"></script>
<script src="${pageContext.request.contextPath}/editor-md/lib/flowchart.min.js"></script>
<script src="${pageContext.request.contextPath}/editor-md/lib/jquery.flowchart.min.js"></script>
<script>

    var huifu = $("#comment_id");

    $(function () {
        editormd.markdownToHTML('editor', {
            htmlDecode: 'style,script,iframe'
        })

    })

    var comment_ = $("#body");

    comment_.on("click", "a", function () {
        huifu.val("");
        huifu.val($(this).parent().attr("id"));
        console.log($(this).parent().attr("id"));
    })

    $("#reset").click(function () {
        huifu.val("");
    })

    $.post("${pageContext.request.contextPath}/comment/getComment",
        {id:${blog.id}},
        function (data) {
            data = JSON.parse(data);
            var comment;
            for (let i = 0; i < data.length; i++) {
                if (data[i].comment_id == null) {
                    comment = $("#template").clone();
                    comment.attr("id", data[i].id);
                    comment.css("display", "block");
                    comment.find(".username").text(data[i].user.username);
                    comment.find(".create_time").text(data[i].create_time);
                    comment.find(".content").text(data[i].content)
                    comment_.append(comment);
                }
            }
            for (let i = 0; i < data.length; i++) {
                if (data[i].comment_id != null) {
                    comment = $("#template").clone();
                    comment.attr("id", data[i].id);
                    comment.css("display", "block");
                    comment.find(".username").text(data[i].user.username);
                    comment.find(".create_time").text(data[i].create_time);
                    comment.find(".content").text(data[i].content);
                    $("#" + data[i].comment_id).children(".comment-children").append(comment);
                }
            }
        }
    )

</script>
<script>

    function init() {
        tocbot.init({
            // Where to render the table of contents.
            tocSelector: '.js-toc',
            // Where to grab the headings to build the table of contents.
            contentSelector: '.js-toc-content',
            // Which headings to grab inside of the contentSelector element.
            headingSelector: 'h1, h2, h3, h4, h5, h6',
            // For headings inside relative or absolute positioned containers within content.
            hasInnerContainers: true,
        });
    }

    window.onload = function () {
        setTimeout(init, 50);
    }
</script>
</html>
