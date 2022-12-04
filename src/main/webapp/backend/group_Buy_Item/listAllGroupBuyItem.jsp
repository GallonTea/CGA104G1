<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.group_buy_item.model.*"%>
<%-- <%@ page import="lombok.EqualsAndHashCode.Include"%> --%>
<%
Group_Buy_ItemService group_Buy_ItemService = new Group_Buy_ItemService();
List<Group_Buy_ItemVO> list = group_Buy_ItemService.getAll();
pageContext.setAttribute("list", list);
%>
<html>
<head>
<meta charset="UTF-8">
<title>所有團購商品</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/static/css/backend.css">
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

th, td{
	color: black;
}
</style>

<style>
table {
	width: 800px;
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
<body>

<!-- 複製起點 -->
	<nav><%@include file="/backend/topNavbar.jsp"%></nav>
	<main>
		<%@include file="/backend/leftside.jsp"%>
		<section>
<!-- 		把原本body的東西貼到這邊 -->
<table id="table-1">
		<tr>
			<td>
				<h3>所有團購商品 - listAllGroupBuyItem.jsp</h3>
			</td>
			<td>
				<h4>
					<a href="<%=request.getContextPath()%>/backend/group_Buy_Item/select_page.jsp">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>
	<table>
		<tr>
			<th>團購商品編號</th>
			<th>團購商品名稱</th>
			<th>團購商品內容</th>
			<th>團購商品價格</th>
			<th>團購商品狀態</th>
			<th>團購商品上檔日期</th>
			<th>團購商品下檔日期</th>
			<th>團購商品類別</th>
		</tr>
		<%@ include file="page1.file" %> 
		<c:forEach var="Group_Buy_ItemVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
			<tr>
				<td>${Group_Buy_ItemVO.gbitem_id}</td>
				<td>${Group_Buy_ItemVO.gbitem_name}</td>
				<td>${Group_Buy_ItemVO.gbitem_content}</td>
				<td>${Group_Buy_ItemVO.gbitem_price}</td>
<%-- 				<td>${Group_Buy_ItemVO.gbitem_status}</td> --%>
				<c:if test="${Group_Buy_ItemVO.gbitem_status == '0'}"><td><c:out value="超出團購期限下架"></td></c:out></c:if>
				<c:if test="${Group_Buy_ItemVO.gbitem_status == '1'}"><td><c:out value="上架中"></td></c:out></c:if>
				<c:if test="${Group_Buy_ItemVO.gbitem_status == '2'}"><td><c:out value="無庫存"></td></c:out></c:if>
				<c:if test="${Group_Buy_ItemVO.gbitem_status == '3'}"><td><c:out value="有庫存"></td></c:out></c:if>
				<td>${Group_Buy_ItemVO.gbitem_startdate}</td>
				<td>${Group_Buy_ItemVO.gbitem_enddate}</td>
				<td>${Group_Buy_ItemVO.gbitem_type}</td>
				
				
				<td>
				  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Group_Buy_Item/groupBuyItem.do" style="margin-bottom: 0px;">
				     <input type="submit" value="修改">
				     <input type="hidden" name="gbitem_id"  value="${Group_Buy_ItemVO.gbitem_id}">
				     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
				</td>
				<td>
				  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Group_Buy_Item/groupBuyItem.do" style="margin-bottom: 0px;">
				     <input type="submit" value="刪除">
				     <input type="hidden" name="gbitem_id"  value="${Group_Buy_ItemVO.gbitem_id}">
				     <input type="hidden" name="action" value="delete"></FORM>
				</td>
				</tr>
		</c:forEach>
		</table>
		<%@ include file="page2.file" %>
		</section>
	</main>
<!-- 複製終點 -->



</body>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- <script type="text/javascript"> -->
// 	var gbitemStatus = ["超出團購期限下架", "上架中", "無庫存", "有庫存"];
// 	var txt = "";
	
	
	
	
// 	$(document).ready(function(){
// 		if($("td:nth-child(5)") == 0){
// 			$("td:nth-child(5)").after("超出團購期限下架")
// 		}
// 		  });
	
// 	console.log(	
// 			$("td:nth-child(5)").after("超出團購期限下架")
// 		  	);
	

<!-- </script> -->

</html>