<%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.group_buy_report.model.*"%>


<%
	Group_Buy_ReportService GBRSvc = new Group_Buy_ReportService();
    List<Group_Buy_ReportVO> list = GBRSvc.getAll();
    pageContext.setAttribute("list",list);
%>
<%@include file="/backend/backNavbar.jsp"%>



<html>
<head>
<title>團購檢舉</title>
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
	width: 80%;
	margin-top: 5px;
	margin-bottom: 5px;
}
/*    table, th, td {  */
/*      border: 1px solid #212529;  */
/*    }  */
th, td {
	padding: 5px;
	text-align: center;
}

</style>

</head>
<body bgcolor='white'>

<table id="table-1" >

		<td>
		 <h3>團購檢舉管理 </h3>
		 	<button onclick="location.href='<%=request.getContextPath()%>/backend/index.jsp'">回到後台首頁</button>
			<button onclick="location.href='<%=request.getContextPath()%>/frontend/group_buy_report/addGroup_Buy_Report.jsp'">我要檢舉</button>
		</td>
	</tr>
</table>

	<table class="styled-table">
		<thead>
	<tr>
		<th>團購檢舉編號</th>
		<th>團購訂單編號</th>
		<th>會員編號</th>
		<th>團購檢舉內容</th>
		<th>團購檢舉時間</th>
		<th>團購檢舉狀態</th>
		<th>團購檢舉審核結果</th>
		<th>員工編號</th>
		<th>修改</th>
		<th>刪除</th>
	</tr>
		</thead>
		<tbody>
	<c:forEach var="Group_Buy_ReportVO" items="${list}">
		
		<tr>
			<td>${Group_Buy_ReportVO.gbfrep_id}</td>
			<td>${Group_Buy_ReportVO.gborder_id}</td>
			<td>${Group_Buy_ReportVO.mem_id}</td>
			<td>${Group_Buy_ReportVO.frep_content}</td>
			<td>${Group_Buy_ReportVO.frep_time}</td>




<!-- 		<td><select  name="mem_status"> -->
<%-- 				<option value="0" ${(memVO.mem_status==0)? 'selected':'' } >停權</option> --%>
<%-- 				<option value="1" ${(memVO.mem_status==1)? 'selected':'' } >未驗證</option> --%>
<%-- 				<option value="2" ${(memVO.mem_status==2)? 'selected':'' } >已驗證</option> --%>
<!-- 		</select></td> -->

	
			<c:if test="${Group_Buy_ReportVO.frep_status==0}" >
					<td><c:out value="待審核" ></c:out></td>
			</c:if>
			<c:if test="${Group_Buy_ReportVO.frep_status==1}">
					<td><c:out value="已審核"></c:out></td>
			</c:if>

			
			
			<c:if test="${Group_Buy_ReportVO.frep_result==0}" >
					<td><c:out value="尚未審核完畢" ></c:out></td>
			</c:if>
			<c:if test="${Group_Buy_ReportVO.frep_result==1}">
					<td><c:out value="檢舉屬實"></c:out></td>
			</c:if>
			<c:if test="${Group_Buy_ReportVO.frep_result==2}">
					<td><c:out value="檢舉不屬實"></c:out></td>
			</c:if>

			<td>${Group_Buy_ReportVO.emp_id}</td> 


			<td>
			  <FORM METHOD="post" ACTION="/CGA104G1/Group_Buy_ReportServlet" style="margin-bottom: 0px;">
<!-- 			     <input type="submit" onclick="return up_confirm()" value="修改"> -->
			     <button type="submit" onclick="return up_confirm()">修改</button>
			     <input type="hidden" name="gbfrep_id"  value="${Group_Buy_ReportVO.gbfrep_id}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Group_Buy_ReportServlet" style="margin-bottom: 0px;">
<!-- 			     <input type="submit" onclick="return de_confirm()" value="刪除"> -->
			     <button type="submit" onclick="return up_confirm()">刪除</button>
			     <input type="hidden" name="gbfrep_id"  value="${Group_Buy_ReportVO.gbfrep_id}">
			     <input type="hidden" name="action" value="delete">
			   </FORM>
			</td>
		</tr>
	</c:forEach>
</tbody>

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