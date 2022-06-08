<%--
  Created by IntelliJ IDEA.
  User: xck
  Date: 2022/1/4
  Time: 21:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>内容</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/editor-md/css/editormd.preview.min.css">
</head>
<style>
    .title{
        text-align: center;
    }

    .comment{
        margin-top: 10px;
        margin-bottom: 20px;
    }
</style>
<body>
<jsp:include page="head.jsp"/>
<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading"><a href="#">${blog.admin.username}</a>  ${blog.create_time}</div>
        <div class="panel-body">

            <h2 class="title">${blog.title}</h2>
            <div id="editor" class="content">
                <textarea>${blog.content}</textarea>
            </div>
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">评论</div>
        <div class="panel-body" id="body">
        </div>
    </div>
    <div id="comment">
        <form action="${pageContext.request.contextPath}/comment/add">
            <input id="comment_id" type="hidden" name="comment_id">
            <input type="hidden" name="blog_id" value="${blog.id}">
            <textarea class="form-control" rows="7" name="content" placeholder="请输入评论信息"></textarea>
            <button type="submit" style="margin-top: 10px" class="btn btn-success pull-right">提交</button>
            <button type="button" style="margin-top: 10px; margin-right: 20px" id="reset" class="btn btn-info pull-right">取消回复</button>
        </form>
    </div>
</div>

<div class="comment hidden" id="template">
    <p><span class="username">用户名称</span> <span class="col-xs-offset-2 create_time">评论时间</span></p>
    <p class="content">评论内容</p>
    <a href="#comment" class="col-xs-offset-1 huifu">回复</a>
    <div class="comment-children col-xs-offset-1">
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
                if(data[i].comment_id == null){
                    comment = $("#template").clone();
                    comment.attr("id", data[i].id);
                    comment.removeClass("hidden");
                    comment.find(".username").text(data[i].user.username);
                    comment.find(".create_time").text(data[i].create_time);
                    comment.find(".content").text(data[i].content)
                    comment_.append(comment);
                }
            }
            for (let i = 0; i < data.length; i++) {
                if(data[i].comment_id != null){
                    comment = $("#template").clone();
                    comment.attr("id", data[i].id);
                    comment.removeClass("hidden");
                    comment.find(".username").text(data[i].user.username);
                    comment.find(".create_time").text(data[i].create_time);
                    comment.find(".content").text(data[i].content);
                    $("#" + data[i].comment_id).children(".comment-children").append(comment);
                }
            }
        }
    )

</script>
</html>
