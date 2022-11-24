<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.group_buy_item.model.*"%>
<%
Group_Buy_ItemService group_Buy_ItemService = new Group_Buy_ItemService();
List<Group_Buy_ItemVO> list = group_Buy_ItemService.getAll();
pageContext.setAttribute("list", list);
%>
<%@include file="/backend/backNavbar.jsp"%>
<html>
<head>
<title>GroupBuyItem: Home</title>

<style>
table#table-1 {
	width: 450px;
	background-color: #CCCCFF;
	margin-top: 5px;
	margin-bottom: 10px;
	border: 3px ridge Gray;
	height: 80px;
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

</head>
<body bgcolor='white'>
	<!-- **********************************************************************************************************************************************************
      MAIN CONTENT 內容寫在這裡面
      *********************************************************************************************************************************************************** -->
	<!--main content start-->
	<section id="main-content">
		<section class="wrapper">
			<div id="gbi-select">
				<%-- 錯誤表列 --%>
				<c:if test="${not empty errorMsgs}">
					<font style="color: red">請修正以下錯誤:</font>
					<ul>
						<c:forEach var="message" items="${errorMsgs}">
							<li style="color: red">${message}</li>
						</c:forEach>
					</ul>
				</c:if>

				<ul>
					<li><a href='<%=request.getContextPath()%>/backend/group_Buy_Item/listAllGroupBuyItem.jsp'>List</a> all Discount. <br>
					<br></li>


					<li>
						<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Group_Buy_Item/groupBuyItem.do">
							<b>輸入團購商品編號:</b> <input type="text" name="gbitem_id"> <input
								type="hidden" name="action" value="getOne_For_Display">
							<input type="submit" value="送出">
						</FORM>
					</li>

					<jsp:useBean id="gbiSvc" scope="page"
						class="com.group_buy_item.model.Group_Buy_ItemService" />

					<li>
						<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Group_Buy_Item/groupBuyItem.do">
							<b>選擇團購商品編號:</b> <select size="1" name="gbitem_id">
								<c:forEach var="Group_Buy_ItemVO" items="${list}">
									<option value="${Group_Buy_ItemVO.gbitem_id}">${Group_Buy_ItemVO.gbitem_id}
								</c:forEach>
							</select> <input type="hidden" name="action" value="getOne_For_Display">
							<input type="submit" value="送出">
						</FORM>
					</li>

					<li>
						<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Group_Buy_Item/groupBuyItem.do">
							<b>團購商品選擇:</b> <select size="1" name="gbitem_id">
								<c:forEach var="Group_Buy_ItemVO" items="${list}">
									<option value="${Group_Buy_ItemVO.gbitem_id}">${Group_Buy_ItemVO.gbitem_name}
								</c:forEach>
							</select> 
							<input type="hidden" name="action" value="getOne_For_Display">
							<input type="submit" value="送出">
						</FORM>
					</li>
					
				</ul>


				<h3>團購商品管理</h3>

				<ul>
					<li><a href='<%=request.getContextPath()%>/backend/group_Buy_Item/addGroupBuyItem.jsp'>Add</a> a new groupBuyItem.</li>
				</ul>

			</div>
		</section>
	</section>

	<!--main content end-->



</body>
</html>