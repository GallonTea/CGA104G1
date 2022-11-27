<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.group_buy_order.model.*"%>
<%@ page import="com.discount.model.*"%>
<%@ page import="com.group_buy_item.model.*"%>

<%
Group_Buy_OrderVO group_buy_orderVO = (Group_Buy_OrderVO) request.getAttribute("group_buy_orderVO");
%>

<jsp:useBean id="group_buy_itemService" scope="page"
	class="com.group_buy_item.model.Group_Buy_ItemService" />
<html>
<head>

<title>團購訂單資料</title>
<!-- ===============================來自團購主查詢 付款和領貨============================================= -->
<!-- ===============================抓取團購團會員編號和登入帳號同編號<未執行>============================================= -->
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
				<h3>我的訂單</h3>
				<h4>
					<a
						href="<%=request.getContextPath()%>/frontend/group_buy_order/select_page.jsp">回團購訂單查詢</a>
				</h4>
			</td>
		</tr>
	</table>

	<table>
		<tr>
			<th>團購訂單編號</th>
			<th>購買商品</th>
			<th>團購團編號</th>
			<th>商品數量</th>
			<th>團購訂單原始金額</th>
			<th>折扣</th>
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
			<th>線上繳費</th>
			<th>領貨確認</th>


		</tr>
		<tr>
			<td>${group_buy_orderVO.gborder_id}</td>
			<td>${group_buy_orderVO.group_buy_itemVO.gbitem_name}</td>
			<td>${group_buy_orderVO.gb_id}</td>
			<td>${group_buy_orderVO.gbitem_amount}</td>
			<td>${group_buy_orderVO.gboriginal_price}</td>
			<td>${group_buy_orderVO.discountVO.discount_nar}</td>
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
			<!--    ==================== 改成傳來團購訂單編號,目前寫死==================== -->
			<td>
				
				<FORM METHOD="post" ACTION="/CGA104G1/Group_Buy_OrderServlet">
					<input type="hidden" name="gborder_id" value="${group_buy_orderVO.gborder_id}"> 
					<input type="hidden" name="action" value="update_paying" > 
					<input type="submit" value="${(group_buy_orderVO.gborder_status >= 3) ? '已付款' : '線上付款'}"
					${(group_buy_orderVO.gborder_status >= 3 ) ? ' disabled=" " ' : ' '}> 
				</FORM>
				
			</td>
			<!--    ==================== 改成傳來團購訂單編號,目前寫死==================== -->
			<td>
				<FORM METHOD="post" ACTION="/CGA104G1/Group_Buy_OrderServlet">
					<input type="hidden" name="gborder_id" value="${group_buy_orderVO.gborder_id}"> 
					<input type="hidden" name="action" value="update_pt" >
					<input type="submit" value="${(group_buy_orderVO.pickup_time != null) ? '已領貨' : '領貨確認'}"
					${(group_buy_orderVO.pickup_time != null) ? ' disabled=" " ' : ' '}>
				</FORM>
			</td>
		</tr>
	</table>

</body>
</html>