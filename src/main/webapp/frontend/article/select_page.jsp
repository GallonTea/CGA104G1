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
		/*設定版型及背景*/
		.none {
            height: 80px;
        }
        
        .container{
        	width: 70%;
        	float: left;
        }
        
        .container2 {
        	display: block;
        	width: 30%;
        	float: right;
        }
        
        body::-webkit-scrollbar {
    		display: none;
		}

        .evenarticle {
            background-color: white;
            width: 100%;
            height: 40px;
            display: flex;
            align-items: center;
            padding: 0 10px;
        }

        .title {
            width: 100%;
            height: 30px;
            background-color: #33b5e5;
            display: flex;
            align-items: center;
            padding: 0 10px;
        }

        .ptime {
            width: 100px;
            font-size: 10px;
            color: rgb(105, 105, 105);
            text-align: center;
        }

        .author {
            width: 140px;
            text-align: center;
        }

        .atitle {
            width: 500px;
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
		
		.displayBox{
		    background-color:white;
		    margin-right:20px;
		    box-shadow:-3px -3px 9px gray;
		    margin-bottom: 20px;
        }
		
		/* 設定動作區塊 */
		.form{
			width:100%;
			height: 150px;
			text-align: center;
			padding-right: 10px;
		}
		
		.act{
			width: 300px;
			margin-bottom: 5px;
			float: right;
		}
		
		/* 設定廣告區塊 */
		.ad {
			width:320px;
			height: 320px;
			background-color: pink;
			float: right;
		}
</style>
</head>

<body>
<!-- 	<nav class="navbar navbar-expand-lg bg-light fixed-top"> -->
<!-- 		<div class="container-fluid"> -->
<%-- 			<a class="navbar-brand" href="<%=request.getContextPath() %>/frontend/article/select_page.jsp"><img id="logo" src="<%=request.getContextPath() %>/frontend//article/img/logo.png"></a> --%>
<!-- 			<div class="collapse navbar-collapse" id="navbarSupportedContent"> -->
<!-- 				<ul class="navbar-nav me-auto mb-2 mb-lg-0"> -->
<!-- 				</ul> -->
<!-- 				<form class="d-flex" role="search" method="post" action="/CGA104G1/ArticleServlet"> -->
<!-- 					<input class="form-control me-2" type="search" placeholder="請輸入關鍵字" name="article_id">  -->
<!-- 					<input type="hidden" name="action" value="getOne_For_Display"> -->
<!-- 					<button class="btn btn-outline-info text-nowrap" type="submit" value="送出">查詢</button> -->
<!-- 				</form> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</nav> -->
	
<!-- 	<div class="none"></div> -->
    <div class="container">
	    <div class="displayBox">
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
            <div class="push">${articleVO.getArtLike()}</div>
            <div class="sort">【${articleVO.article_sorttypeVO.sort_content}】</div>
            <div class="atitle">
            <form method="post" action="/CGA104G1/ArticleServlet"> 
           			<input type="hidden" name="article_id" value="${articleVO.article_id}">
					<input type="hidden" name="action" value="getOne_For_Display">
					<input class="atitle_but" type="submit" value="${articleVO.article_title}">
			</form>
            
            </div>
            <div class="author">${articleVO.memVO.mem_account}</div>
            <div class="ptime">${articleVO.article_publish}</div>
        </div>
	</c:forEach>
    </div>
    </div>
    
    <div class="container2">
    	<div class="form">
		    <form action="<%=request.getContextPath() %>/frontend/article/addPic.jsp">
		    <button class="btn btn-dark text-nowrap act" type="submit">新增大頭貼</button>
		    </form>
		    <form action="<%=request.getContextPath() %>/frontend/article/addArticle.jsp">
		    <button class="btn btn-success text-nowrap act" type="submit">我要發文</button>
		    </form>
		    <form action="<%=request.getContextPath() %>/frontend/chat/groupChat.jsp">
		    <button class="btn btn-warning text-nowrap act" type="submit">加入聊天室</button>
		    </form>
	    </div>
	    <div class="ad">
	    廣告
	    <script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-5289607100016626"
     	crossorigin="anonymous"></script>
			<!-- Barei_320px -->
			<ins class="adsbygoogle"
			     style="display:inline-block;width:320px;height:320px"
			     data-ad-client="ca-pub-5289607100016626"
			     data-adtest="on"
			     data-ad-slot="2187951199"></ins>
			<script>
			     (adsbygoogle = window.adsbygoogle || []).push({});
		</script>
	    </div>
    </div>
    	

<script src="<%=request.getContextPath() %>/resources/static/js/navbar.js"></script>
</body>

</html>