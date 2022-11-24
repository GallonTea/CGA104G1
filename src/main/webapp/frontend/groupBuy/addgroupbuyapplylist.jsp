<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.group_buy.model.*"%>
<%@ page import="com.group_buy_item.model.*"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="com.discount.model.*"%>
<%
Group_BuyVO group_BuyVO = (Group_BuyVO) request.getAttribute("Group_BuyVO");
%>
<%
DiscountService discountService = new DiscountService();
List<DiscountVO> Discount = discountService.getAll();
pageContext.setAttribute("Discount", Discount);
%>

<%
Group_Buy_ItemService group_Buy_ItemService = new Group_Buy_ItemService();
List<Group_Buy_ItemVO> Group_Buy_Item = group_Buy_ItemService.getAll();
pageContext.setAttribute("Group_Buy_Item", Group_Buy_Item);
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<meta charset="UTF-8">
<title>團購團申請單</title>



</head>
<body>




	<!-- 	帳號(hide)，由MEM_ID取得 愈開團之團購商品選擇(顯示第一章縮圖與名稱) 設定最低開團人數(GB_MIN) 目前人數(hide -->
	<!-- 	default 0?1?) 團購開始時間設定 團購結束時間設定 狀態(default 0人數不足 || 已滿團 ) -->
	<main>

		<div class="container">

			<form
				action="<%=request.getContextPath()%>/GroupBuyApplyListInsertServlet">

				<div class="form-group">
					<label for="formGroupExampleInput2">團購主帳號</label> 
				</div>


<!-- 				<FORM METHOD="post" -->
<%-- 					ACTION="<%=request.getContextPath()%>/Group_Buy_Item/groupBuyItem.do"> --%>
					<b>選擇開團商品:</b> <select size="1" name="gbitem_id">
						<c:forEach var="Group_Buy_ItemVO" items="${Group_Buy_Item}">
							<option value="${Group_Buy_ItemVO.gbitem_id}">${Group_Buy_ItemVO.gbitem_name}
						</c:forEach>
					</select> <input type="hidden" name="action" value="getOne_For_Display">
					<input type="submit" value="送出">
<!-- 				</FORM> -->



				<div class="form-group">
					<label for="formGroupExampleInput2">團購商品結單數量[數量達標系統自動結單]</label> <input
						name="gb_min" type="text" class="form-control"
						id="formGroupExampleInput2" placeholder="Another input">
				</div>


				<div class="form-group">
					<label for="formGroupExampleInput2">團購商品原始價格</label>
<%-- 					<div>${Group_Buy_ItemVO.gbitem_price}</div> --%>
				</div>


<!-- 				<FORM METHOD="post" -->
<%-- 					ACTION="<%=request.getContextPath()%>/Discount/Discount.do"> --%>
					<b>選擇折扣:</b> <select size="1" name="discount_id">
						<c:forEach var="DiscountVO" items="${Discount}">
							<option value="${DiscountVO.discount_id}">${DiscountVO.discount_nar}
						</c:forEach>
					</select> <input type="hidden" name="action" value="getOne_For_Display">
					<input type="submit" value="送出">
<!-- 				</FORM> -->







				<div class="form-group">
					<label for="formGroupExampleInput2">團購商品折扣後價格</label> <input
						name="" type="text" class="form-control"
						id="formGroupExampleInput2" placeholder="Another input">
				</div>






				<tr>
					<td>團購開始日期:</td>
					<td><input name="gbstart_date" id="f_date1" type="text"></td>
				</tr>
				<tr>
					<td>團購結束下檔日期:</td>
					<td><input name="gbend_date" id="f_date2" type="text"></td>
				</tr>


				<div class="form-group col-md-4">
					<label for="inputState">團購狀態</label> <select id="inputState"
						name="gb_status" class="form-control">
						<option value="0" selected>參團人數不足</option>
						<option value="1">參團人數已達標</option>
					</select>
				</div>


				<input type="hidden" name="action" value="insert">
				<button class="btn btn-primary" type="submit">開團</button>
			</form>
			<br>

			<form
				action="<%=request.getContextPath()%>/frontend/groupBuy/listallgroupbuuy.jsp">
				<button class="btn btn-primary" type="submit">返回團購首頁</button>
			</form>
		</div>

	</main>



	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
		integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
		integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
		crossorigin="anonymous"></script>

	<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->

	<%
	java.sql.Timestamp gbstart_date = null;
	try {
		gbstart_date = group_BuyVO.getGbstart_date();
	} catch (Exception e) {
		gbstart_date = new java.sql.Timestamp(System.currentTimeMillis());
	}
	%>
	<%
	java.sql.Timestamp gbend_date = null;
	try {
		gbend_date = group_BuyVO.getGbend_date();
	} catch (Exception e) {
		gbend_date = new java.sql.Timestamp(System.currentTimeMillis());
	}
	%>


	<link rel="stylesheet" type="text/css"
		href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
	<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
	<script
		src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

	<style>
.xdsoft_datetimepicker .xdsoft_datepicker {
	width: 300px; /* width:  300px; */
}

.xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
	height: 151px; /* height:  151px; */
}
</style>

	<script>
        $.datetimepicker.setLocale('zh');
        $('#f_date1').datetimepicker({
	       theme: '',              //theme: 'dark',
	       timepicker:true,       //timepicker:true,
	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
	       format:'Y-m-d H:i:s',         //format:'Y-m-d H:i:s',
		   value: '<%=gbstart_date%>', // value:   new Date(),
	//disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
	//startDate:	            '2017/07/10',  // 起始日
	//minDate:               '-1970-01-01', // 去除今日(不含)之前
	//maxDate:               '+1970-01-01'  // 去除今日(不含)之後
	});
        $('#f_date2').datetimepicker({
	       theme: '',              //theme: 'dark',
	       timepicker:true,       //timepicker:true,
	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
	       format:'Y-m-d H:i:s',         //format:'Y-m-d H:i:s',
		   value: '<%=gbend_date%>', // value:   new Date(),
	//disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
	//startDate:	            '2017/07/10',  // 起始日
	minDate:               '"-"+<%=gbstart_date%>' // 去除今日(不含)之前
		//maxDate:               '+1970-01-01'  // 去除今日(不含)之後
		});
	</script>
	<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript">
		// $(document).ready(function(){
		// 	var status = $("#gbitemStatus").text();
		// 	switch(status){
		// 		case '0':
		// 			$("#gbitemStatus").text("(當前)超出團購期限下架");
		// 			break;
		// 		case '1':
		// 			$("#gbitemStatus").text("(當前)上架中");
		// 			break;
		// 		case '2':
		// 			$("#gbitemStatus").text("(當前)無庫存");
		// 			break;
		// 		case '3':
		// 			$("#gbitemStatus").text("(當前)有庫存");
		// 			break;
		// 	}
		// });
	</script>
</body>

</html>