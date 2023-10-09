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
    <link href="${pageContext.request.contextPath}/static/css/rainbow.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/js/highlight.min.js"></script>
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

    #reset{
        display: none;
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
            top: 1%;
            right: 20px;
            width: 15%;
        }
    }

    pre ol span {
        white-space: pre;
    }

    pre {
        position: relative;
        background: #21252b!important;
        border-radius: 5px;
        font: 15px/22px "Microsoft YaHei", "Arial", Sans-Serif;
        line-height: 1.6;
        margin-bottom: 1.6em;
        max-width: 100%;
        overflow: auto;
        text-shadow: none;
        color: #000;
        padding-top: 30px;
        box-shadow: 0 10px 10px 0 rgb(0 0 0 / 40%);
    }

    .editormd-html-preview pre.prettyprint{
        border: 0;
    }

    li.L1, li.L3, li.L5, li.L7, li.L9 {
        background: none;
    }

    pre {
        position: relative ;
        padding: 30px 10px 10px 10px !important;
    }

    pre::after {
        display: block;
        content: " ";
        position: absolute;
        border-radius: 50%;
        background: #ff5f56;
        width: 12px;
        height: 12px;
        top: 0;
        left: 12px;
        margin-top: 12px;
        -webkit-box-shadow: 20px 0 #ffbd2e, 40px 0 #27c93f;
        box-shadow: 20px 0 #ffbd2e, 40px 0 #27c93f;
    }

    .markdown-body pre li {
        border-left: 1px solid #6c7978;
        padding-left: 10px
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
                <div class=""><a href="${pageContext.request.contextPath}/about">${blog.admin.username}</a> ${blog.create_time}</div>
                <div class="">
                    <h2 class="title">${blog.title}</h2>
                    <div id="editor" class="content js-toc-content">
                        <textarea>${blog.content}</textarea>
                    </div>
                </div>
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
    $(function () {
        editormd.markdownToHTML('editor', {
            htmlDecode: 'style,script,iframe'
        })
        $('pre code').each(function(i, block){
            hljs.highlightBlock(block)
        })
    })

</script>
<script>

    function init() {
        tocbot.init({
            // Where to render the table of contents.
            tocSelector: '.js-toc',
            // Where to grab the headings to build the table of contents.
            contentSelector: '.js-toc-content',
            // Which headings to grab inside of the contentSelector element.
            headingSelector: 'h1, h2, h3',
            // For headings inside relative or absolute positioned containers within content.
            hasInnerContainers: true,
        });
    }

    window.onload = function () {
        setTimeout(init, 50);
    }
</script>
</html>
