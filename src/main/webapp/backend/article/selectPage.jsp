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
            width: 100%;
            height: 40px;
            position: relative;
            left: 50%;
            transform: translate(-50%);
            display: flex;
            align-items: center;
            white-space: nowrap;
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
            font-size:8px;
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
        
        .realStatus{
        	color: red;
        	font-weight: 700;
        }
        
        .slvStatus{
        	color: green;
        	font-weight: 700;
        }

        .repResult {
            width: 90px;
            padding: 0 10px;
            text-align: center;
        }

        .repEmp {
            width: 120px;
            padding: 0 10px;
            text-align: center;
        }
        
        .repBack{
        	font-weight: 700;
        }
        
        .repScs{
        	color: red;
        	font-weight: 700;
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
        
        #home-tab, #profile-tab {
        	border: none;
        }
        
        .accordion-button{
        	width: 100%;
        }
        
        .accordion-header{
        	display: flex;
        	white-space: nowrap;
        	justify-content: center;
        	align-items: center;
        }
        
        #deleteArt {
        	display: flex;
        	height: 40px;
        	justify-content: center;
        	align-items: center;
        }
        
        .evenarticle:nth-child(even) {
			background-color: rgb(240, 240, 240);
		}
        
        /* 設定文章檢舉內容及文章 */
        .insideTitle{
        	background-color: black;
        	color: white;
        	font-weight: 700;
        	display: flex;
        	justify-content: center;
        	align-items: center;   
        	padding-left: 10px;
        }
        
        .insideContent{
        	display: flex;
        	justify-content: center;
        	padding-top: 10px;
        	margin-bottom: 15px;
        	padding-left: 10px;
        }
        
        .reporter{
        	width: 30%;
        }
        
        .reason{
        	width: 70%;
        }
        
        .upPic{
        	width:40px;
        	height: 40px;
        }
        
        [aria-expanded="true"].accordion-button{
        	background-color: hsla(168, 100%, 50%, 0.2);
            clip-path: inset(0px round 10px);
            animation: huerotate 6s infinite linear;
            filter: hue-rotate(360deg);
        }

        @keyframes huerotate {
            0% {
                filter: hue-rotate(0deg);
            }

            100% {
                filter: hue-rotate(360deg);
            }
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
                    
                    <c:forEach var="article_reportVO" items="${list1}" varStatus="count">
                    <div class="accordion-item">
				    <h2 class="accordion-header" id="heading${count.index}" />
				      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${count.index}" aria-expanded="false" aria-controls="collapse${count.index}">
                        <div class="status">
                        <c:if test="${article_reportVO.afrep_status == 0}">
                        <span class="realStatus">未處理</span>
                        </c:if>
                        </div>
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
                        </form>&nbsp;
                        <form method="post" id="deleteArt" action="/CGA104G1/EMPArticle_reportServlet">
                        	<input type="hidden" name="action" value="hideArticle">
                        	<input type="hidden" name="afrep_result" value="2">
                        	<input type="hidden" name="afrep_status" value="1">
                        	<input type="hidden" name="emp_id" value="3">
                        	<input type="hidden" name="afrep_id" value="${article_reportVO.afrep_id}">
                        	<input type="hidden" name="article_id" value="${article_reportVO.article_id}">
                        	<button type="submit" class="btn btn-danger">刪除文章</button>
                        </form>              
                    </div>
				      </button>
				    </h2>
				    <div id="collapse${count.index}" class="accordion-collapse collapse" aria-labelledby="heading${count.index}" data-bs-parent="#accordionExample">
				      <div class="accordion-body">
				      	<div class="insideTitle">
				      		<div class="reporter">檢舉人</div>
				      		<div class="reason">檢舉原因</div>
				      	</div>
				      	<div class="insideContent">
				      		<div class="reporter">${article_reportVO.article_identityVO.article_pic}&ensp;${article_reportVO.memVO.mem_account}</div>
				      		<div class="reason">${article_reportVO.afrep_content}</div>
				      	</div>
				      	
				      	<div class="insideTitle">
				      		<div class="reporter">文章作者</div>
				      		<div class="reason">文章內容</div>
				      	</div>
				      	<div class="insideContent">
				      		<div class="reporter">${article_reportVO.articleVO.article_identityVO.article_pic}&ensp;${article_reportVO.articleVO.memVO.mem_account}</div>
				      		<div class="reason">${article_reportVO.articleVO.article_content}</div>
				      	</div>
				      	
				      </div>
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
                        <div class="repResult">申訴結果</div>
                        <div class="repEmp">處理人員</div>
                    </div>
                    <c:forEach var="article_reportVO" items="${list2}">
                    <div class="evenarticle">
                        <div class="status">
							<c:if test="${article_reportVO.afrep_status == 1}">
                        	<span class="slvStatus">已處理</span>
                        	</c:if>
						</div>
                        <div class="sort">${article_reportVO.articleVO.article_sorttypeVO.sort_content}</div>
                        <div class="atitle">${article_reportVO.articleVO.article_title}</div>
                        <div class="repTime">${article_reportVO.afrep_date}</div>
                        <div class="repResult">
							<c:if test="${article_reportVO.afrep_result == 1}">
                        	<span class="repBack">檢舉駁回</span>
                        	</c:if>
							<c:if test="${article_reportVO.afrep_result == 2}">
                        	<span class="repScs">刪文</span>
                        	</c:if>
						</div>
                        <div class="repEmp">${article_reportVO.empVO.emp_name}</div>
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