<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.article_report.model.*"%>   
<%@ page import="java.util.*"%> 
<%@ include file="/backend/backNavbar.jsp"%>

<%
    Article_reportService article_reportSvc = new Article_reportService();
    List<Article_reportVO> list1 = article_reportSvc.getAll();
    List<Article_reportVO> list2 = article_reportSvc.getAllSolved();
    pageContext.setAttribute("list1",list1);
    pageContext.setAttribute("list2",list2);
%>
<!DOCTYPE html>
<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>文章檢舉管理</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
    <style>
        .evenarticle {
            background-color: white;
            height: 40px;
            position: relative;
            left: 50%;
            transform: translate(-50%);
            display: flex;
            align-items: center;
        }

        .title {
            height: 30px;
            background-color: #FFC107;
            position: relative;
            left: 50%;
            transform: translate(-50%);
            display: flex;
            align-items: center;
        }

        .repTime {
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
        }

        .sort {
            width: 80px;
            font-weight: 700;
            text-align: center;
            padding-left: 10px;
        }

        .status {
            width: 60px;
            font-weight: 700;
            text-align: center;
            padding-left: 20px;
        }

        .evenarticle:hover {
            background-color: rgb(255, 250, 197);
        }

        .btn-danger, .btn-success {
            height: 30px;
            white-space: nowrap;
            padding: 0 10px;
        }

        #container2 {
            margin-top: 5px;
            padding: 0;
        }

        .repResult {
            width: 90px;
            padding: 0 10px;
        }

        .repEmp {
            width: 90px;
            padding: 0 10px;
        }

        .none {
            width: 60px;
        }
        
        .nav-link.inside {
            background-color: rgb(243, 243, 243) !important;
            color: black !important;
        }

        .nav-link.active {
            background-color: #000000 !important;
            font-weight: 700 !important;
            color: white !important;
        }
        
        .container {
        	padding-top: 20px
        }
        
        .topTitle {
        	font-size:28px;
        	font-weight: 700;
        	text-align: center;
        }
    </style>
</head>

<body>
    <div class="container">

		<h1 class="topTitle">討論區文章檢舉一覽</h1>
        <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item" role="presentation">
                <button class="nav-link  inside active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane"
                    type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true">未處理</button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link inside" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane"
                    type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false">已處理</button>
            </li>

        </ul>
        <div class="tab-content" id="myTabContent">
            <div class="tab-pane fade show active" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab"
                tabindex="0">
                <div class="container" id="container2">
                    <div class="title">
                        <div class="status">狀態</div>
                        <div class="sort">分類</div>
                        <div class="atitle">標題</div>
                        <div class="repTime">檢舉時間</div>

                    </div>
                    <jsp:useBean id="articleSvc" scope="page" class="com.article.model.ArticleService" />
                    <jsp:useBean id="article_sorttypeSvc" scope="page" class="com.article_sorttype.model.Article_sorttypeService" />
                    <c:forEach var="article_reportVO" items="${list1}">
                    <div class="evenarticle">
                        <div class="status">${article_reportVO.afrep_status}</div>
                        <div class="sort">${article_reportVO.articleVO.article_sorttypeVO.sort_content}</div>
                        <div class="atitle">${article_reportVO.articleVO.article_title}</div>
                        <div class="repTime">${article_reportVO.afrep_date}</div>
                        <div class="none"></div>
                        <form method="post" action="/CGA104G1/EMPArticle_reportServlet">
                        	<input type="hidden" name="action" value="updateRes">
                        	<input type="hidden" name="afrep_result" value=1>
                        	<input type="hidden" name="afrep_status" value=1>
                        	<input type="hidden" name="emp_id" value=3>
                        	<input type="hidden" name="afrep_id" value="${article_reportVO.afrep_id}">
                        	<button type="submit" class="btn btn-success">標示為已處理</button>
                        </form>&ensp;
                        <form method="post" action="/CGA104G1/EMPArticle_reportServlet">
                        	<input type="hidden" name="action" value="hideArticle">
                        	<input type="hidden" name="afrep_result" value="2">
                        	<input type="hidden" name="afrep_status" value="1">
                        	<input type="hidden" name="emp_id" value="3">
                        	<input type="hidden" name="afrep_id" value="${article_reportVO.afrep_id}">
                        	<input type="hidden" name="article_id" value="${article_reportVO.article_id}">
                        	<button type="submit" class="btn btn-danger">刪除文章</button>
                        </form>
                        
                        
                    </div>
                    </c:forEach>                   
                </div>
            </div>
            <div class="tab-pane fade" id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">
                <div class="container" id="container2">
                    <div class="title">
                        <div class="status">狀態</div>
                        <div class="sort">分類</div>
                        <div class="atitle">標題</div>
                        <div class="repTime">檢舉時間</div>
                        <div class="repTime">處理時間</div>
                        <div class="repResult">申訴結果</div>
                        <div class="repEmp">處理人員</div>
                    </div>
                    <c:forEach var="article_reportVO" items="${list2}">
                    <div class="evenarticle">
                        <div class="status">${article_reportVO.afrep_status}</div>
                        <div class="sort">${article_reportVO.articleVO.article_sorttypeVO.sort_content}</div>
                        <div class="atitle">${article_reportVO.articleVO.article_title}</div>
                        <div class="repTime">${article_reportVO.afrep_date}</div>
                        <div class="repTime">處理時間</div>
                        <div class="repResult">${article_reportVO.afrep_result}</div>
                        <div class="repEmp">${article_reportVO.emp_id}</div>
                    </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
    crossorigin="anonymous"></script>

</html>