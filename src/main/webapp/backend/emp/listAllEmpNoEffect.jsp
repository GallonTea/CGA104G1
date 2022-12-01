<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.emp.model.*"%>

<%-- 萬用複合查詢-可由客戶端select_page.jsp隨意增減任何想查詢的欄位 --%>
<%-- 此頁只作為複合查詢時之結果練習，可視需要再增加分頁、送出修改、刪除之功能--%>

<%-- <jsp:useBean id="listEmps_ByCompositeQuery" scope="request" type="java.util.List<EmpVO>" /> <!-- 於EL此行可省略 --> --%>

<%@include file="/backend/backNavbar.jsp"%>
<html>
<head>
<title>複合查詢 - listAllEmpNoEffect.jsp</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
	crossorigin="anonymous"></script>

<style>
/* <!-- ===========================================樣式欄位================================================================== --> */

/* tr:nth-child(odd){ */
/*   background:white; */
/* } */

/* tr:nth-child(even){ */
/*   background:#a4a9ad; */
/* } */
.styled-table {
	margin-left: auto;
	margin-right: auto;
	border-collapse: collapse;
	margin: auto;
	font-size: 0.9em;
	font-family: sans-serif;
	min-width: 400px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
}

.styled-table thead tr {
	background-color: #212529;
	color: #ffffff;
	text-align: left;
}

.styled-table th, .styled-table td {
	padding: 12px 15px;
}

.styled-table tbody tr {
	border-bottom: 1px solid #dddddd;
}

.styled-table tbody tr:nth-of-type(even) {
	background-color: #f3f3f3;
}

.styled-table tbody tr:last-of-type {
	border-bottom: 2px solid #212529;
}

.styled-table tbody tr.active-row {
	font-weight: bold;
	color: #212529;
}

/* <!-- ===========================================樣式欄位================================================================== --> */
table#table-1 {
	background-color: #212529;
	border: 2px solid black;
	text-align: center;
	margin-left: auto;
	margin-right: auto;
	width: 800px;
	margin-top: 5px;
	margin-bottom: 5px;
}

table#table-1 h4 {
	color: red;
	display: block;
	margin-bottom: 1px;
}

h3 {
	color: #6c757d;
}

h4 {
	color: blue;
	display: inline;
}

/*   a{ */
/*     color: white; */
/*     display: inline; */
/*   } */
</style>

<style>
table {
	margin-left: auto;
	margin-right: auto;
	width: 800px;
	margin-top: 5px;
	margin-bottom: 5px;
}
/*    table, th, td {  */
/*      border: 1px solid #212529;  */
/*    }  */
th, td {
	padding: 5px;
	text-align: center;
}
/*   td:first-child{ */
/*   border-top-left-radius: 10px; */
/*   border-bottom-left-radius: 10px; */
/* } */

/* td:last-child{ */
/*   border-top-right-radius: 10px; */
/*   border-bottom-right-radius: 10px; */
/* } */
</style>

</head>
<body bgcolor='white'>

	<table id="table-1">
		<tr>
			<th><h3>所有員工資料</h3>
				<h4>
					<a class="btn btn-light" href="select_page.jsp">員工資料查詢首頁</a>
				</h4></th>
		</tr>
	</table>

	<!-- ===========================================樣式欄位================================================================== -->

	<table class="styled-table">
		<thead>
			<tr>
				<th>員工編號</th>
				<th>員工姓名</th>
				<th>雇用日期</th>
				<th>員工狀態</th>
				<th colspan="2">變更資料</th>
				<th>查詢權限</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="empVO" items="${listemp_and_effect}">
				<tr class="active-row" align='center' valign='middle'>
					<td>${empVO.emp_id}</td>
					<td>${empVO.emp_name}</td>
					<td>${empVO.onjob_date}</td>
					<td>${empVO.emp_status}</td>
					<td>
						<FORM METHOD="post" ACTION="EmpServlet"
							style="margin-bottom: 0px;">
							<input type="submit" value="修改"> <input type="hidden"
								name="emp_id" value="${empVO.emp_id}"> <input
								type="hidden" name="action" value="getOne_For_Update">
						</FORM>
					</td>
					<td>
						<FORM METHOD="post" ACTION="EmpServlet"
							style="margin-bottom: 0px;">
							<input type="submit" value="刪除"> <input type="hidden"
								name="emp_id" value="${empVO.emp_id}"> <input
								type="hidden" name="action" value="delete">
						</FORM>
					</td>
					<td>
						<FORM METHOD="post"
							ACTION="../../backend/emp_effect/Emp_effectServlet"
							style="margin-bottom: 0px;">
							<input type="submit" id="listBtn" value="查詢"> <input
								type="hidden" name="emp_id" value="${empVO.emp_id}"> <input
								type="hidden" name="action" value="getOne_For_Display">
						</FORM>
					</td>
				</tr>
			</c:forEach>
		</tbody>

	</table>
</body>
</html>