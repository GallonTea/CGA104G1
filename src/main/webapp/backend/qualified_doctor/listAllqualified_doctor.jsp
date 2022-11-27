<%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.qualified_doctor.model.*"%>


<%
Qualified_doctorService qualified_doctorSvc = new Qualified_doctorService();
    List<Qualified_doctorVO> list = qualified_doctorSvc.getAll();
    pageContext.setAttribute("list",list);
%>
<%@include file="/backend/backNavbar.jsp"%>



<html>
<head>
<title>認證醫師總覽 </title>

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
		 	<h3>認證醫師總覽</h3>
		 	<h4><a href="<%=request.getContextPath()%>/backend/index.jsp">回首頁</a></h4>
		</td>
	</tr>
</table>

<table>
	<tr>
		<th>醫師編號</th>
		<th>會員編號</th>
		<th>認證醫師狀態</th>
		<th>修改</th>
		<th>刪除</th>
	</tr>

	<c:forEach var="qualified_doctorVO" items="${list}">
		
		<tr>
			<td>${qualified_doctorVO.doc_id}</td>
			<td>${qualified_doctorVO.mem_id}</td>


<!-- 		<td><select  name="doc_status"> -->
<%-- 				<option value="0" ${(qualified_doctorVO.doc_status==0)? 'selected':'' } >關閉中</option> --%>
<%-- 				<option value="1" ${(qualified_doctorVO.doc_status==1)? 'selected':'' } >已啟用</option> --%>
<!-- 		</select></td> -->
			
				<c:if test="${qualified_doctorVO.doc_status==0}" >
					<td><c:out value="關閉中" ></c:out></td>
				</c:if>
				<c:if test="${qualified_doctorVO.doc_status==1}">
					<td><c:out value="已啟用"></c:out></td>
				</c:if>

			<td>
			  <FORM METHOD="post" ACTION="/CGA104G1/Qualified_doctorServlet" style="margin-bottom: 0px;">
			     <input type="submit" onclick="return up_confirm()" value="修改">
			     <input type="hidden" name="doc_id"  value="${qualified_doctorVO.doc_id}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="/CGA104G1/Qualified_doctorServlet" style="margin-bottom: 0px;">
			     <input type="submit" onclick="return de_confirm()" value="刪除">
			     <input type="hidden" name="doc_id"  value="${qualified_doctorVO.doc_id}">
			     <input type="hidden" name="action" value="delete">
			  </FORM>
			</td>
		</tr>
	</c:forEach>
</table>

<a href="<%=request.getContextPath()%>/backend/qualified_doctor/addQualified_doctor.jsp" >新增醫師</a>

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

</script>
</body>
</html>