<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<FORM METHOD="post" ACTION="/CGA104G1/Group_Buy_OrderServlet"
				name="form1">

				<input type="text" name="pickup_time" value="1"><br>	
				<input type="submit" value="送出"> <input type="hidden"
					name="action" value="listgroup_buy_order">
			</FORM>
</body>
</html>