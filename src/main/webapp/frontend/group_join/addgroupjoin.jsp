<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.group_join.model.*"%>
<%@ page import="com.group_buy_item.model.*"%>
<%
Integer gb_id = (Integer) request.getAttribute("gb_id");
Group_JoinVO Group_JoinVO = (Group_JoinVO) session.getAttribute("Group_JoinVO");
%>
<jsp:useBean id="Group_Buy_ItemService" scope="page" class="com.group_buy_item.model.Group_Buy_ItemService" />
<jsp:useBean id="Group_BuyService" scope="page" class="com.group_buy.model.Group_BuyService" />
<jsp:useBean id="MemService" scope="page" class="com.mem.model.MemService" />
<!DOCTYPE html>


<html>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<head>
<title>參團</title>
<style>
table#table-1 {
	width: 450px;
	background-color: #CCCCFF;
	margin-top: 5px;
	margin-bottom: 10px;
	border: 3px ridge Gray;
	height: 80px;
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

</head>
<body bgcolor='white'>
<table id="table-1">
		<tr>
			<td>
				<h3>參團資料新增</h3>
				<h4>
					<a href="#">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<h3>資料新增:</h3>
	<FORM METHOD="post" ACTION="/CGA104G1/Group_JoinServlet" name="form1">
		<table>
			<tr>
				<td>購買商品:</td>
				<td><input type="hidden" name="gbitem_name" size="45"
					value="${gbitem_name}" />${gbitem_name}</td>
			</tr>
			<tr>
				<td>團購團編號:</td>
				<td><input type="hidden" name="gb_id" size="45" value="${gb_id}" />${gb_id}</td>
			</tr>
			<tr>
				<td>團購團名稱:</td>
				<td><input type="hidden" name="gb_name" size="45" value="${gb_name}" />${gb_name}</td>
			</tr>
			
			<tr>
				<td>會員編號:</td>
				<td><input type="hidden" name="mem_id" size="45"
					value="${mem_id}" />${mem_id}</td>
			</tr>
			<tr>
				<td>團購付款狀態:</td>
				<td><input type="hidden" name="gbpay_status" size="45"
					value="0" /> 未付款</td>
			</tr>
			<tr>
				<td>取貨狀態:</td>
				<td><input type="hidden" name="pickup_status" size="45"
					value="0" />未取貨</td>
			</tr>
			
			<tr>
				<td>物流狀態:</td>
				<td><input type="hidden" name="deliver_status" size="45"
					value="0" />未出貨</td>
			</tr>
			<tr>
			<td>購買數量:</td>
			<td>
			<input type="number"  name="gbbuy_amount" min="1" max="${gb_min-gb_amount}" step="1"  required>
			<input type="hidden"  name="gb_price" value="${gb_price}"  readonly>
			</td>
			</tr>		
		</table>
		<br> <input type="hidden" name="action" value="gb_goprice"> <input
			type="submit" value="計算價格" >
		

	</FORM>
</body>
</html>