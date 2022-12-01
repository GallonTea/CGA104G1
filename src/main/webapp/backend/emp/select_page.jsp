<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/static/css/backend.css">

<title>首頁</title>
<style>


  table#table-1 {
	width: 450px;
	background-color: #212529;
	margin-top: 5px;
	margin-bottom: 10px;
	border: 3px ridge Gray;
	height: 80px;
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

</head>
<body bgcolor='white'>

	<nav><%@include file="/backend/topNavbar.jsp"%></nav>
	<main>
		<%@include file="/backend/leftside.jsp"%>
		<section>
	
	<h3>資料查詢:</h3>
	<table id="table-1">
		<c:forEach var="empVO" items="${list}" begin="0" end="0">
			<tr>
				<td><h3>${empVO.emp_name}</h3></td>
			</tr>
		</c:forEach>
	</table>

	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	<ul>
		<li><a href='listAllEmp.jsp'>List</a> all Emp <br> <br></li>


				<li>

		<FORM METHOD="post" ACTION="EmpServlet" name="form1">
			<b><font color=blue>萬用複合查詢:</font></b> <br> <span
				class="label-desc">輸入員工編號:</span> <input type="text" name="emp_id"
				value=""><br> <span>輸入員工姓名:</span> <input type="text"
				name="emp_name" value=""><br>

			<div class="select-box">
				<label for="select-box1"> <span>員工狀態</span>
				</label> <select name ="emp_status">
					<option value=" "></option>
					<option value="0">離職</option>
					<option value="1" selected>在職</option>
				</select>
			</div>
			<b>雇用日期:</b>
	   <input name="onjob_date" id="f_date1" type="text">
			
			
			<input type="submit" value="送出"> <input type="hidden"
				name="action" value="listemp_and_effect">
		</FORM>
		</li>
	</ul>
	<ul>
		<li><a href='addEmp.jsp'>Add</a> a new Emp.</li>
	</ul>


		</section>
	</main>

</body>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>
<script type="text/javascript">
$.datetimepicker.setLocale('zh');
$('#f_date1').datetimepicker({
    theme: '',              //theme: 'dark',
   timepicker:false,       //timepicker:true,
   step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
   format:'Y-m-d',         //format:'Y-m-d H:i:s',
   value: '',              // value:   new Date(),
   //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
   //startDate:	            '2017/07/10',  // 起始日
   //minDate:               '-1970-01-01', // 去除今日(不含)之前
   //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
});

const selected = document.querySelector(".selected");
const optionsContainer = document.querySelector(".options-container");

const optionsList = document.querySelectorAll(".option");

selected.addEventListener("click", () => {
  optionsContainer.classList.toggle("active");
});

optionsList.forEach(o => {
  o.addEventListener("click", () => {
    selected.innerHTML = o.querySelector("label").innerHTML;
    optionsContainer.classList.remove("active");
  });
});
</script>

</html>