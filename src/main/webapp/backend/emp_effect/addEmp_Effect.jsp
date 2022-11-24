<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="com.emp_effect.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.effect.model.*"%>
<jsp:useBean id="empSvc" scope="page" class="com.emp.model.EmpService" />
<jsp:useBean id="effectSvc" scope="page" class="com.effect.model.EffectService"/>

<%
Integer emp_id = (Integer)session.getAttribute("emp_id");

Emp_effectVO emp_effectVO = (Emp_effectVO) request.getAttribute("Emp_effectVO");
%>
<!DOCTYPE html>
<%@include file="/backend/backNavbar.jsp"%>
<html>
<head>

<title>權限新增資料 </title>

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
	<tr><td>
		 <h3>權限資料新增 - addEmp.jsp</h3></td><td>
		 <h4><a href="select_page.jsp">首頁</a></h4>
	</td></tr>
</table>

<h3>資料新增:</h3>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="Emp_effectServlet" name="form1">
<table>
	<tr>
		<td>員工姓名:</td>
		<td><input type="hidden" name="emp_id" size="45" 
			 value="${emp_effectVO.emp_id}"/>${emp_effectVO.empVO.emp_name}</td>
	</tr>
	<tr>
		<td>權限:</td>
		
		<td>
		<select class="effect" name="effect_id">
		<c:forEach var="effectVO" items="${effectSvc.all}">
		<option value="${effectVO.effect_id}">${effectVO.effect_name}</option>
		</c:forEach>
		</select>
		</td>
		
	</tr>


</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="送出新增"></FORM>
</body>