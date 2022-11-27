<%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.mem.model.*"%>


<%
MemService memSvc = new MemService();
    List<MemVO> list = memSvc.getAll();
    pageContext.setAttribute("list",list);
%>
<%@include file="/backend/backNavbar.jsp"%>



<html>
<head>
<title>會員帳號管理 </title>

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

</style>

<style>
  table {
	width: 100%;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 4px;
    text-align: center;
  }
</style>

</head>
<body bgcolor='white'>

<table id="table-1">
	<tr>
		<td>
		 <h3>會員帳號管理 </h3>
		 <h4><a href="<%=request.getContextPath()%>/frontend/mem/select_page.jsp">回首頁</a></h4>
		</td>
	</tr>
</table>

<table>
	<tr>
		<th>會員編號</th>
		<th>會員帳號</th>
		<th>會員姓名</th>
		<th>會員地址</th>
		<th>會員電話</th>
		<th>會員證號</th>
		<th>會員Email</th>
		<th>會員性別</th>
		<th>會員生日</th>
		<th>會員狀態</th>
		<th>修改</th>
		<th>刪除</th>
	</tr>

	<c:forEach var="memVO" items="${list}">
		
		<tr>
			<td>${memVO.mem_id}</td>
			<td>${memVO.mem_account}</td>
			<td>${memVO.mem_name}</td>
			<td>${memVO.mem_address}</td>
			<td>${memVO.mem_phone}</td>
			<td>${memVO.mem_uid}</td> 
			<td>${memVO.mem_email}</td>
			<td>${memVO.mem_sex}</td>
			<td>${memVO.mem_dob}</td>


<!-- 		<td><select  name="mem_status"> -->
<%-- 				<option value="0" ${(memVO.mem_status==0)? 'selected':'' } >停權</option> --%>
<%-- 				<option value="1" ${(memVO.mem_status==1)? 'selected':'' } >未驗證</option> --%>
<%-- 				<option value="2" ${(memVO.mem_status==2)? 'selected':'' } >已驗證</option> --%>
<!-- 		</select></td> -->

	
			<c:if test="${memVO.mem_status==0}" >
					<td><c:out value="停權" ></c:out></td>
			</c:if>
			<c:if test="${memVO.mem_status==1}">
					<td><c:out value="未驗證"></c:out></td>
			</c:if>
			<c:if test="${memVO.mem_status==2}">
					<td><c:out value="已驗證"></c:out></td>
			</c:if>


			<td>
			  <FORM METHOD="post" ACTION="/CGA104G1/MemServlet" style="margin-bottom: 0px;">
			     <input type="submit" onclick="return up_confirm()" value="修改">
			     <input type="hidden" name="mem_id"  value="${memVO.mem_id}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="/CGA104G1/MemServlet" style="margin-bottom: 0px;">
			     <input type="submit" onclick="return de_confirm()" value="刪除">
			     <input type="hidden" name="mem_id"  value="${memVO.mem_id}">
			     <input type="hidden" name="action" value="delete">
			   </FORM>
			</td>
		</tr>
	</c:forEach>
</table>

<script>

function up_confirm(){
	var r=confirm("你確定要修改嗎?")
  		if (r==true){
	   		return true;
  		}else{
	 		 return false;
  		}
 }
  
function de_confirm(){
	var r=confirm("你確定要刪除嗎?")
		if (r==true){
	  		alert("成功刪除");
  		}else{
	  		return false;
  		}
}

// window.onbeforeunload = function(){

// return confirm('Are you sure you want to leave this page?');

</script>

</body>
</html>