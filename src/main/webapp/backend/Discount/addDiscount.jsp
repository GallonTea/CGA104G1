<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.discount.model.DiscountVO"%>
<%@ page import="java.util.*"%>
<%
DiscountVO discountVO = (DiscountVO) request.getAttribute("DiscountVO");
%>
<%@include file="/backend/backNavbar.jsp"%>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>團購折扣資料新增 - addDiscount.jsp</title>

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
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
}

table, th, td {
	border: 0px solid #CCCCFF;
}

th, td {
	padding: 1px;
}
</style>

</head>
<body bgcolor='white'>

	<table id="table-1">
		<tr>
			<td>
				<h3>團購折扣資料新增 - addDiscount.jsp</h3>
			</td>
			<td>
				<h4>
					<a href="<%=request.getContextPath()%>/backend/Discount/select_page.jsp">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<h3>資料新增:</h3>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Discount/Discount.do" name="form1">
		<table>
<!-- 			<tr> -->
<!-- 				<td>折扣編號:<font color=red><b>*</b></font></td> -->
<!-- 				<td><input type="TEXT" name="discount_id" size="45" -->
<%-- 					value="<%=(discountVO == null) ? "數字" : discountVO.getDiscount_id()%>" /></td> --%>
<!-- 			</tr> -->
			<tr>
				<td>團購商品編號:<font color=red><b>*</b></font></td>
				<td><input type="TEXT" name="gbitem_id" size="45" placeholder = "1"
					value="<%=(discountVO == null) ? "1" : discountVO.getGbitem_id()%>" /></td>
			</tr>
			<tr>
				<td>商品數量下限:<font color=red><b>*</b></font></td>
				<td><input type="TEXT" name="discount_minamount" size="45" placeholder = "0"
					value="<%=(discountVO == null) ? "0" : discountVO.getDiscount_minamount()%>" /></td>
			</tr>
			<tr>
				<td>商品數量上限:<font color=red><b>*</b></font></td>
				<td><input type="TEXT" name="discount_maxamount" size="45" placeholder = "0"
					value="<%=(discountVO == null) ? "0" : discountVO.getDiscount_maxamount()%>" /></td>
			</tr>
			<tr>
				<td>折扣價格:<font color=red><b>*</b></font></td>
				<td><input type="TEXT" name="discount_price" size="45" placeholder = "0"
					value="<%=(discountVO == null) ? "0" : discountVO.getDiscount_price()%>" /></td>
			</tr>
			<tr>
				<td>折扣說明:<font color=red><b>*</b></font></td>
				<td><input type="TEXT" name="discount_nar" size="45" placeholder = "請輸入文字"
					value="<%=(discountVO == null) ? "請輸入文字" : discountVO.getDiscount_nar()%>" /></td>
			</tr>
			

		</table>
		<br> 
		<input type="hidden" name="action" value="insert">
		<input type="submit" value="送出新增">
	</FORM>
</body>