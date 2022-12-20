<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.effect.model.*"%>

<%
  EffectVO effectVO = (EffectVO) request.getAttribute("effectVO");
%>
<html>
<head>

<title>新增權限</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/static/css/backend.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/static/css/backendStyle.css">

<style>
  table {
	width: 450px;
	height: 200px;
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
			<button onclick="location.href='<%=request.getContextPath()%>/backend/effect/select_page.jsp'" class="btn btn-primary btnIn">回權限管理首頁</button>
		</div>
		<div class="titleBlock">新增權限</div>
<FORM METHOD="post" ACTION="EffectServlet" name="form1">
<table>
	<tr>
		<td>權限名稱:</td>
		<td><input type="TEXT" name="effect_name" size="45"
			 value="<%= (effectVO==null)? "員工" : effectVO.getEffect_name()%>" /><br><font color="red">${errorMsgs.effect_name}</font></td>
	</tr>
	<tr>
		<td>權限說明:</td>
		<td><input type="TEXT" name="effect_info" size="45"
			 value="<%= (effectVO==null)? "打雜" : effectVO.getEffect_info()%>" /><br><font color="red">${errorMsgs.effect_info}</font></td>
	</tr>


</table>
<br>
<div class="subBlock">
<input type="hidden" name="action" value="insert">

<input type="submit" value="送出新增" class="btn btn-success btnIn"></FORM>
</div>
		</section>
	</main>

</body>

