<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/static/css/backend.css">
<head>
<title>參團查詢首頁</title>
<style>


  table#table-1 {
	width: 450px;
	background-color: #212529;
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
h3{
	color: white;
}
</style>

</head>
<body bgcolor='white'>
	<nav><%@include file="/backend/topNavbar.jsp"%></nav>
	<main>
		<%@include file="/backend/leftside.jsp"%>
		<section>
<h3>資料查詢:</h3>
	<table id="table-1">
		<c:forEach var="empVO" items="${list}" begin="0" end="0">
			<tr>
				<td><h3>${empVO.emp_name}</h3></td>
			</tr>
		</c:forEach>
	</table>

	<ul>
	<li>
		<FORM METHOD="post" ACTION="/CGA104G1/Group_Join_backServlet" name="form1">
			<b>參團查詢:</b> <br> 
			<font color=red>${errorMsgs.gb_id}</font><br>
			<font color=red>${errorMsgs.fail}</font> <br>
			<span class="label-desc">團購團編號:</span> 
			<input type="text" name="gb_id" value=""><br> 
			<span>參團會員編號:</span> 
			<input type="text" name="mem_id" value=""><br>
			<div class="select-box">
				<label for="select-box1"> <span>團購付款狀態</span>
				</label> <select name ="gbpay_status">
					<option value=" "selected>請選擇</option>
					<option value="0">未付款</option>
					<option value="1">已付款</option>
				</select>
			</div>
				<div class="select-box">
				<label for="select-box1"> <span>取貨狀態</span>
				</label> <select name ="pickup_status">
					<option value=" " selected>請選擇</option>
					<option value="0">未取貨</option>
					<option value="1">已取貨</option>
				</select>
			</div>
				<div class="select-box">
				<label for="select-box1"> <span>物流狀態</span>
				</label> <select name ="deliver_status">
					<option value=" " selected>請選擇</option>
					<option value="0">未出貨</option>
					<option value="1">已出貨</option>
					<option value="2">配送中</option>
					<option value="3">已送達</option>
				</select>
			</div>
			<input type="submit" value="送出"> <input type="hidden"
				name="action" value="list_group_join">
		</FORM>
		</li>
	</ul>
	
	<a class="btn btn-warning" href="<%=request.getContextPath()%>/backend/group_join/addNewGj.jsp">新增參團資料</a>
	

		</section>
	</main>
	

</body>

</html>