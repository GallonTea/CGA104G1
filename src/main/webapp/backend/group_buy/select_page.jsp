<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.group_buy.model.*"%>
<%
Group_BuyService group_BuyService = new Group_BuyService();
List<Group_BuyVO> list = group_BuyService.getAll();
pageContext.setAttribute("list", list);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GroupBuy: Home</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/static/css/backend.css">
</head>
<body>
<nav><%@include file="/backend/topNavbar.jsp"%></nav>
	<main>
		<%@include file="/backend/leftside.jsp"%>
		<section>
			<!--main content start-->
	<section id="main-content">
		<section class="wrapper">
			<div id="gbi-select">
				<%-- 錯誤表列 --%>
				<c:if test="${not empty errorMsgs}">
					<font style="color: red">請修正以下錯誤:</font>
					<ul>
						<c:forEach var="message" items="${errorMsgs}">
							<li style="color: red">${message}</li>
						</c:forEach>
					</ul>
				</c:if>
			<table>
				<ul>
					<li><a href='listAllGroupBuy.jsp' action="">List</a> all Discount. <br>
					<br></li>


					<li>
						<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/GroupBuyServlet">
							<b>輸入團購團編號:</b> 
							<input type="text" name="gb_id"> 
							<input type="hidden" name="action" value="getOne_For_Display">
							<input type="submit" value="送出">
						</FORM>
					</li>

<%-- 					<jsp:useBean id="gbSvc" scope="page"class="com.group_buy.model.Group_BuyService" /> --%>

					<li>
						<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/GroupBuyServlet">
							<b>選擇團購團編號:</b> <select size="1" name="gb_id">
								<c:forEach var="Group_BuyVO" items="${list}">
									<option value="${Group_BuyVO.gb_id}">${Group_BuyVO.gb_id}
								</c:forEach>
							</select> 
							<input type="hidden" name="action" value="getOne_For_Display">
							<input type="submit" value="送出">
						</FORM>
					</li>

				</ul>


				<h3>團購團管理</h3>

				<ul>
					<li><a href='addGroupBuy.jsp'>Add</a> a new groupBuy.</li>
				</ul>
			</table>
			</div>
		</section>
	</section>

	<!--main content end-->
		</section>
	</main>






</body>
</html>