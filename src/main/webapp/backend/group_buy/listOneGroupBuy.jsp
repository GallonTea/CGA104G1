<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.group_buy.model.*"%>
<%@ page import="java.util.*"%>

<%
Group_BuyVO group_BuyVO = (Group_BuyVO) request.getAttribute("Group_BuyVO");
%>

<%@include file="/backend/backNavbar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>單一團購團資料 - listOneGroupBuy.jsp</title>

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
	width: 600px;
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
<h3>單一團購團資料 - listOneGroupBuy.jsp</h3>
				<h4>
					<a href="<%=request.getContextPath()%>/backend/group_buy/select_page.jsp">回首頁</a>
				</h4>
				
				<table>
		<tr>
			<th>團購團編號</th>
			<th>團購主編號</th>
			<th>團購商品編號</th>
			<th>團購人數低標</th>
			<th>目前參團人數</th>
			<th>團購開始</th>
			<th>團購結束</th>
			<th>團購狀態</th>
		</tr>
			<tr>
				<td>${Group_BuyVO.gb_id}</td>
				<td>${Group_BuyVO.mem_id}</td>
				<td>${Group_BuyVO.gbitem_id}</td>
				<td>${Group_BuyVO.gb_min}</td>
				<td>${Group_BuyVO.gb_amount}</td>
				<td>${Group_BuyVO.gbstart_date}</td>
				<td>${Group_BuyVO.gbend_date}</td>
<%-- 				<td>${Group_BuyVO.gb_status}</td> --%>
				<c:if test="${Group_BuyVO.gb_status == '0'}"><td><c:out value="參團人數不足"></td></c:out></c:if>
				<c:if test="${Group_BuyVO.gb_status == '1'}"><td><c:out value="參團人數已達標"></td></c:out></c:if>
				</table>
</body>
</html>