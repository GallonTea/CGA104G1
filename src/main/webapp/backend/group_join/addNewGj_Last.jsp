<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.group_join.model.*"%>
<%@ page import="com.group_buy.model.*"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="group_buySvc" scope="page" class="com.group_buy.model.Group_BuyService" />
<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService" />
<%@include file="/backend/backNavbar.jsp"%>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<title>團購商品價格計算</title>
<style>
.xdsoft_datetimepicker .xdsoft_datepicker {
	width: 300px; /* width:  300px; */
}

.xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
	height: 151px; /* height:  151px; */
}
</style>


</head>
<body bgcolor='white'>

	<table id="table-1">
		<tr>
			<td>
				<h3>參團資料新增</h3>
			</td>
			<td>
				<h4>
					<a href="select_page.jsp">首頁</a>
				</h4>
			</td>
		</tr>
	</table>
	<h3>參團資料新增:</h3>
<div class= "container">
<Form METHOD="post" ACTION="/CGA104G1/Group_Join_backServlet" name="form1">
		<table>		
		<tr>
				<td>團購編號:</td>
				<td><input type="hidden"  size="10" name = "gb_id"
					value="${group_BuyVO.gb_id}"/>[${group_BuyVO.gb_id}]${group_BuyVO.gb_name}</td>
			</tr>
	
	<tr>
		<td>會員編號</td>
		
		<td>
		<input type="hidden"  size="10" name = "mem_id"
					value="${mem_id}"/>${mem_id}
		</td>		
	 </tr>
			<tr>
				<th>團購付款狀態:</th>
				<td><input type="hidden"  size="10" name = "gbpay_status"
					value="${gbpay_status}"/>${gbpay_status==0 ? '未付款' : '已付款' }
				</td>
			</tr>
			<tr>
				<th>取貨狀態</th>
				<td><input type="hidden"  size="10" name = "pickup_status"
					value="${pickup_status}"/>${pickup_status==0 ? '未取貨' : '已取貨' }
				</td>
			</tr>
			<tr>
				<tr>
				<th>物流狀態</th>
				<td><input type="hidden"  size="10" name = "deliver_status"
					value="${deliver_status}"/>${status}</td>
					</tr>
				<tr>
				<td>購買數量:</td>
				<td><input type="hidden"  size="10" name = "gbbuy_amount"
					value="${gbbuy_amount}"/>${gbbuy_amount}</td>
			</tr>
			<tr>
				<td>總價格:</td>
				<td><input type="hidden"  size="10" name = "gbbuy_price"
					value="${gbbuy_price}"/>${gbbuy_price}</td>
			</tr>
		</table>
	
		<br> <input type="hidden" name="action" value="insert"> <input
			type="submit" value="確認新增"class="btn btn-warning">
	</FORM>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>

</body>
</html>