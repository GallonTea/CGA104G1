<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.emp_effect.model.*"%>
<%
// Emp_effectVO emp_effectVO = (Emp_effectVO) request.getAttribute("emp_effectVO");
%>
<%@include file="/backend/backNavbar.jsp"%>
<html>
<head>

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




	<FORM METHOD="post" ACTION="Emp_effectServlet" name="form1">
		<table>
		
			<tr>
				<td>員工編號:</td>
				<td><input type="TEXT" name="emp_id" size="45"
					value="${emp_effectVO.emp_id}" /></td>
			</tr>
			<tr>
				<td>權限帳號:</td>
				<td><input type="TEXT" name="effect_id" size="45"
					value="${emp_effectVO.effect_id}" /></td>
			</tr>
			
		</table>

		<br> <input type="hidden" name="action" value="insert"> <input
			type="hidden" name="emp_id" value="${emp_effectVO.emp_id}"> 
			<input type="submit" value="送出修改">
	</FORM>

</body>
</html>