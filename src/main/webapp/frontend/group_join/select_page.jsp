<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>


<html>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<head>

<title>團購</title>
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
			<td><h3>參團</h3></td>
		</tr>
	</table>

	<ul>
		<li><a href='#'>回團購團首頁</a> <br> <br></li>
		<li>
			<FORM METHOD="post" ACTION="/CGA104G1/Group_Buy_OrderServlet"
				name="form1">


				<b><font color=blue>萬用複合查詢:</font></b> <br> <span>輸入團購訂單編號:</span>
				<input type="text" name="gborder_id"><br> <span>輸入團購商品編號:</span>
				<input type="text" name="gbitem_id"><br> <span>輸入團購團編號:</span>
				<input type="text" name="gb_id"><br> <span>輸入購買數量:</span>
				<input type="text" name="gbitem_amount"><br> <span>輸入團購價:</span>
				<input type="text" name="gb_endprice"><br> <span>輸入團購訂單時間:</span>
				<input type="text" name="gborder_date" id="f_date1"><br>
				<span>輸入付款方式:</span> <select name="gborder_paying">
					<option value=" " selected></option>
					<option value="0">貨到付款</option>
					<option value="1">ATM轉帳</option>
					<option value="2" >信用卡</option>
				</select><br> <span>輸入送貨方式:</span> <select name="gborder_send">
					<option value=" "selected></option>
					<option value="0" >宅配</option>
					<option value="1">便利商店</option>	
				</select><br> <span>輸入訂單狀態:</span>
					<select name="gborder_status">
					<option value=" "selected></option>
					<option value="0" >等待付款中</option>
					<option value="1">已取消</option>
					<option value="2">等待賣家確認中</option>
					<option value="3">準備出貨中</option>
					<option value="4">已出貨</option>
					<option value="5">未取貨，退回平台</option>
					<option value="6">已取貨</option>
					<option value="7">退貨</option>
					<option value="8">換貨</option>
				</select><br> <span>輸入收件人:</span> <input
					type="text" name="receiver_name"><br> <span>輸入收件人地址:</span>
				<input type="text" name="receiver_address"><br> <span>輸入收件人電話:</span>
				<input type="text" name="receiver_phone"><br> 
				<span>輸入領貨時間:</span>
				<input type="text" name="pickup_time" id="f_date2"><br>	

				<input type="submit" value="送出"> <input type="hidden"
					name="action" value="listgroup_buy_order">
			</FORM>
		</li>
	</ul>

</body>
</html>