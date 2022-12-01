<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.group_join.model.*"%>
<%@ page import="java.util.*"%>
<%
Boolean verify = (boolean)session.getAttribute("verify");

Integer gb_id = (Integer) request.getAttribute("gb_id");
Group_JoinService group_joinSvc = new Group_JoinService();
List<Group_JoinVO> group_joinVO = group_joinSvc.getOneGb(gb_id);
pageContext.setAttribute("group_joinVO", group_joinVO);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
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
width: 830px;
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

.ok{
float:right;
margin-right:162px;
margin-top: 13px; 


}

/* <!-- ===========================================樣式欄位================================================================== --> */
table#table-1 {
	background-color: #212529;
	border: 2px solid black;
	text-align: center;
	margin-left: auto;
	margin-right: auto;
	width: 830px;
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
	
	margin-top: 5px;
	margin-bottom: 5px;
}
/*    table, th, td {  */
/*      border: 1px solid #212529;  */
/*    }  */
th, td {
	width:AUTO;
	padding: 5px;
	text-align: center;
}
/*   td:first-child{ */
/*   border-top-left-radius: 10px; */
/*   border-bottom-left-radius: 10px; */
/* } */

/* td:last-child{ */
/*   border-top-right-radius: 10px; */
/*   border-bottom-right-radius: 10px; */
/* } */
</style>

</head>
<body>
<table class="styled-table">
		<thead>
			<tr>
				<!-- 				<th>購買商品</th> -->
				<th>團購團編號</th>
				<th>會員編號</th>
				<th>團購付款狀態</th>
				<th>取貨狀態</th>
				<th>物流狀態</th>
				<th>購買數量</th>
				<th>價格</th>
				<th>繳費確認</th>
				<th>物流確認</th>
				<th>取貨確認</th>

			</tr>
		</thead>
		<tbody>
			<c:forEach var="group_joinVO" items="${group_joinVO}">
				<tr class="active-row" align='center' valign='middle'>
					<%-- 					<td>${group_joinVO.emp_id}</td> --%>
					<td>${group_joinVO.gb_id}</td>
					<td>${group_joinVO.mem_id}</td>
					<td>${group_joinVO.gbpay_status==0 ? '未付款':'已付款'}</td>
					<td>${group_joinVO.pickup_status==0 ? '未取貨':'已取貨'}</td>
					
					
					<c:if test="${group_joinVO.deliver_status==0}">
				<td><c:out value="未出貨"></c:out></td>
					</c:if>
					<c:if test="${group_joinVO.deliver_status==1}">
				<td><c:out value="已出貨"></c:out></td>
					</c:if>
					<c:if test="${group_joinVO.deliver_status==2}">
				<td><c:out value="配送中"></c:out></td>
					</c:if>
					<c:if test="${group_joinVO.deliver_status==3}">
				<td><c:out value="已送達"></c:out></td>
					</c:if>
					<td>${group_joinVO.gbbuy_amount}</td>
					<td>${group_joinVO.gbbuy_price}</td>

					<td>
						<FORM METHOD="post" ACTION="/CGA104G1/Group_JoinServlet" style="margin-bottom: 0px;">
							<input type="submit" value="已繳費" ${group_joinVO.gbpay_status>0 ? 'disabled=" "' :' '} > 
							<input type="hidden"name="gbpay_status" value="1"> 
							<input type="hidden" name="gb_id" value="${group_joinVO.gb_id}">
							<input type="hidden" name="mem_id" value="${group_joinVO.mem_id}">
							<input type="hidden" name="action" value="updatePay">
						</FORM>
					</td>
					<td>
						<FORM METHOD="post" ACTION="/CGA104G1/Group_JoinServlet" style="margin-bottom: 0px;">
							<select class="status" name="deliver_status" 
							${group_joinVO.deliver_status==3 ? 'disabled=" "' :' '} 
							>
								<option value="0"
									${(group_joinVO.deliver_status==0)? 'selected': ''}>未出貨</option>
								<option value="1"
									${(group_joinVO.deliver_status==1)? 'selected': ''}>已出貨</option>
								<option value="2"
									${(group_joinVO.deliver_status==2)? 'selected': ''}>配送中</option>
								<option value="3"
									${(group_joinVO.deliver_status==3)? 'selected': ''}>已送達</option>

							</select> <input type="hidden" name="action" value="updateDeliver">
									  <input type="hidden" name="gb_id" value="${group_joinVO.gb_id}">
									  <input type="hidden" name="mem_id" value="${group_joinVO.mem_id}"> 
									  <input type="submit" value="送出修改" ${group_joinVO.deliver_status==3 ? 'disabled=" "' :' '} >
						</FORM>
					</td>
					<td>
						<FORM METHOD="post" ACTION="/CGA104G1/Group_JoinServlet" style="margin-bottom: 0px;">
							<input type="submit" value="已取貨" ${group_joinVO.pickup_status>0 ? 'disabled=" "' :' '}> 
							<input type="hidden" name="pickup_status" value="1">
							<input type="hidden" name="gb_id" value="${group_joinVO.gb_id}"> 
							<input type="hidden" name="mem_id" value="${group_joinVO.mem_id}">
							<input type="hidden" name="action" value="updatePickup">
						</FORM>

					</td>

				</tr>
			</c:forEach>
		</tbody>
	</table>
<%-- 	<c:forEach var="group_joinVO" items="${group_joinVO}"> --%>
						<FORM METHOD="post" ACTION="/CGA104G1/Group_JoinServlet" style=" " class = "ok">
							<input type= "${verify==true ? 'submit' : 'hidden'}" value="已取貨" >
							<input type="hidden" name="gb_id" value="${gb_id}">  
							<input type="hidden" name="action" value="update_gb_status">
						</FORM>
<%-- 						</c:forEach> --%>
</body>
</html>