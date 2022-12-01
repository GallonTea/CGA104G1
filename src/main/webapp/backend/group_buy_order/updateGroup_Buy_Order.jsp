<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.group_buy_order.model.*"%>
<%@ page import="com.discount.model.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.group_buy_item.model.*"%>


<jsp:useBean id="discountSvc" scope="page"
	class="com.discount.model.DiscountService" />
<%-- <jsp:useBean id="discountSvc" scope="page" class="com.discount.model.DiscountService" /> --%>
<%
// EmpService empSvc = new EmpService();
// List<EmpVO> list = empSvc.getAll();             未改
// pageContext.setAttribute("list", list);
%>
<%@include file="/backend/backNavbar.jsp"%>
<html>
<head>
<title>後台訂單資料更改</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"
	integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
	crossorigin="anonymous"></script>
<title>員工新增資料</title>


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
				<h3>訂單新增</h3>
			</td>
			<td>
				<!-- 				<h4> --> <!-- 					<a href="select_page.jsp">首頁</a> --> <!-- 				</h4> -->
			</td>
		</tr>
	</table>

	<h3>資料新增:</h3>
	<FORM METHOD="post" ACTION="/CGA104G1/Group_Buy_OrderServlet"
		name="form1">
		<table>

			<tr>
				<td>團購訂單編號:</td>
				<td><input type="TEXT" name="gborder_id" size="45"
					value="${group_buy_orderVO.gborder_id}" /></td>
			</tr>
			<tr>
				<td>團購商品:</td>
				<td><input type="hidden" name="gbitem_id" size="45"
					value="${group_buy_orderVO.gbitem_id}" /> ${group_buy_orderVO.group_buy_itemVO.gbitem_name}</td>
			</tr>
			<tr>
				<td>團購團編號:</td>
				<td><input type="TEXT" name="gb_id" size="45"
					value="${group_buy_orderVO.gb_id}" /></td>
			</tr>
			<tr>
				<td>團購數量:</td>
				<td><input type="TEXT" name="gbitem_amount" size="45"
					value="${group_buy_orderVO.gbitem_amount}" readonly="readonly" /></td>
			</tr>
			<tr>
				<td>原價:</td>
				<td><input type="TEXT" name="gboriginal_price" size="45"
					value="${group_buy_orderVO.gboriginal_price}" readonly="readonly" /></td>
			</tr>
			<tr>
				<td>團購價:</td>
				<td><input type="TEXT" name="gb_endprice" size="45"
					value="${group_buy_orderVO.gb_endprice}" /></td>
			</tr>
			<tr>
				<td>團購訂單時間:</td>
				<td><input type="TEXT" name="gborder_date" size="45"
					value="${group_buy_orderVO.gborder_date}" /></td>
			</tr>
			<tr>
				<td>團購付款方式:</td>
				<!-- 				<input type="hidden" name="gborder_paying" size="45" id="select" /> -->
				<td><select class="status" name="gborder_paying" id="select">
						<option value="0"
							${(group_buy_orderVO.gborder_paying==0)? 'selected': ''}>貨到付款</option>
						<option value="1"
							${(group_buy_orderVO.gborder_paying==1)? 'selected': ''}>ATM轉帳</option>
						<option value="2"
							${(group_buy_orderVO.gborder_paying==2)? 'selected': ''}>信用卡</option>
				</select></td>
				<td><font color=red>${errorMsgs.gborder_paying}</font></td>
			</tr>
			<tr>
			<tr>
				<td>團購送貨方式:</td>
				<!-- 					<input type="hidden" name="gborder_send" size="45" id="select" /> -->
				<td><select class="status2" name="gborder_send" id="select">
						<option value="0"
							${(group_buy_orderVO.gborder_send==0)? 'selected': ''}>宅配</option>
						<option value="1"
							${(group_buy_orderVO.gborder_send==1)? 'selected': ''}>便利商店</option>

				</select></td>
				<td><font color=red>${errorMsgs.gborder_send}</font></td>
			</tr>
			<tr>
				<td>團購訂單狀態:</td>
				<td><select class="status2" name="gborder_status" id="select">
						<option value="0"
							${(group_buy_orderVO.gborder_status==0)? 'selected': ''}>等待付款中</option>
						<option value="1"
							${(group_buy_orderVO.gborder_status==1)? 'selected': ''}>已取消</option>
							<option value="1"
							${(group_buy_orderVO.gborder_status==1)? 'selected': ''}>等待賣家確認中</option>
							<option value="1"
							${(group_buy_orderVO.gborder_status==1)? 'selected': ''}>準備出貨中</option>
							<option value="1"
							${(group_buy_orderVO.gborder_status==1)? 'selected': ''}>已出貨</option>
							<option value="1"
							${(group_buy_orderVO.gborder_status==1)? 'selected': ''}>未取貨，退回平台</option>
							<option value="1"
							${(group_buy_orderVO.gborder_status==1)? 'selected': ''}>已取貨</option>
							<option value="1"
							${(group_buy_orderVO.gborder_status==1)? 'selected': ''}>退貨</option>
							<option value="1"
							${(group_buy_orderVO.gborder_status==1)? 'selected': ''}>換貨</option>
							</select></td>		
				<td><font color=red>${errorMsgs.gborder_status}</font></td>
			</tr>
			<tr>
				<td>團購訂單備註:</td>
				<td><input type="TEXT" name="gborder_other" size="45"
					value="${group_buy_itemVO.gborder_other}" /></td>
			</tr>
			<tr>
				<td>物流編號:</td>
				<td><input type="TEXT" name="tracking_num" size="45"
					value="${group_buy_itemVO.tracking_num}" /></td>
			</tr>
			<tr>
				<td>收件人姓名:</td>
				<td><input type="TEXT" name="receiver_name" size="45"value="${group_buy_orderVO.receiver_name}" /></td>
				<td><font color=red>${errorMsgs.receiver_name}</font></td>
			</tr>
			<tr>
				<td>收件人地址:</td>
				<td><input type="TEXT" name="receiver_address" size="45" value="${group_buy_orderVO.receiver_address}" /></td>
				<td><font color=red>${errorMsgs.receiver_address}</font></td>
			</tr>
			<tr>
				<td>收件人電話:</td>
				<td><input type="TEXT" name="receiver_phone" size="45"  value="${group_buy_orderVO.receiver_phone}" /></td>
				<td><font color=red>${errorMsgs.receiver_phone}</font></td>
			</tr>
			<tr>
				<td>領貨時間:</td>
				<td><input type="TEXT" name="pickup_time" size="45"
					value="${group_buy_orderVO.pickup_time}" />${group_buy_orderVO.pickup_time}</td>
			</tr>
		</table>
		<br> <br> <input type="hidden" name="action"
			value="update"> <input type="submit" value="確定更改"
			class="btn btn-warning">

	</FORM>






	<script type="text/javascript">
	let type = $('#select option:selected') .val();
	
	
	
	$("#selector").on("change", function() {
		  $("#selector option:selected")
		  });
	
// $(document).ready(function() {
	
// 	switch($('#status').val()){
// 		case '0':
// 			$('.status').val(0)
// 			break;
// 		case '1':
// 			$('.status').val(1)
// 		case '2':
// 			$('.status').val(2)
// 	}
// 	$('.status').change(function () {
// 		$('#status').val($('.status option:selected').val());
// 	});
// });
// $(document).ready(function() {
	
// 	switch($('#status2').val()){
// 		case '0':
// 			$('.status2').val(0)
// 			break;
// 		case '1':
// 			$('.status2').val(1)
// 		case '2':
// 			$('.status2').val(2)
// 	}
// 	$('.status').change(function () {
// 		$('#status2').val($('.status2 option:selected').val());
// 	});
// });
<!-- // ===============================兩種 sumit ========================================== -->

// function act1(){
// 	document.form1.action="DiscountServlet?action=insertdiscount";
// 	document.form1.submit();
// }
// function act2(){
// 	document.form1.action="/CGA104G1/Group_Buy_OrderServlet?action=insert_NewOrder";
// 	document.form1.submit();
// }

</script>
	<!-- // ===============================下拉選單新增========================================== -->




	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
		crossorigin="anonymous"></script>

</body>

<%
// java.sql.Date onjob_date = null;
// try {
// 	onjob_date = empVO.getOnjob_date();
// } catch (Exception e) {
// 	onjob_date = new java.sql.Date(System.currentTimeMillis());
// }
%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script
	src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>
<script>
//         $.datetimepicker.setLocale('zh');
//         $('#f_date1').datetimepicker({
// 	       theme: '',              //theme: 'dark',
// 	       timepicker:false,       //timepicker:true,
// 	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
// 	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
<%-- 		   value: '<%=onjob_date%>' , // value:   new Date(), --%>
	//disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
	//startDate:	            '2017/07/10',  // 起始日
	//minDate:               '-1970-01-01', // 去除今日(不含)之前
	//maxDate:               '+1970-01-01'  // 去除今日(不含)之後
// 	});
</script>
</html>