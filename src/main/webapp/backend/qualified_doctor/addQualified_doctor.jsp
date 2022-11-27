<%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.qualified_doctor.model.*"%>
<%@ page import="com.mem.model.*"%>
<%
Qualified_doctorVO qualified_doctorVO = (Qualified_doctorVO) request.getAttribute("qualified_doctorVO");

MemVO memVO = (MemVO) session.getAttribute("memVO"); //EmpServlet.java(Concroller), 存入req的empVO物件

%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>會員資料新增 </title>

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
	<h3>驗證醫師新增 </h3>
		 <h4><a href="<%=request.getContextPath()%>/backend/index.jsp">回首頁</a></h4>
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

<FORM METHOD="post" ACTION="/CGA104G1/Qualified_doctorServlet" name="form1">
<table>


<!-- 	<tr> -->
<!-- 		<td>認證醫師編號:</td> -->
<!-- 		<td><input type="TEXT" name="doc_id" size="45"  -->
<%-- 			 value="<%= (qualified_doctorVO==null)? "" : qualified_doctorVO.getDoc_id()%>" /></td> --%>
<!-- 	</tr> -->
<!-- 		<tr> -->
<!-- 		<td>會員編號:</td> -->
<!-- 		<td><input type="TEXT" name="mem_id" size="45"  -->
<%-- 			 value="<%= (qualified_doctorVO==null)? " " : qualified_doctorVO.getMem_id()%>" /></td> --%>
<%-- 			 <td style="color:red">${errorMsgs.mem_id}</td> --%>
<!-- 	</tr> -->
	  <jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService" />
		<tr>
			<td>
       <b>選擇會員編號:</b>
       <select size="1" name=mem_id>
          <c:forEach var="memVO" items="${memSvc.all}" > 
          <option value="${memVO.mem_id}">${memVO.mem_name}</option>
          </c:forEach>   
       </select>
			</td>
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
<input type="submit" value="送出新增"></FORM>
</body>


</html>