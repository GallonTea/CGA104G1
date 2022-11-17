<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.group_buy_order.model.*"%>
<%@ page import="java.util.*"%>
<%
// EmpService empSvc = new EmpService();
// List<EmpVO> list = empSvc.getAll();             未改
// pageContext.setAttribute("list", list);
%>
<%@include file="/backend/backNavbar.jsp"%>
<html>
<head>
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
				<h3>員工資料新增</h3>
			</td>
			<td>
				<h4>
					<a href="select_page.jsp">首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<h3>資料新增:</h3>

		<FORM METHOD="post" ACTION="Group_Buy_OrderServlet" name="form1">
			<table>
<!-- 				<tr> ===============================自主新增==================================--> 
<!-- 				<td>團購訂單編號:</td> -->
<!-- 				<td><input type="TEXT" name="emp_id" size="45" -->
<%-- 			 value="${group_buy_orderVO.gborder_id}>" />${group_buy_orderVO.gborder_id}</td> --%>
<!-- 				</tr> -->
				<tr>
			<td>團購商品編號:</td>                    <!-- 	 ==============================團購商品傳來================================== -->
				<td><input type="TEXT" name="emp_id" size="45"
			 value="${group_buy_orderVO.gbitem_id}" />${group_buy_orderVO.gbitem_id}</td>
				</tr>
				<tr>
				<td>團購團編號:</td>  <!-- 	 ==============================團購團傳來================================== -->
				<td><input type="TEXT" name="emp_id" size="45"
			 value="${group_buy_orderVO.gb_id}" />${group_buy_orderVO.gb_id}</td>
				</tr>
				<tr>
				<td>團購商品數量:</td>  <!-- 	 ==============================折扣傳來最低數量限制================================== -->
				<td><input type="TEXT" name="emp_id" size="45"
			 value="${group_buy_orderVO.gbitem_amount}" />${group_buy_orderVO.gbitem_amount}</td>
				</tr>
				<tr>
				<td>團購訂單原始金額:</td>  <!-- 	 ==============================團購商品傳來================================== -->
				<td><input type="TEXT" name="emp_id" size="45"
			 value="${group_buy_orderVO.gboriginal_price}" />${group_buy_orderVO.gboriginal_price}</td>
				</tr>
				<tr>
				<td>折扣編號:</td> <!-- 	 ==============================折扣傳來 下拉================================== -->
				<td><input type="TEXT" name="emp_id" size="45"
			 value="${group_buy_orderVO.discount_id}" />${group_buy_orderVO.discount_id}</td>
				</tr>
				<tr>
				<td>團購最後價格:</td> <!-- 	 ==============================折扣傳來價格*數量================================== -->
				<td><input type="TEXT" name="emp_id" size="45"
			 value="${group_buy_orderVO.gb_endprice}" />${group_buy_orderVO.gb_endprice}</td>
				</tr>
				<tr>
				<td>團購訂單時間:</td> <!-- 	 ==============================訂單新增確認================================== -->
				<td><input type="TEXT" name="emp_id" size="45"
			 value="${group_buy_orderVO.gborder_date}" />${group_buy_orderVO.gborder_date}</td>
				</tr>
				<tr>
				<td>團購付款方式:</td> <!-- 	 ==============================團購主確認================================== -->
				<td><input type="TEXT" name="emp_id" size="45"
			 value="${group_buy_orderVO.gborder_paying}" />${group_buy_orderVO.gborder_paying}</td>
				</tr>
				<tr>
				<td>團購送貨方式:</td>  <!-- 	 ==============================團購主確認================================== -->
				<td><input type="TEXT" name="emp_id" size="45"
			 value="${group_buy_orderVO.gborder_send}" />${group_buy_orderVO.gborder_send}</td>
				</tr>
				<tr>
				<td>團購訂單狀態:</td> <!-- 	 ==============================預設0等待付款================================== -->
				<td><input type="TEXT" name="emp_id" size="45"
			 value="${group_buy_orderVO.gborder_status}" />${group_buy_orderVO.gborder_status}</td>
				</tr>
				<tr>
				<td>團購訂單備註:</td>  <!-- 	 ==============================團購主確認================================== -->
				<td><input type="TEXT" name="emp_id" size="45"
			 value="${group_buy_orderVO.gborder_other}" />${group_buy_orderVO.gborder_other}</td>
				</tr>
				<tr>
				<td>物流編號:</td>    <!-- 	 ==============================確認付款後新增================================== -->
				<td><input type="TEXT" name="emp_id" size="45"
			 value="${group_buy_orderVO.tracking_num}" />${group_buy_orderVO.tracking_num}</td>
				</tr>
				<tr>
				<td>收件人姓名:</td>   <!-- 	 ==============================團購主確認================================== -->
				<td><input type="TEXT" name="emp_id" size="45"
			 value="${group_buy_orderVO.receiver_name}" />${group_buy_orderVO.receiver_name}</td>
				</tr>
				<tr>
				<td>收件人地址:</td>     <!-- 	 ==============================團購主確認================================== -->
				<td><input type="TEXT" name="emp_id" size="45"
			 value="${group_buy_orderVO.receiver_address}" />${group_buy_orderVO.receiver_address}</td>
				</tr>
				<tr>
				<td>收件人電話:</td>     <!-- 	 ==============================團購主確認================================== -->
				<td><input type="TEXT" name="emp_id" size="45"
			 value="${group_buy_orderVO.receiver_phone}" />${group_buy_orderVO.receiver_phone}</td>
				</tr>
				<tr>
				<td>領貨時間:</td>      <!-- 	 ==============================團購主確認================================== -->
				<td><input type="TEXT" name="emp_id" size="45"
			 value="${group_buy_orderVO.pickup_time}" />${group_buy_orderVO.pickup_time}</td>
				</tr>
			
				</table>
				<br>
				<input type="hidden" name="action" value="insert">
				<input type="submit" value="送出新增" class="btn btn-warning"></FORM>
				
	<script type="text/javascript">
$(document).ready(function() {
	
	switch($('#status').val()){
		case '0':
			$('.status').val(0)
			break;
		case '1':
			$('.status').val(1)
	}
	$('.status').change(function () {
		$('#status').val($('.status option:selected').val());
	});
});
</script>
				<!-- // ===============================下拉選單新增========================================== -->




				<script
					src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
					integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
					crossorigin="anonymous"></script>
</body>

<%
java.sql.Date onjob_date = null;
try {
	onjob_date = empVO.getOnjob_date();
} catch (Exception e) {
	onjob_date = new java.sql.Date(System.currentTimeMillis());
}
%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script
	src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>
<script>
        $.datetimepicker.setLocale('zh');
        $('#f_date1').datetimepicker({
	       theme: '',              //theme: 'dark',
	       timepicker:false,       //timepicker:true,
	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
		   value: '<%=onjob_date%>' , // value:   new Date(),
	//disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
	//startDate:	            '2017/07/10',  // 起始日
	//minDate:               '-1970-01-01', // 去除今日(不含)之前
	//maxDate:               '+1970-01-01'  // 去除今日(不含)之後
	});
</script>
</html>