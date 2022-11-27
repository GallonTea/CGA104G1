<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.group_buy.model.*"%>
<%@ page import="com.group_buy_item.model.*"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="com.discount.model.*"%>
<%
Group_BuyVO group_BuyVO = (Group_BuyVO) request.getAttribute("Group_BuyVO");
%>
<%
Group_Buy_ItemVO group_Buy_ItemVO = (Group_Buy_ItemVO) request.getAttribute("Group_Buy_ItemVO");
%>

<%
DiscountService discountSvc = new DiscountService();
Integer gbitem_id = (Integer) session.getAttribute("gbitem_id");
List<DiscountVO> list = discountSvc.getoneGbitem_id((Integer) session.getAttribute("gbitem_id"));
pageContext.setAttribute("list", list);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
</head>
<body>
	<div class="container"><main>

	<form
		action="<%=request.getContextPath()%>/GroupBuyMasterApplyListServlet">

<!-- 		<div class="form-group"> -->
<!-- 			<label for="formGroupExampleInput2">團購商品原始價格</label> -->
			<%-- 					<div>${Group_Buy_ItemVO.gbitem_price}</div> --%>
<!-- 		</div> -->


		<!-- 				<FORM METHOD="post" -->
		<%-- 					ACTION="<%=request.getContextPath()%>/Discount/Discount.do"> --%>
		<br> <b>選擇折扣:</b> <select size="1" name="discount_price">
			<c:forEach var="DiscountVO" items="${list}">
				<option value="${DiscountVO.discount_price}">
					${DiscountVO.discount_nar} , 原始價格為${Group_Buy_ItemVO.gbitem_price}
					,
					折扣後價格為${DiscountVO.discount_price*Group_Buy_ItemVO.gbitem_price*0.01}
				
			</c:forEach>
		</select> 
		<br>
		<input type="hidden" name="gbitem_price"
			value="${Group_Buy_ItemVO.gbitem_price}"> <input
			type="hidden" name="gb_id" value="${Group_BuyVO.gb_id}"> 
			<input type="hidden" name="gb_price" value="${Group_BuyVO.gb_price}">
			<input type="hidden" name="mem_id" value="${Group_BuyVO.mem_id}">
			<input type="hidden" name="action" value="confirmGroupBuy"> 
			<input type="submit" value="確認開團">
	</form>
	<FORM METHOD="post"
		ACTION="<%=request.getContextPath()%>/GroupBuyServlet"
		style="margin-bottom: 0px;">
		<input type="submit" value="取消開團"> 
		<input type="hidden"name="gb_id" value="${Group_BuyVO.gb_id}"> 
		<input type="hidden" name="mem_id" value="${Group_BuyVO.mem_id}"> 
		<input type="hidden" name="action" value="deleteByGroupBuyMaster">
	</FORM>

</main></div>
	
</body>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
</html>