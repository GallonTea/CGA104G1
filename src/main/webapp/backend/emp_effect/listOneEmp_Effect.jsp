<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.emp_effect.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="empSvc" scope="page" class="com.emp.model.EmpService" />
<jsp:useBean id="effectSvc" scope="page" class="com.effect.model.EffectService" />
<%
Integer emp_id =(Integer)request.getAttribute("emp_id");
Emp_effectService emp_effectSvc = new Emp_effectService();
List<Emp_effectVO> list = emp_effectSvc.getOneEmp(emp_id);
pageContext.setAttribute("list", list);
%>
<%@include file="/backend/backNavbar.jsp"%>

<html>
<head>
<title>權限單查</title>

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
	width: 600px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>

</head>
<body bgcolor='white'>

<table id="table-1">
	<tr>
	<td>
		 <h3>權限資料</h3> 
	</td>
	<td>
	</td></tr>
</table>
<div>

<FORM METHOD="post" ACTION="../../backend/emp/EmpServlet" style="margin-bottom: 0px;">
			     <input type="submit" value="回員工查詢">
<%-- 			     <input type="hidden" name="effect_id"  value="${effect_id}"> --%>
			     <input type="hidden" name="action" value="listemp_and_effect"></FORM>
			   
</div>
 

<table>
	<tr>
		<th>員工姓名</th>
		<th>權限</th>
		<th colspan="2">資料變更</th>
		
	</tr>
	<c:forEach var="emp_effectVO" items="${list}" >
	<tr>
		<td>${emp_effectVO.empVO.emp_name}</td>
		<td>${emp_effectVO.effectVO.effect_name}</td>
		<td>
		  <FORM METHOD="post" ACTION="Emp_effectServlet" style="margin-bottom: 0px;">
			     <input type="submit" value="新增">
			     <input type="hidden" name="emp_id"  value="${emp_effectVO.emp_id}">
			     <input type="hidden" name="action"	value="go_Insert"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="Emp_effectServlet" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="effect_id"  value="${emp_effectVO.effect_id}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
	</tr>
	</c:forEach>
</table>

</body>
</html>