<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.discount.model.*"%>

<%
DiscountService discountService = new DiscountService();
List<DiscountVO> list = discountService.getAll();
pageContext.setAttribute("list", list);
%>
<html>
<head>
<meta charset="UTF-8">
<title>所有團購折扣</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/static/css/backend.css">
<style>
table#table-1 {
	background-color: #CCCCFF;
	border: 2px solid black;
	text-align: center;
}

table#table-1 h4 {
	color: red;
	display: block;
	margin-bottom: 1px;
}

h4 {
	color: blue;
	display: inline;
}
</style>

<style>
table {
	width: 800px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
}

table, th, td {
	border: 1px solid #CCCCFF;
}

th, td {
	padding: 5px;
	text-align: center;
	color: black;
}
</style>
</head>
<body>


<!-- 複製起點 -->
	<nav><%@include file="/backend/topNavbar.jsp"%></nav>
	<main>
		<%@include file="/backend/leftside.jsp"%>
		<section>
<!-- 		把原本body的東西貼到這邊 -->
<a href="select_page.jsp">回首頁</a>
	<table>
		<tr>
			<th>折扣編號</th>
			<th>團購商品編號</th>
			<th>商品數量下限</th>
			<th>商品數量上限</th>
			<th>折扣價格</th>
			<th>折扣說明</th>
		</tr>
		<c:forEach var="DiscountVO" items="${list}">
			<tr>
				<td>${DiscountVO.discount_id}</td>
				<td>${DiscountVO.gbitem_id}</td>
				<td>${DiscountVO.discount_minamount}</td>
				<td>${DiscountVO.discount_maxamount}</td>
				<td>${DiscountVO.discount_price}</td>
				<td>${DiscountVO.discount_nar}</td>
				
				<td>
				  <FORM METHOD="post" ACTION="DiscountServlet" style="margin-bottom: 0px;">
				     <input type="submit" value="修改">
				     <input type="hidden" name="discount_id"  value="${DiscountVO.discount_id}">
				     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
				</td>
				<td>
				  <FORM METHOD="post" ACTION="DiscountServlet" style="margin-bottom: 0px;">
				     <input type="submit" value="刪除">
				     <input type="hidden" name="discount_id"  value="${DiscountVO.discount_id}">
				     <input type="hidden" name="action" value="delete"></FORM>
				</td>
				</tr>
		</c:forEach>
		</section>
	</main>
<!-- 複製終點 -->



		
</body>
</html>