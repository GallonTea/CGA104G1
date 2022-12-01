<%@page import="com.qualified_doctor.model.Qualified_doctorVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%
Qualified_doctorVO qualified_doctorVO = (Qualified_doctorVO) request.getAttribute("qualified_doctorVO");
%>
<%-- <%= memVO==null %> --%>
<%@include file="/backend/backNavbar.jsp"%>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>認證醫師修改 </title>

<style>
  table#table-1 {
	background-color: gray;
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
  .password{
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
    border: 0px solid black;
  }
  th, td {
    padding: 1px;
  }
</style>
</head>
<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		 <h3>醫師認證狀態 </h3>
		 <h4><a href="<%=request.getContextPath()%>/backend/index.jsp">回首頁</a></h4>
	</td></tr>
</table>


<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="/CGA104G1/Qualified_doctorServlet" name="form1">
<table>

<!-- 	<tr> -->
<!-- 		<td>認證醫師編號:</td> -->
<!-- 		<td><input type="TEXT" name="doc_id" size="45"  -->
<%-- 			 value="<%= (qualified_doctorVO==null)? "" : qualified_doctorVO.getDoc_id()%>" /></td> --%>
<!-- 	</tr> -->

<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService" />
		<tr>
		<td style="color:gray">會員編號:</td>
		<td><input type="TEXT" name="mem_id" readonly style="color:gray" size="45" 
			value="${qualified_doctorVO.mem_id}- 【${memVO.mem_name}】"></td>
<%-- 			 value="<%= (qualified_doctorVO==null)? "1" : qualified_doctorVO.getMem_id()%>" /></td> --%>
	</tr>

<!-- 	<tr> -->
<!-- 		<td>會員帳號:</td> -->
<!-- 		<td><input type="TEXT" name="mem_account" size="45"  -->
<%-- 			 value="<%= (memVO==null)? "xyz" : memVO.getMem_account()%>" /></td> --%>
<!-- 	</tr> -->
<!-- 		<tr> -->
<!-- 	<tr> -->
<!-- 		<td>會員姓名:</td> -->
<!-- 		<td><input type="TEXT" name="mem_name" size="45"  -->
<%-- 			 value="<%= (memVO==null)? "Amy" : memVO.getMem_name()%>" /></td> --%>
<!-- 	</tr> -->
<!-- 		<tr> -->
<!-- 		<td>會員Email:</td> -->
<!-- 		<td><input type="TEXT" name="mem_email" size="45" -->
<%-- 			 value="<%= (memVO==null)? "abc123@gmail.com" : memVO.getMem_email()%>" /></td> --%>
<!-- 	</tr> -->

		<tr>
		<td >狀態修改:</td>
		<td>

		<input type="radio" name="doc_status" size="45" value="0" ${(qualified_doctorVO.doc_status==0)? 'checked':'' }><b>關閉中</b>
		<input type="radio" name="doc_status" size="45" value="1" ${(qualified_doctorVO.doc_status==1)? 'checked':'' }><b>已開啟</b>
		<input type="hidden" name="doc_status" value="${qualified_doctorVO.doc_status}">
		</td><td style="color:red">${errorMsgs.doc_status}</td>
		</tr>

	
</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="doc_id" value="<%=qualified_doctorVO.getDoc_id()%>">
<input type="submit" value="送出修改"></FORM>
<script>		console.log(${qualified_doctorVO.doc_status});</script>
</body>

</html>