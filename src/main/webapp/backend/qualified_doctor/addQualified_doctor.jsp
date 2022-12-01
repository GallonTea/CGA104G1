<%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.qualified_doctor.model.*"%>
<%@ page import="com.mem.model.*"%>
<%
Qualified_doctorVO qualified_doctorVO = (Qualified_doctorVO) request.getAttribute("qualified_doctorVO");

// MemVO memVO = (MemVO) session.getAttribute("memVO"); //EmpServlet.java(Concroller), 存入req的empVO物件

%>
<%@include file="/backend/backNavbar.jsp"%>

<html>
<head>
<title>認證醫師開通</title>
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
	width: 1000px;
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
	width: 50%;
	margin-top: 5px;
	margin-bottom: 5px;
}
/*    table, th, td {  */
/*      border: 1px solid #212529;  */
/*    }  */
th, td {
	padding: 5px;
	text-align: left;
}

</style>

</head>
<body bgcolor='white'>

<table id="table-1">
	<tr><td> 
	<h3>認證醫師開通 </h3>
			<button onclick="location.href='<%=request.getContextPath()%>/backend/index.jsp'">回到後台首頁</button>
	</td></tr>
</table>
<br>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Qualified_doctorServlet" name="form1">
<table>

	  <jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService" />
		<tr>
			<td>
       <b>選擇會員編號:</b>
       <select size="1" name=mem_id>
          <c:forEach var="memVO" items="${memSvc.all}" > 
          <option value="${memVO.mem_id}">${memVO.mem_name}</option>
          </c:forEach>   
       </select>
       <td style="color:red">${errorMsgs.mem_id}</td>
		</tr>
			</td>
		</tr>
		<tr>
			<td>
		<b>認證醫師狀態:</b>
		<input type="radio" name="doc_status" size="45" value="0" ${(qualified_doctorVO.doc_status=="0")? 'checked':'' }><b>關閉中</b>
		<input type="radio" name="doc_status" size="45" value="1" ${(qualified_doctorVO.doc_status=="1")? 'checked':'' }><b>已啟用</b>
		<input type="hidden" name="doc_status" value="${qualified_doctorVO.doc_status}">
			</td><td style="color:red">${errorMsgs.doc_status}</td>
		</tr>
	
	

</table>
<br>

<input type="hidden" name="action" value="insert">
<input type="submit" style="margin-left:25%" value="開通"/></FORM>

</body>


</html>