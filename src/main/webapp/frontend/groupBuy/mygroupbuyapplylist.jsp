<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.group_buy.model.*"%>


<%
pageContext.getAttribute("list");
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- import font-style -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@300&display=swap"
	rel="stylesheet">


<!-- import jquery-3.6.0 -->
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- import icon -->
<script src="https://kit.fontawesome.com/b5ef6b60f3.js"
	crossorigin="anonymous"></script>

<script src="https://cdn.bootcdn.net/ajax/libs/qs/6.11.0/qs.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<title>我的團購團申請單狀態</title>
<style>
html {
	font-size: 22px;
}

.home_main {
	z-index: -999999;
	position: relative;
	transition: 3s;
	opacity: 30%;
	height: 4160px;
	width: auto;
	background-image:
		url('../resources/static/image/andrew-s-ouo1hbizWwo-unsplash.jpg');
	background-repeat: no-repeat;
	background-size: 100%;
	background-color: transparent;
	transform: scale(1.111);
	margin-bottom: 10%;
}

body {
	background: #eee;
}

footer {
	background: #fbaa70;
	padding: 50px 10px;
	font-size: 18px;
}

.badge {
	padding-left: 9px;
	padding-right: 9px;
	-webkit-border-radius: 9px;
	-moz-border-radius: 9px;
	border-radius: 9px;
}

.label-warning[href], .badge-warning[href] {
	background-color: #c67605;
}

#lblCartCount {
	font-size: 12px;
	background: #ff0000;
	color: #fff;
	padding: 0 5px;
	vertical-align: top;
	margin-left: -10px;
}

/* footer 樣式 */
footer {
	border-top: solid 1px #c9c9c9;
	padding: 80px 0px;
}

footer a {
	color: black;
	text-decoration: none;
}

footer a:hover {
	color: #929292;
	opacity: 60%;
}

footer {
	border-top: solid 1px #c9c9c9;
	padding: 80px 0;
	background-color: white;
}

footer img {
	width: 110px;
	margin-bottom: 0;
}

@media all and (min-width: 992px) {
	.navbar .nav-item .dropdown-menu {
		display: none;
	}
	.navbar .nav-item:hover .nav-link {
		
	}
	.navbar .nav-item:hover .dropdown-menu {
		display: block;
	}
	.navbar .nav-item .dropdown-menu {
		margin-top: 0;
	}
}
</style>

</head>

<body>
	<main>
		<div class="container">
			<a
				href="<%=request.getContextPath()%>/frontend/groupBuy/listallgroupbuuy.jsp">返回團購首頁</a>
			<table class="table table-hover table-striped">
				<tr>
					<th>團購團名稱</th>
					<th>團購主編號</th>
					<th>團購商品編號</th>
					<th>團購商品數量低標</th>
					<th>目前已下訂團購商品數量</th>
					<th>團購開始</th>
					<th>團購結束</th>
					<th>團購狀態</th>
					<th>團購價格</th>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
				</tr>
				<%-- 		<%@ include file="page1.file" %>  --%>
				<%-- 		<c:forEach var="Group_BuyVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>"> --%>
				<c:forEach var="Group_BuyVO" items="${list}">
					<tr>
						<td>${Group_BuyVO.gb_name}</td>
						<td>${Group_BuyVO.mem_id}</td>
						<td>${Group_BuyVO.gbitem_id}</td>
						<td>${Group_BuyVO.gb_min}</td>
						<td>${Group_BuyVO.gb_amount}</td>
						<td>${Group_BuyVO.gbstart_date}</td>
						<td>${Group_BuyVO.gbend_date}</td>
						<%-- 				<td>${Group_BuyVO.gb_status}</td> --%>
						<c:if test="${Group_BuyVO.gb_status == '0'}">
							<td><c:out value="參團人數不足"></td>
							</c:out>
						</c:if>
						<c:if test="${Group_BuyVO.gb_status == '1'}">
							<td><c:out value="參團人數已達標"></td>
							</c:out>
						</c:if>
						<td>${Group_BuyVO.gb_price}</td>
						<td>
						<FORM METHOD="post"
							ACTION="<%=request.getContextPath()%>/GroupBuyServlet"
							style="margin-bottom: 0px;">
							<input type="submit" value="取消團購"> 
							<input type="hidden" name="gb_id" value="${Group_BuyVO.gb_id}"> 
							<input type="hidden" name="mem_id" value="${Group_BuyVO.mem_id}">
							<input type="hidden" name="action" value="deleteByGroupBuyMaster">
						</FORM>
						</td>
						<td><FORM METHOD="post"
<%-- 							ACTION="<%=request.getContextPath()%>" --%>
							style="margin-bottom: 0px;">
							<input type="submit" value="修改團購資訊"> 
							<input type="hidden" name="gb_id" value="${Group_BuyVO.gb_id}"> 
							<input type="hidden" name="mem_id" value="${Group_BuyVO.mem_id}">
							<input type="hidden" name="action" value="deleteByGroupBuyMaster">
						</FORM></td>
						<td><FORM METHOD="post"
							ACTION="<%=request.getContextPath()%>/backend/discount/DiscountServlet"
							style="margin-bottom: 0px;">
							<input type="submit" value="立即結帳"> 
							<input type="hidden" name="gb_id" value="${Group_BuyVO.gb_id}"> 
							<input type="hidden" name="mem_id" value="${Group_BuyVO.mem_id}">
							<input type="hidden" name="gbitem_id" value="${Group_BuyVO.gbitem_id}">
							<input type="hidden" name="action" value="deleteByGroupBuyMaster">
						</FORM></td>
						<td><FORM METHOD="post"
							ACTION="<%=request.getContextPath()%>/GroupBuyServlet"
							style="margin-bottom: 0px;">
							<input type="submit" value="團購結束"> 
							<input type="hidden" name="gb_id" value="${Group_BuyVO.gb_id}"> 
							<input type="hidden" name="mem_id" value="${Group_BuyVO.mem_id}">
							<input type="hidden" name="gbitem_id" value="${Group_BuyVO.gbitem_id}">
							<input type="hidden" name="action" value="">
						</FORM></td>
				</c:forEach>
			</table>
			<%-- 		<%@ include file="page2.file" %> --%>
		</div>
	</main>

	<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
		integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
		integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
		crossorigin="anonymous"></script>
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
	<!--  NavBar  -->
	<script src="../../resources/static/js/navbar.js"></script>
	<!--  Footer  -->
	<script src="../../resources/static/js/footer.js"></script>
</body>

</html>