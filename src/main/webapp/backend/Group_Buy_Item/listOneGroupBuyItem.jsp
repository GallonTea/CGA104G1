<%@page import="com.group_buy_item.model.Group_Buy_ItemVO"%>
<%@ page import="com.group_buy_item.model.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
Group_Buy_ItemVO group_Buy_ItemVO = (Group_Buy_ItemVO) request.getAttribute("Group_Buy_ItemVO");
%>
<%@include file="/backend/backNavbar.jsp"%>
<html>
<head>
<title>單一團購商品資料 - listOneGroupBuyItem.jsp</title>

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
<body bgcolor='white'>

	<table id="table-1">
		<tr>
			<td>
				<h3>單一團購商品資料 - listOneGroupBuyItem.jsp</h3>
				<h4>
					<a href="<%=request.getContextPath()%>/backend/Group_Buy_Item/select_page.jsp">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<table>
		<tr>
			<th>團購商品編號</th>
			<th>團購商品名稱</th>
			<th>團購商品內容</th>
			<th>團購商品價格</th>
			<th>團購商品狀態</th>
			<th>團購商品上檔日期</th>
			<th>團購商品下檔日期</th>
		</tr>
		<tr>
			<td><%=group_Buy_ItemVO.getGbitem_id()%></td>
			<td><%=group_Buy_ItemVO.getGbitem_name()%></td>
			<td><%=group_Buy_ItemVO.getGbitem_content()%></td>
			<td><%=group_Buy_ItemVO.getGbitem_price()%></td>
			<td><%=group_Buy_ItemVO.getGbitem_status()%></td>
			<td><%=group_Buy_ItemVO.getGbitem_startdate()%></td>
			<td><%=group_Buy_ItemVO.getGbitem_enddate()%></td>

		</tr>
	</table>

</body>
</html>