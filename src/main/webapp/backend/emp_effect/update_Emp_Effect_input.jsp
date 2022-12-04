<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.emp_effect.model.*"%>
<%
// Emp_effectVO emp_effectVO = (Emp_effectVO) request.getAttribute("emp_effectVO");
%>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/static/css/backend.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/static/css/backendStyle.css">
<title>權限資料修改</title>

<style>
table {
	width: 450px;
	height: 100px;
	margin-top: 1px;
	margin-bottom: 1px;
	margin-left: 25%;
}

table, th, td {
	border: 0px solid #CCCCFF;
}

th, td {
	padding: 1px;
}

 .btn-warning{
  	margin-top: 15px;
  }
  
  .btnTitle{
  	margin-top: 25px;
  }
</style>

</head>
<body>

<nav><%@include file="/backend/topNavbar.jsp"%></nav>
	<main>
		<%@include file="/backend/leftside.jsp"%>
		<section>
		<div class="btnTitle">
			<button onclick="location.href='<%=request.getContextPath()%>/backend/emp_effect/select_page.jsp'" class="btn btn-primary btnIn">回員工權限管理首頁</button>
		</div>
		<div class="titleBlock">修改員工權限</div>
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

		<br> 
		<div class="subBlock">
		<input type="hidden" name="action" value="insert"> <input
			type="hidden" name="emp_id" value="${emp_effectVO.emp_id}"> 
			<input type="submit" value="送出修改" class="btn btn-success btnIn">
		</div>
	</FORM>
		</section>
	</main>





	

</body>
</html>