<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.emp.model.*"%>
<%
EmpVO empVO = (EmpVO) request.getAttribute("empVO");
%>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<title>權限資料修改</title>

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

form#aa {
	width: 50%;
	margin: 20px auto;
}
</style>

<style>
table {
	width: 450px;
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

	<table id="table-1">
		<tr>
			<td>
				<h3>權限資料修改</h3>
				<h4>
					<a href="select_page.jsp">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<h3>資料修改:</h3>


	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post" ACTION="emp.do" name="form1">
		<table>
		
			<tr>
				<td>員工姓名:</td>
				<td><input type="TEXT" name="emp_name" size="45"
					value="<%=empVO.getEmp_name()%>" /></td>
			</tr>
			<tr>
				<td>員工帳號:</td>
				<td><input type="TEXT" name="account" size="45"
					value="<%=empVO.getAccount()%>" /></td>
			</tr>
			<tr>
				<td>員工密碼:<font color=red><b>*</b></font></td>
				<td><input type="password" name="password"  size="45"
					value="<%=empVO.getPassword()%>" /></td>
			</tr>
			<tr>
				<td>雇用日期:</td>
				<td><input name="onjob_date" id="f_date1" type="text"></td>
			</tr>
			<tr>
				<td>員工狀態:</td>
<!-- 				<input type=hidden name="emp_status"  id ="status"> -->
				<td><select class="status"  name="emp_status" >
 						<option value="0" ${(empVO.emp_status==0)? 'selected': ''}>離職</option> 
						<option value="1" ${(empVO.emp_status==1)? 'selected': ''}>在職</option>			
<!--  						<option value="0" >離職</option>  -->
<!-- 						<option value="1" >在職</option>			 -->
				</select></td>
		</table>

		<br> <input type="hidden" name="action" value="update"> <input
			type="hidden" name="emp_id" value="<%=empVO.getEmp_id()%>"> 
			<input type="submit" value="送出修改">
	</FORM>
<script type="text/javascript">
// $(document).ready(function() {
	
// 	switch($('#status').val()){
// 		case '0':
// 			$('.status').val(0)
// 			break;
// 		case '1':
// 			$('.status').val(1)
// 	}
// 	$('.status').change(function () {
// 		$('#status').val($('.status option:selected').val());
// 	});
// })

</script>



</body>
	<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
	<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
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
 		   value: "<%=empVO.getOnjob_date()%>" , // value:   new Date(),
		//disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
		startDate : 'new Date()', // 起始日
	//minDate:               '-1970-01-01', // 去除今日(不含)之前
	//maxDate:               '+1970-01-01'  // 去除今日(不含)之後
	});
</script>
</html>