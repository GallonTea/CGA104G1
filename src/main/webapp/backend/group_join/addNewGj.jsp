<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.group_join.model.*"%>
<%@ page import="com.group_buy.model.*"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="group_buySvc" scope="page" class="com.group_buy.model.Group_BuyService" />
<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService" />

<%-- <% --%>
<!-- // EmpVO empVO = (EmpVO) request.getAttribute("empVO"); -->
<%-- %> --%>
<%-- <% --%>
<!-- // EmpService empSvc = new EmpService(); -->
<!-- // List<EmpVO> list = empSvc.getAll(); -->
<!-- // pageContext.setAttribute("list", list); -->
<%-- %> --%>
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
				<h3>參團資料新增</h3>
			</td>
			<td>
				<h4>
					<a href="select_page.jsp">首頁</a>
				</h4>
			</td>
		</tr>
	</table>


	<h3>參團資料新增:</h3>
<div class= "container">
	
	<FORM METHOD="post" ACTION="/CGA104G1/Group_Join_backServlet" name="form1">
		<table>		
		<tr>
		<td>團購團編號</td>
		<td>
		<select  name="gb_id">
		<c:forEach var="group_buyVO" items="${group_buySvc.all}">
		<option value="${group_buyVO.gb_id}">${group_buyVO.gb_name}:</option>
		</c:forEach>
		</select>
		</td>		
	</tr>
	</table>
	 <input type="hidden" name="action" value="getOne_For_Display"> <input
			type="submit" value="查詢團購可購買數量"class="btn btn-warning"> 
	</FORM>	
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>

		</section>
	</main>
	
</body>
</html>