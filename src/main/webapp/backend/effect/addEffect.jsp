<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.effect.model.*"%>

<%
  EffectVO effectVO = (EffectVO) request.getAttribute("effectVO");
%>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/static/css/backend.css">
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
<nav><%@include file="/backend/topNavbar.jsp"%></nav>
	<main>
		<%@include file="/backend/leftside.jsp"%>
		<section>
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

<FORM METHOD="post" ACTION="EffectServlet" name="form1">
<table>
	<tr>
		<td>權限編號:</td>
		<td><input type="TEXT" name="effect_id" size="45" 
			 value="<%= (effectVO==null)? "1" : effectVO.getEffect_id()%>" /></td>
	</tr>
	<tr>
		<td>權限名稱:</td>
		<td><input type="TEXT" name="effect_name" size="45"
			 value="<%= (effectVO==null)? "員工" : effectVO.getEffect_name()%>" /></td>
	</tr>
	<tr>
		<td>權限說明:</td>
		<td><input type="TEXT" name="effect_info" size="45"
			 value="<%= (effectVO==null)? "打雜" : effectVO.getEffect_info()%>" /></td>
	</tr>


</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="送出新增"></FORM>
		</section>
	</main>

</body>

