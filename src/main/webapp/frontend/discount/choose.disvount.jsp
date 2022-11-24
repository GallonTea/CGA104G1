<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.discount.model.*"%>
<%@ page import="com.group_buy_item.model.*"%>

<%
DiscountService discountSvc = new DiscountService();
Integer gbitem_id = (Integer) session.getAttribute("gbitem_id");
List<DiscountVO> list = discountSvc.getoneGbitem_id((Integer)session.getAttribute("gbitem_id"));
pageContext.setAttribute("list", list);
%>


<%@include file="/backend/backNavbar.jsp"%>
<html>
<head>
<meta charset="UTF-8">
<title>所有團購折扣</title>
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
}
</style>
</head>
<body>
<a href="select_page.jsp">回團購商品選擇</a>
	<table>
		<tr>
			<th>商品</th>
			<th>折扣</th>
			<th>團購數量</th>
			
		</tr>
		
		<c:forEach var="DiscountVO" items="${list}">
			<tr>
				<td>${gbitem_name}</td>
				<td>${DiscountVO.discount_nar}</td>
				<td>${DiscountVO.discount_minamount}</td>
				
				
				
			<td>
				  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backend/discount/DiscountServlet" style="margin-bottom: 0px;">
				     <input type="submit" value="選擇折扣">
				     <input type="hidden" name="discount_id"  value="${DiscountVO.discount_id}">
				     <input type="hidden" name="action"	value="getOne_For_Display_ByUser"></FORM>
				</td>
				</tr>
		</c:forEach>
		</table>
</body>
</html>