
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<title>login</title>
</head>
<body>
	<center>
		<form action="/CGA104G1/MemServlet" method="post">

			<table border=1>
				<tr>
					<td colspan=2>
						<p align=center>

							<b>忘記帳號</b><br>
					</td>
				</tr>

				<tr>
					<td>身分證字號 :</td>
					<td><input type="text" name="mem_uid" value="" size=25></td>
				</tr>
				<tr>
					<td>會員信箱  :</td>
					<td><input type="TEXT" name="mem_email" value="" size=25></td>
					
					
									<tr>
					<td colspan=2 align=center>
					<input type="hidden" name="action" value="forgotac">
					<input type="submit" value="送出">
					<input type="reset" value="清除"></td>
				</tr>

					
			</table>
		</form>
		<form action="/CGA104G1/MemServlet" method="post">

			<table border=1>
				<tr>
					<td colspan=2>
						<p align=center>

							<b>忘記密碼</b><br>
					</td>
				</tr>

				<tr>
					<td>會員帳號 :</td>
					<td><input type="TEXT" name="mem_account" value="" size=25></td>
				</tr>
				<tr>
					<td>會員信箱  :</td>
					<td><input type="TEXT" name="mem_email" value="" size=25></td>
					
					
				<tr>
					<td colspan=2 align=center>
					<input type="hidden" name="action" value="forgotpw">
					<input type="submit" value="送出">
					<input type="reset" value="清除"></td>
				</tr>

					
			</table>
		</form>

<%-- 			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/mem/forgot.jsp" style="margin-bottom: 0px;"> --%>
<!-- 			     <input type="submit" value="忘記密碼"> -->
<!-- 			     <input type="hidden" name="action" value="forget"> -->
<!-- 			  </FORM> -->

				</tr>

				<tr>	
				<div style="color:red">${msg}</div>
				</tr>

	</center>
</body>
</html>
