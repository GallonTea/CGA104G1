<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.emp.model.*"%>
<%@ page import="java.util.*"%>

<%
EmpVO empVO = (EmpVO) request.getAttribute("empVO");
%>
<%
EmpService empSvc = new EmpService();
List<EmpVO> list = empSvc.getAll();
pageContext.setAttribute("list", list);
%>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/static/css/backend.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
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
<nav><%@include file="/backend/topNavbar.jsp"%></nav>
	<main>
		<%@include file="/backend/leftside.jsp"%>
		<section>
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

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
<div class= "container">
	<FORM METHOD="post" ACTION="EmpServlet" name="form1">
	
		<table>
			<tr>
				<td>員工名稱:</td>
				<td><input type="TEXT" name="emp_name" size="45"
					value="<%=(empVO == null) ? "無名氏" : empVO.getEmp_name()%>" /></td>
			</tr>
			
			<tr>
				<td>員工帳號:</td>
				<td><input type="TEXT" name="account" size="45"
					value="<%=(empVO == null) ? "123456" : empVO.getAccount()%>" /></td>
			</tr>
			<tr>
				<td>員工密碼:</td>
				<td><input type="password" name="password" size="45"
					value="<%=(empVO == null) ? "123456" : empVO.getPassword()%>" /></td>
			</tr>
		
			<tr>
				<td>員工到職時間:</td>
				<td><input name="onjob_date" id="f_date1" type="TEXT"  /></td>
			</tr>
			<tr>
				<tr>
				<td>員工狀態:</td>
				<input type=hidden name="emp_status"  id ="status">
				<td><select class="status" >
						<option value=" "selected></option> 
 						<option value="0">離職</option> 
						<option value="1" >在職</option>			
				</select></td></tr></table>
				<jsp:useBean id="effectSvc" scope="page" class="com.effect.model.EffectService"/>
				<div  id = effectstert>
				<table>
				<tr>
					<td>員工權限:</td>
					
						<td>
<!-- 							<select   class="effect"  onchange="selectCreate(selectedIndex)"> -->
							<select   class="effect" name="effect_id" >
							<c:forEach var="effectVO" items="${effectSvc.all}" >										
 								<option  id ="effectop" value="${effectVO.effect_id}">${effectVO.effect_name}</option> 
							</c:forEach>			
							</select>
						</td>
								
					</tr>
				

			<%-- 			<jsp:useBean id="emp_effectSvc" scope="page" --%>
			<%-- 				class="com.emp_effect.model.Emp_effectService" /> --%>
			<%-- 			<jsp:useBean id="effectSvc" scope="page" --%>
			<%-- 				class="com.effect.model.EffectService" /> --%>
			<!-- 			<tr> -->
			<!-- 				<td>權限編號:<font color=red><b>*</b></font></td> -->
			<!-- 				<td><select size="1" name="emp_effect"> -->
			<%-- 						<c:forEach var="emp_effectVO" items="${emp_effectSvc.all}"> --%>
			<%-- 							<option value="${emp_effectVO.effect_id}" --%>
			<%-- 								${(empVO.emp_id==emp_effectVO.emp_id)? 'selected':'' }>${emp_effectVO.effect_id} --%>
			<%-- 						</c:forEach> --%>
			<!-- 				</select></td> -->
			<!-- 			</tr> -->
			<!-- 			<tr> -->
			<!-- 				<td>權限:<font color=red><b>*</b></font></td> -->
			<!-- 				<td><select size="1" name="effect"> -->
			<%-- 						<c:forEach var="effectVO" items="${effectSvc.all}"> --%>
			<%-- 							<option value="${effectVO.effect_name}" --%>
			<%-- 								${(emp_empVO.effect_id==effectVO.effect_name)? 'selected':'' }>${effectVO.effect_name} --%>
			<%-- 						</c:forEach> --%>
			<!-- 				</select></td> -->
			<!-- 			</tr> -->


		</table>
		</div>	
		<br> <input type="hidden" name="action" value="insert"> <input
			type="submit" value="送出新增"class="btn btn-warning">
			
	</FORM>
	</div>
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
// function effect(value){
// 	console.log(value);
// 	let count = 1 ;
// 	if(count < 10) {
// 		let effectid = document.querySelector(".effect")
// 		NewSelect = select.cloneNode(true);
// 	}
// }









// let count = 1;
// function selectCreate(value) {
// 	console.log(value);
 
//     if (count < 4) {
    	
//         const select = document.querySelector('.effect:last-child')
//         || document.querySelector('.effect')
//         console.log(select)
        
//         NewSelect = select.cloneNode(true);
//         document.querySelector("#effectstert").insertAdjacentElement('beforeend', NewSelect);
//         const option = document.querySelector('.effect').querySelectorAll('#effectop')[value];
//         option.style.display = "none";
//         console.log(select)
//         count++;
//         console.log(count);
//     }
// }
</script>
<!-- // ===============================下拉選單新增========================================== -->


 

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>

		</section>
	</main>

	
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