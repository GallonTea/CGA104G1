<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.emp.model.*"%>
<%@ page import="com.emp_effect.model.*"%>
<%@ page import="com.effect.model.*"%>
<%
EmpService empSvc = new EmpService();
List<EmpVO> list = empSvc.getAll();
pageContext.setAttribute("list", list);
%>
<%
Emp_effectService emp_effectSvc = new Emp_effectService();
List<Emp_effectVO> list2 = emp_effectSvc.getAll();
pageContext.setAttribute("list2", list2);
%>
<%@include file="/backend/backNavbar.jsp"%>
<html>
<head>
<title>所有員工資料</title>

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
.box-a{width:789px;height:100px; float:left}
.box-b{width:px;height:100px; float:left}
.box-a{ border:1px solid #00F}
.box-b{ border:1px solid #F00}
</style>

<style>
  table {
    height:90px;
	width: 780px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
   
    border: 1px solid #CCCCFF;
  }
  th, td {
 
  	height:50px;
    padding: 5px;
    text-align: center;
  }
</style>

</head>
<body bgcolor='white'>
<div class="box-a">
<table id="table-1">
	<tr><td>
		 <h3>所有員工資料</h3>
		 <h4><a href="select_page.jsp">回首頁</a></h4>
	</td></tr>
</table>
<!-- <div class="box-b"> -->
<!-- <table id="table-1"> -->
<!-- 	<tr><td> -->
<!-- 		 <h3>權限表</h3> -->
<!-- 	</td></tr> -->
<!-- </table> -->
<!-- </div> -->
<table  >
	<tr >
		<th>員工姓名</th>
		<th>員工帳號</th>
		<th>員工密碼</th>
		<th>員工到職時間</th>
		<th>員工狀態</th>
		<th colspan="2">資料變更</th>
		<th>員工權限查詢</th>
	</tr>	
	<c:forEach var="empVO" items="${list}" >
		<tr>
			<td>${empVO.emp_name}</td>
			<td>${empVO.account}</td>
			<td>${empVO.password}</td>
			<td>${empVO.onjob_date}</td>
			
			<c:if test="${empVO.emp_status==0}">
			<td><c:out value="離職"></c:out></td>
			</c:if>
			<c:if test="${empVO.emp_status==1}">
			<td><c:out value="在職"></c:out></td>
			</c:if>			
		<td>
		
		
			  <FORM METHOD="post" ACTION="EmpServlet" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="emp_id"  value="${empVO.emp_id}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="EmpServlet" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="emp_id"  value="${empVO.emp_id}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="../../backend/emp_effect/Emp_effectServlet" style="margin-bottom: 0px;">
			     <input type="submit" id="listBtn" value="查詢">
			     <input type="hidden" name="emp_id"  value="${empVO.emp_id}">
			     <input type="hidden" name="action" value="getOne_For_Display"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
</div>
</body>
</html>