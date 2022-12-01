<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.group_buy_item.model.*"%>
<%@ page import="java.util.*"%>
<%
Group_Buy_ItemVO group_Buy_ItemVO = (Group_Buy_ItemVO) request.getAttribute("Group_Buy_ItemVO");
%>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>團購商品資料新增 - addGroupBuyItem.jsp</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/static/css/backend.css">
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
	width: 8--px;
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
<!-- 複製起點 -->
	<nav><%@include file="/backend/topNavbar.jsp"%></nav>
	<main>
		<%@include file="/backend/leftside.jsp"%>
		<section>
<!-- 		把原本body的東西貼到這邊 -->
<table id="table-1">
		<tr>
			<td>
				<h3>團購商品資料新增 - addGroupBuyItem.jsp</h3>
			</td>
			<td>
				<h4>
					<a href="<%=request.getContextPath()%>/backend/group_Buy_Item/select_page.jsp">回首頁</a>
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

	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Group_Buy_Item/groupBuyItem.do" name="form1">
		<table>

			<tr>
				<td>團購商品名稱:<font color=red><b>*</b></font></td>
				<td><input type="TEXT" name="gbitem_name" size="45" placeholder = "請輸入文字"
					value="<%=(group_Buy_ItemVO == null) ? "" : group_Buy_ItemVO.getGbitem_name()%>" /></td>
			</tr>
			<tr>
				<td>團購商品內容:<font color=red><b>*</b></font></td>
				<td><input type="TEXT" name="gbitem_content" size="45" placeholder = "請輸入文字"
					value="<%=(group_Buy_ItemVO == null) ? "" : group_Buy_ItemVO.getGbitem_content()%>" /></td>
			</tr>
			<tr>
				<td>團購商品價格:<font color=red><b>*</b></font></td>
				<td><input type="TEXT" name="gbitem_price" size="45" placeholder = "type 1 2 3"
					value="<%=(group_Buy_ItemVO == null) ? "" : group_Buy_ItemVO.getGbitem_price()%>" /></td>
			</tr>


			<jsp:useBean id="gbiSvc" scope="page"
				class="com.group_buy_item.model.Group_Buy_ItemService" />
			<tr>
				<td>團購商品狀態:<font color=red><b>*</b></font></td>
				<td><select size="1" name="gbitem_status">
						<option value="0">超出團購期限下架</option>
						<option value="1">上架中</option>
						<option value="2">無庫存</option>
						<option value="3">有庫存</option>
				</select></td>
			</tr>
			<tr>
				<td>團購商品上檔日期:<font color=red><b>*</b></font></td>
				<td><input name="gbitem_startdate" id="f_date1" type="text"></td>

			</tr>
			<tr>
				<td>團購商品下檔日期:<font color=red><b>*</b></font></td>
				<td><input name="gbitem_enddate" id="f_date2" type="text"></td>
			</tr>
			
			<tr>
				<td>團購商品類別:<font color=red><b>*</b></font></td>
				<td><input type="TEXT" name="gbitem_type" size="45" placeholder = "type 1 2 3"
					value="<%=(group_Buy_ItemVO == null) ? "" : group_Buy_ItemVO.getGbitem_type()%>" /></td>
			</tr>
		</table>
		<br> <input type="hidden" name="action" value="insert"> <input
			type="submit" value="送出新增">
	</FORM>
		</section>
	</main>
<!-- 複製終點 -->

	
</body>

<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->

<%
java.sql.Date gbitem_startdate = null;
try {
	gbitem_startdate = group_Buy_ItemVO.getGbitem_startdate();
} catch (Exception e) {
	gbitem_startdate = new java.sql.Date(System.currentTimeMillis());
}
%>
<%
java.sql.Date gbitem_enddate = null;
try {
	gbitem_enddate = group_Buy_ItemVO.getGbitem_enddate();
} catch (Exception e) {
	gbitem_enddate = new java.sql.Date(System.currentTimeMillis());
}
%>


<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

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
	       timepicker:false,       //timepicker:true,
	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
		   value: '<%=gbitem_startdate%>', // value:   new Date(),
	//disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
	//startDate:	            '2017/07/10',  // 起始日
	//minDate:               '-1970-01-01', // 去除今日(不含)之前
	//maxDate:               '+1970-01-01'  // 去除今日(不含)之後
	});
        $('#f_date2').datetimepicker({
	       theme: '',              //theme: 'dark',
	       timepicker:false,       //timepicker:true,
	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
		   value: '<%=gbitem_enddate%>', // value:   new Date(),
	//disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
	//startDate:	            '2017/07/10',  // 起始日
	minDate:               '"-"+<%=gbitem_startdate%>' // 去除今日(不含)之前
	//maxDate:               '+1970-01-01'  // 去除今日(不含)之後
	});
        
        
</script>
</html>
