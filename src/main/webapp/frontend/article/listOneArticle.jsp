<%@page import="com.artLikeHate.model.ArtLikeHateVO"%>
<%@page import="com.artLikeHate.model.ArtLikeHateService"%>
<%-- <%@page import="org.apache.jasper.tagplugins.jstl.core.Param"%> --%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.article.model.*"%>
<%@ page import="com.article_comment.model.*"%>

<%
ArticleVO articleVO = (ArticleVO) request.getAttribute("articleVO"); //EmpServlet.java(Concroller), 存入req的empVO物件
Article_commentService article_commentSvc = new Article_commentService();
Integer article_id = articleVO.getArticle_id();
List<Article_commentVO> list = article_commentSvc.getAll(article_id);
pageContext.setAttribute("list", list);
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>文章查詢結果</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

    <style>
        .none {
            height: 80px;
        }

        .title {
            width: 75%;
            height: 40px;
            background-color: #33b5e5;
            position: relative;
            left: 50%;
            transform: translate(-50%);
            display: flex;
            align-items: center;
        }

        #sort {
            color: white;
            font-size: 24px;
            font-weight: 700;
        }

        .author_block {
            width: 75%;
            height: 80px;
            position: relative;
            left: 50%;
            transform: translate(-50%);
        }

        .row {
            margin: 0;
        }

        .col-9,
        .col-3 {
            padding: 10px 0;
        }

        .popular {
            text-align: right;
        }

        .like {
            font-size: 12px;
            color: lightcoral;
        }

        .dislike {
            font-size: 12px;
            color: gray;
        }

        .ptime {
            padding: 0;
            font-size: 8px;
            color: rgb(137, 137, 137);
        }

        hr {
            width: 75%;
            position: relative;
            left: 50%;
            transform: translate(-50%);
        }

        .content {
            width: 75%;
            min-height: 200px;
            position: relative;
            left: 50%;
            transform: translate(-50%);
        }

        .comment {
            width: 75%;
            position: relative;
            left: 50%;
            transform: translate(-50%);
            background-color: rgb(230, 230, 230);
            align-items: center;
            padding: 30px;
        }

        .insert {
            width: 700px;
        }

        .edit_block {
            width: 75%;
            position: relative;
            left: 50%;
            transform: translate(-50%);
        }

        .edit {
            text-align: right;
            white-space: nowrap;
        }

        #delete {
            display: inline;
        }

        #aedit {
            display: inline;
        }

        .addComment {
            width: 100%;
            white-space: nowrap;
            display: flex;
        }

        div.comments {
            display: grid;
            grid-template-columns: 60px 80px auto;
            padding: 10px;
        }

        div.comments>div {
            text-align: left;
        }

        div.comments>div:first-child {
            /* 	background: #1E90FF; */
            grid-row-start: 1;
            grid-row-end: 3;
        }

        .cimg {
            display: flex;
            height: 60px;
            align-items: center;
            justify-content: center;
            color: #1E90FF;
        }

        .cname,
        .ccontent {
            height: 30px;
            display: flex;
            align-items: flex-end;
        }

        .ctime,
        .c {
            height: 30px;
            display: flex;
            align-items: top;
        }

        .cname {
            color: #1E90FF;
            font-weight: 700;
        }

        .ctime {
            color: gray;
            font-size: 12px;
        }

        #logo {
            width: 100px;
            height: 40px;
        }

        .upPic {
            width: 60px;
            height: 60px;
        }

        .author {
            color: #1E90FF;
            font-weight: 700;
        }

        form {
            display: flex;
        }

        .lhbtn {
            width: 50px;
            display: inline;
        }
    </style>
</head>

<body>

    <nav class="navbar navbar-expand-lg bg-light fixed-top">
        <div class="container-fluid">
            <a class="navbar-brand" href="<%=request.getContextPath() %>/frontend/article/select_page.jsp"><img
                    id="logo" src="<%=request.getContextPath() %>/frontend/article/img/logo.png"></a>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                </ul>
                <form class="d-flex" role="search">
                    <input class="form-control me-2" type="search" placeholder="請輸入文章編號">
                    <button class="btn btn-outline-info text-nowrap" type="submit">查詢</button>
                </form>
            </div>
        </div>
    </nav>
    <div class="none"></div>
    <div class="container">
        <div class="title">
            <jsp:useBean id="article_sorttypeSvc" scope="page"
                class="com.article_sorttype.model.Article_sorttypeService" />
            <jsp:useBean id="article_identitySvc" scope="page"
                class="com.article_identity.model.Article_identityService" />   
            <span id="sort">【${articleVO.article_sorttypeVO.sort_content}】${articleVO.article_title}</span>
        </div>
        <div class="author_block row">
            <div class="author col-9">
                ${articleVO.article_identityVO.article_pic}&ensp;<span class="author">作者${articleVO.mem_id}</span>
            </div>
            <div class="popular col-3">
            
                <span class="like">推 <span class="like" id="likeNum">${articleVO.artLike}</span></span>
                <span class="dislike">噓 <span class="hate" id="hateNum">${articleVO.artHate}</span></span>
            </div>
            <div class="ptime">發文時間:${articleVO.article_publish}</div>
        </div>
        <br>
        <hr>
        <div class="content">${articleVO.article_content}</div>
        <div class="row edit_block">
            <div class="like_button col-3">
            	<form method=post id="set" class="lhbtn">
                    <input type="hidden" name="mem_id" value=1>
                    <input type="hidden" name="article_id" value="${param.article_id}">
                    <input type="hidden" name="like_status" value=3>
                    <input type="hidden" name="action" value="insert">
                </form>
                <form method=post id="likeForm" class="lhbtn">
                    <img src="<%=request.getContextPath() %>/frontend/article/img/good.png" width="50px" height="50px"
                        class="good" id="like">
                    <input type="hidden" name="mem_id" value=3>
                    <input type="hidden" name="article_id" value="${param.article_id}">
                    <input type="hidden" name="like_status" value=1>
                    <input type="hidden" name="action" value="insert">
                </form>

                <form method=post id="hateForm" class="lhbtn">
                    <img src="<%=request.getContextPath() %>/frontend/article/img/bad.png" width="50px" height="50px"
                        class="bad" id="hate">
                    <input type="hidden" name="mem_id" value=3>
                    <input type="hidden" name="article_id" value="${param.article_id}">
                    <input type="hidden" name="like_status" value=2>
                    <input type="hidden" name="action" value="insert">
                </form>
            </div>
            <div class="col-6"></div>
            <div class="edit col-3">

                <form method="post" action="/CGA104G1/ArticleServlet" id="delete">
                    <button type="submit" class="btn btn-outline-danger" value="刪除">刪除文章</button>
                    <input type="hidden" name="article_id" value="${articleVO.article_id}"> 
                    <input type="hidden" name="action" value="delete">
                </form>
                <form method="post" action="/CGA104G1/ArticleServlet" id="aedit">
                    <button type="submit" class="btn btn-outline-warning" value="修改">編輯文章</button>
                    <input type="hidden" name="article_id" value="${articleVO.article_id}"> 
                    <input type="hidden" name="action" value="getOne_For_Update">
                </form>

            </div>
        </div>

        <div class="comment">

            <c:forEach var="article_commentVO" items="${list}">

                <div class="comments">
                    <div class="cimg">${article_commentVO.article_identityVO.article_pic}</div>
                    <div class="cname">&ensp;${article_commentVO.mem_id}</div>
                    <div class="ccontent">${article_commentVO.com_content}</div>
                    <div class="ctime">&ensp;${article_commentVO.com_publish}</div>
                    <div class="c"></div>
                </div>
            </c:forEach>

            <div class="addComment">
                <form method="post" action="/CGA104G1/Article_commentServlet">
                    <input type="hidden" name="article_id" value="${param.article_id}">
                    <input type="hidden" name="mem_id" value=4>
                    <input type="hidden" name="action" value="insert">
                    <input type="text" class="form-control insert" name="com_content" value="${param.com_content}"
                        placeholder="跟樓主說點話吧!">&ensp;
                    <button type="submit" class="btn btn-info">送出</button>
                </form>

            </div>
            <div class="test"></div>
            <div class="test2"></div>
        </div>

        <script src="https://code.jquery.com/jquery-3.6.1.js"
            integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
        <script>
            $(".good").mouseenter(function () {
                $(this).attr("src", "<%=request.getContextPath() %>/frontend/article/img/good2.png");
            })
            $(".good").mouseleave(function () {
                $(".good").attr("src", "<%=request.getContextPath() %>/frontend/article/img/good.png");
            })

            $(".bad").mouseenter(function () {
                $(this).attr("src", "<%=request.getContextPath() %>/frontend/article/img/bad2.png");
            })
            $(".bad").mouseleave(function () {
                $(".bad").attr("src", "<%=request.getContextPath() %>/frontend/article/img/bad.png");
            })

            
            $(".good").click(function () {
            	$.ajax({
                    type: "POST",
                    url: "/CGA104G1/ArtLikeHateServlet",
                    data: $("#likeForm").serialize(),
                    dataType: "json",

                    success: function (response) {
                        $("#likeNum").html(response.like);
                        $("#hateNum").html(response.hate);
                        let status = response.status;
                        $("#like").attr("src", "<%=request.getContextPath() %>/frontend/article/img/good2.png") 
                        $(".good").attr("class", "good2");  
                        $("#hate").attr("src", "<%=request.getContextPath() %>/frontend/article/img/bad.png") 
                        $(".bad").attr("class", "bad");
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        alert(xhr.status + "\n" + thrownError);
                    }
                });
            });
            $(".bad").click(function () {
            	$.ajax({
                    type: "POST",
                    url: "/CGA104G1/ArtLikeHateServlet",
                    data: $("#hateForm").serialize(),
                    dataType: "json",

                    success: function (response) {
                        $("#likeNum").html(response.like);
                        $("#hateNum").html(response.hate);
                        $("#hate").attr("src", "<%=request.getContextPath() %>/frontend/article/img/bad2.png") 
                        $(".bad").attr("class", "bad2");
                        $("#like").attr("src", "<%=request.getContextPath() %>/frontend/article/img/good.png") 
                        $(".good").attr("class", "good"); 

                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        alert(xhr.status + "\n" + thrownError);
                    }
                });
            });
        </script>
</body>

</html>