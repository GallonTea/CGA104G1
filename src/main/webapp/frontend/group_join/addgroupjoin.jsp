<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.group_join.model.*"%>
<jsp:useBean id="group_buySvc" scope="page" class="com.group_buy.model.Group_BuyService" />
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"
	integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
	crossorigin="anonymous"></script>
<title>參加團購</title>

<style>


</style>

</head>
<body bgcolor='white'>


	<h3>參團資料確認
	<a href="<%=request.getContextPath()%>/frontend/groupBuy/listallgroupbuy.html">取消</a> </h3>
<font color=red>${errorMsgs.fail}</font><br>
	<FORM METHOD="post" name="form1">
		<table>
			<tr>
				<td>團購團編號</td>
				<td><input type="hidden" name="gb_id" size="45"
					value="${group_joinVO.gb_id} " readonly />[${group_joinVO.gb_id}]-${group_joinVO.group_BuyVO.gb_name}</td>
			</tr>
			<tr>
				<td>參團會員編號:</td>
				<td><input type="hidden" name="mem_id" size="45"
					value="${group_joinVO.mem_id}" readonly />[${group_joinVO.mem_id}]-${group_joinVO.memVO.mem_name}</td>
			</tr>
			<tr>
				<td>團購付款狀態:</td>
				<td><input type="hidden" name="gbpay_status" size="45"
					value="0" /> 未付款</td>
			</tr>
			
				<tr>
				<td>取貨狀態:</td>
				<td><input type="hidden" name="pickup_status" size="45"
					value="0" />未取貨</td>
			</tr>
		<tr>
				<td>物流狀態:</td>
				<td><input type="hidden" name="deliver_status" size="45"
					value="0" />未出貨</td>
			</tr>
			<tr>
				<td>購買數量:<font color=red><b>*</b></font></td>
				<td><input class="field" type="number" name="gbbuy_amount" min="1" max="${group_joinVO.group_BuyVO.gb_min - nowamount}"
				 size="45" required
					value="${group_joinVO.gbbuy_amount}" />
					<input  class="field2" type="button"  value="計算價格" onclick="price()"  ${(errorMsgs.fail=="數量已滿,不可增加") ? 'disabled' : ' '}>
					<font color="red">${errorMsgs.gbbuy_amount}</font>
			</tr>
			
			<tr>
				<td>總價格:<font color=red><b>*</b></font></td>
				<td><input type="TEXT" name="gbbuy_price" size="4"
					value="${group_joinVO.gbbuy_price}" readonly /><font color=red>${errorMsgs.gbbuy_price}</td>
			</tr>
		</table>

<!-- 		<br> <input type="hidden" name="action" value="update">  -->
		<input type="hidden" name="deliver_status" size="45"
					value="${group_joinVO.deliver_status}" readonly /><input
			type="hidden" name="gb_id" value="${group_joinVO.gb_id}">
			<input type="hidden" name="mem_id" value="${group_joinVO.mem_id}"> 
			<div id ="yesboss"><input  class="btn btn-warning" type="button"  value="確認參加"  onclick="update()"  ${(errorMsgs.fail=="數量已滿,不可增加") ? 'disabled' : ' '}></div>
	</FORM>

	
	
	
	<script type="text/javascript">
	$(document).ready(function(){
		  $(".field").change(function(){ 
			  $("#yesboss").addClass('disabled');			 
		  });
		});
	$(document).ready(function(){
		  $(".field2").change(function(){
			  $("#yesboss").removeClass('disabled');
		  });
		});
	
	
	$(document).ready(function(){
	    $("#yesboss").mousemove(function(){ 
	        if($(this).hasClass('disabled')){
	               alert("請先計算價格");  
	        }
	    })
	 });
	
	
	function price() {
		document.form1.action="/CGA104G1/Group_JoinServlet?action=inser_Newprice";
		document.form1.submit();	
	}

	function update() {
		document.form1.action="/CGA104G1/Group_JoinServlet?action=insert";
		document.form1.submit();	
	}
	
	</script>
</body>
</html>