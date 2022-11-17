<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.article.model.*"%>

<%
    ArticleService articleSvc = new ArticleService();
    List<ArticleVO> list = articleSvc.getAll();
    pageContext.setAttribute("list",list);
%>

<!DOCTYPE html>
<html>

<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Barei論壇首頁</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
	
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
    crossorigin="anonymous"></script>

<style>
		.none {
            height: 80px;
        }

        .evenarticle {
            background-color: white;
            width: 75%;
            height: 40px;
            position: relative;
            left: 50%;
            transform: translate(-50%);
            display: flex;
            align-items: center;
            padding: 0 10px;
        }

        .title {
            width: 75%;
            height: 30px;
            background-color: #33b5e5;
            position: relative;
            left: 50%;
            transform: translate(-50%);
            display: flex;
            align-items: center;
            padding: 0 10px;
        }

        .ptime {
            width: 80px;
            font-size: 10px;
            color: rgb(105, 105, 105);
            text-align: center;
        }

        .author {
            width: 40px;
            text-align: center;
        }

        .atitle {
            width: 620px;
            text-align: center;
/*             font-weight: 700; */
        }
        
        .atitle_but {
        	font-weight: 700;
        }

        .push {
            width: 40px;
            font-size: 14px;
            font-weight: 700;
            color: lightcoral;
            text-align: center;
        }

        .sort {
            width: 120px;
            font-weight: 700;
            text-align: center;
        }
        
        .btn-outline-dark, .btn-outline-success {
            position: relative;
            left: 777px;
            bottom: 10px;
        }
        
        .atitle_but{
        	background: none;
        	outline: none;
        	border: none;
        }
        
        .titlesty{
        	color: white;
        	font-weight: 700;
        	font-size: 16px;
        }
        
        #logo {
			width: 100px;
			height: 40px;
		}
		
		.evenarticle:nth-child(even) {
			background-color: rgb(240, 240, 240);
		}
		
		.evenarticle:hover {
			background-color: rgb(255, 252, 224);
		}
		
		.form {
			display: flex;
			
		}
</style>
</head>

<body>
	<nav class="navbar navbar-expand-lg bg-light fixed-top">
		<div class="container-fluid">
			<a class="navbar-brand" href="<%=request.getContextPath() %>/frontend/article/select_page.jsp"><img id="logo" src="<%=request.getContextPath() %>/frontend//article/img/logo.png"></a>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				</ul>
				<form class="d-flex" role="search" method="post" action="/CGA104G1/ArticleServlet">
					<input class="form-control me-2" type="search" placeholder="請輸入關鍵字" name="article_id"> 
					<input type="hidden" name="action" value="getOne_For_Display">
					<button class="btn btn-outline-info text-nowrap" type="submit" value="送出">查詢</button>
				</form>
			</div>
		</div>
	</nav>
	
	<div class="none"></div>
    <div class="container">
	    <div class="form">
		    <form action="<%=request.getContextPath() %>/frontend//article/addPic.jsp">
		    <button class="btn btn-outline-dark text-nowrap" type="submit">新增大頭貼</button>
		    </form>
		    <span>&nbsp</span>
		    <form action="<%=request.getContextPath() %>/frontend//article/addArticle.jsp">
		    <button class="btn btn-outline-success text-nowrap" type="submit">我要發文</button>
		    </form>
	    </div>
        <div class="title">
            <div class="push titlesty">推</div>
            <div class="sort titlesty">分類</div>
            <div class="atitle titlesty">標題</div>
            <div class="author titlesty">作者</div>
            <div class="ptime titlesty">發文時間</div>
        </div>
    <jsp:useBean id="article_sorttypeSvc" scope="page" class="com.article_sorttype.model.Article_sorttypeService" />
	<c:forEach var="articleVO" items="${list}">
		<div class="evenarticle">
            <div class="push">${articleVO.article_like}</div>
            <div class="sort">【${articleVO.article_sorttypeVO.sort_content}】</div>
            <div class="atitle">
            <form method="post" action="/CGA104G1/ArticleServlet"> 
           			<input type="hidden" name="article_id" value="${articleVO.article_id}">
					<input type="hidden" name="action" value="getOne_For_Display">
					<input class="atitle_but" type="submit" value="${articleVO.article_title}">
			</form>
            
            </div>
            <div class="author">${articleVO.mem_id}</div>
            <div class="ptime">${articleVO.article_publish}</div>
        </div>
	</c:forEach>
    </div>

<script>

</script>
</body>

</html>