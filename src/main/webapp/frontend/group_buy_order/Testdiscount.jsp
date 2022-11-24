<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>




	 <form method="post" class="form1" action="<%=request.getContextPath()%>/backend/discount/DiscountServlet">
        <input type="hidden" name="action" value="getOne_Discount_For_Display">
        <input type="hidden" name="gbitem_id" value="1">
        <input type="hidden" name="gbitem_name" value="Petkit 小佩智能感應式除臭貓砂盆">
        <input type="hidden" name="gbitem_content" value="貓砂盆">
        <input type="hidden" name="gbitem_price" value="2380">
        <input type="hidden" name="gbitem_status" value="1">
        <input type="hidden" name="gbitem_startdate" value="2022-10-16">
        <input type="hidden" name="gbitem_enddate" value="2023-12-30">
        
        <button type="submit" class="btn btn-success">確認送出</button>
    </form>


</body>
</html>