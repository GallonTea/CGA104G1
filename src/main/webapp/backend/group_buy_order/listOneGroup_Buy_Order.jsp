<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.group_buy_order.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>

<title>員工資料</title>

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
	width: 80%;
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
				<h3>團購訂單資料</h3>
				<h4>
					<a href="select_page.jsp">回團購訂單查詢首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<table>
		<tr>
			<th>團購訂單編號</th>
			<th>團購商品編號</th>
			<th>團購團編號</th>
			<th>團購商品數量</th>
			<th>團購訂單原始金額</th>
			<th>折扣編號</th>
			<th>團購最後價格</th>
			<th>團購訂單時間</th>
			<th>團購付款方式</th>
			<th>團購送貨方式</th>
			<th>團購訂單狀態</th>
			<th>團購訂單備註</th>
			<th>物流編號</th>
			<th>收件人姓名</th>
			<th>收件人地址</th>
			<th>收件人電話</th>
			<th>領貨時間</th>


		</tr>
		<tr>
			<td>${group_buy_orderVO.gborder_id}</td>
			<td>${group_buy_orderVO.gbitem_id}</td>
			<td>${group_buy_orderVO.gb_id}</td>
			<td>${group_buy_orderVO.gbitem_amount}</td>
			<td>${group_buy_orderVO.gboriginal_price}</td>
			<td>${group_buy_orderVO.discount_id}</td>
			<td>${group_buy_orderVO.gb_endprice}</td>
			<td>${group_buy_orderVO.gborder_date}</td>
			<td>${group_buy_orderVO.gborder_paying}</td>
			<td>${group_buy_orderVO.gborder_send}</td>
			<td>${group_buy_orderVO.gborder_status}</td>
			<td>${group_buy_orderVO.gborder_other}</td>
			<td>${group_buy_orderVO.tracking_num}</td>
			<td>${group_buy_orderVO.receiver_name}</td>
			<td>${group_buy_orderVO.receiver_address}</td>
			<td>${group_buy_orderVO.receiver_phone}</td>
			<td>${group_buy_orderVO.pickup_time}</td>

			<%-- 			<c:if test="${empVO.getEmp_status()==0}"> --%>
			<%-- 			<td><c:out value="離職"></c:out></td> --%>
			<%-- 			</c:if> --%>
			<%-- 			<c:if test="${empVO.getEmp_status()==1}"> --%>
			<%-- 			<td><c:out value="在職"></c:out></td> --%>
			<%-- 			</c:if> --%>
			<%-- 			<td><%=empVO.getEmp_status()%></td> --%>

		</tr>
	</table>

</body>
</html>