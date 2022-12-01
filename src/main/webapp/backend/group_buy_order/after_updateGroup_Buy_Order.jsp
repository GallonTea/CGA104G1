<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.group_buy_order.model.*"%>
<%@include file="/backend/backNavbar.jsp"%>
<% Group_Buy_OrderVO group_Buy_OrderVO = (Group_Buy_OrderVO) request.getAttribute("group_Buy_OrderVO"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>查看更新資料</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
	crossorigin="anonymous"></script>
<style>
/* <!-- ===========================================樣式欄位================================================================== --> */

/* tr:nth-child(odd){ */
/*   background:white; */
/* } */

/* tr:nth-child(even){ */
/*   background:#a4a9ad; */
/* } */
.styled-table {
	margin-left: auto;
	margin-right: auto;
	border-collapse: collapse;
	margin: auto;
	font-size: 0.9em;
	font-family: sans-serif;
	min-width: 400px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
}

.styled-table thead tr {
	background-color: #212529;
	color: #ffffff;
	text-align: left;
}

.styled-table th, .styled-table td {
	padding: 12px 15px;
}

.styled-table tbody tr {
	border-bottom: 1px solid #dddddd;
}

.styled-table tbody tr:nth-of-type(even) {
	background-color: #f3f3f3;
}

.styled-table tbody tr:last-of-type {
	border-bottom: 2px solid #212529;
}

.styled-table tbody tr.active-row {
	font-weight: bold;
	color: #212529;
}

/* <!-- ===========================================樣式欄位================================================================== --> */
table#table-1 {
	background-color: #212529;
	border: 2px solid black;
	text-align: center;
	margin-left: auto;
	margin-right: auto;
	width: 1038px;
	margin-top: 5px;
	margin-bottom: 5px;
}

table#table-1 h4 {
	color: red;
	display: block;
	margin-bottom: 1px;
}

h3 {
	color: #6c757d;
}

h4 {
	color: blue;
	display: inline;
}

/*   a{ */
/*     color: white; */
/*     display: inline; */
/*   } */
</style>

<style>
table {
	margin-left: auto;
	margin-right: auto;
	width: 900px;
	margin-top: 5px;
	margin-bottom: 5px;
}
/*    table, th, td {  */
/*      border: 1px solid #212529;  */
/*    }  */
th, td {

	padding: 5px;
	text-align: center;
}

/* th, td { display: block; } */
/*   td:first-child{ */
/*   border-top-left-radius: 10px; */
/*   border-bottom-left-radius: 10px; */
/* } */

/* td:last-child{ */
/*   border-top-right-radius: 10px; */
/*   border-bottom-right-radius: 10px; */
/* } */
</style>
</head>
<body>
<table id="table-1">
		<tr>
			<th><h3>所有員工資料</h3>
				<h4>
					<a class="btn btn-light" href="<%=request.getContextPath()%>/backend/group_buy_order/select_page.jsp">員工資料查詢首頁</a>
				</h4></th>
		</tr>
	</table>

	<table class="styled-table">
	
		<thead>
			<tr>
				<th>團購訂單編號</th>
				<th>購買商品</th>
				<th>團購團編號</th>
				<th>商品數量</th>
				<th>團購訂單原始金額</th>
				<th>團購價</th>
				<th>開啟訂單時間</th>
				<th>付款方式</th>
				<th>送貨方式</th>
				<th>訂單狀態</th>
				<th>訂單備註</th>
				<th>物流編號</th>
				<th>收件人姓名</th>
				<th>收件人地址</th>
				<th>收件人電話</th>
				<th>領貨時間</th>
				<th>變更資料</th>
			</tr>
		</thead>
		<tbody>
		
				<tr class="active-row" align='center' valign='middle'>
					<td>${group_buy_orderVO.gborder_id}</td>
					<td>${group_buy_orderVO.gbitem_id}</td>
					<td>${group_buy_orderVO.gb_id}</td>
					<td>${group_buy_orderVO.gbitem_amount}</td>
					<td>${group_buy_orderVO.gboriginal_price}</td>
					<td>${group_buy_orderVO.gb_endprice}</td>
					<td>${group_buy_orderVO.gborder_date}</td>
					<c:if test="${group_buy_orderVO.gborder_paying==0}">
						<td><c:out value="貨到付款"></c:out></td>
					</c:if>
					<c:if test="${group_buy_orderVO.gborder_paying==1}">
						<td><c:out value="ATM轉帳"></c:out></td>
					</c:if>
					<c:if test="${group_buy_orderVO.gborder_paying==2}">
						<td><c:out value="信用卡"></c:out></td>
					</c:if>
					<c:if test="${group_buy_orderVO.gborder_send==0}">
						<td><c:out value="宅配"></c:out></td>
					</c:if>
					<c:if test="${group_buy_orderVO.gborder_send==1}">
						<td><c:out value="便利商店"></c:out></td>
					</c:if>
					<c:if test="${group_buy_orderVO.gborder_status==0}">
						<td><c:out value="等待付款中"></c:out></td>
					</c:if>
					<c:if test="${group_buy_orderVO.gborder_status==1}">
						<td><c:out value="已取消"></c:out></td>
					</c:if>
					<c:if test="${group_buy_orderVO.gborder_status==2}">
						<td><c:out value="等待賣家確認中"></c:out></td>
					</c:if>
					<c:if test="${group_buy_orderVO.gborder_status==3}">
						<td><c:out value="準備出貨中"></c:out></td>
					</c:if>
					<c:if test="${group_buy_orderVO.gborder_status==4}">
						<td><c:out value="已出貨"></c:out></td>
					</c:if>
					<c:if test="${group_buy_orderVO.gborder_status==5}">
						<td><c:out value="未取貨，退回平台"></c:out></td>
					</c:if>
					<c:if test="${group_buy_orderVO.gborder_status==6}">
						<td><c:out value="已取貨"></c:out></td>
					</c:if>
					<c:if test="${group_buy_orderVO.gborder_status==7}">
						<td><c:out value="退貨"></c:out></td>
					</c:if>
					<c:if test="${group_buy_orderVO.gborder_status==8}">
						<td><c:out value="換貨"></c:out></td>
					</c:if>
					<td>${group_buy_orderVO.gborder_other}</td>
					<td>${group_buy_orderVO.tracking_num}</td>
					<td>${group_buy_orderVO.receiver_name}</td>
					<td>${group_buy_orderVO.receiver_address}</td>
					<td>${group_buy_orderVO.receiver_phone}</td>
					<td>${group_buy_orderVO.pickup_time}</td>

					<td>
					
					</td>
				</tr>
			
		</tbody>

	</table>


</body>
</html>