
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

							<b>會員登入</b><br>
					</td>
				</tr>

				<tr>
					<td>帳號 :</td>
					<td><input type="text" name="username" value="" size=25></td>
				</tr>
				<tr>
					<td>密碼 :</td>
					<td><input type="password" name="password" value="" size=25></td>
				</tr>


				<tr>
					<td colspan=2 align=center>
					<input type="hidden" name="action" value="login">
					<input type="submit" value="送出">
					<input type="reset" value="清除"></td>
				</tr>




			</table>
				<tr>
					<td colspan="2"></td>
				</tr>
		</form>

		<tr>
	
			  <FORM ACTION="<%=request.getContextPath()%>/frontend/mem/register.jsp" style="margin-bottom: 0px;">
				 	<span style="color:blue">沒有會員?點此</span>
			     <input type="submit" value="註冊會員">
			     <input type="hidden" name="action"	value="register">
			  </FORM>

			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/mem/forgot.jsp" style="margin-bottom: 0px;">
			     <span style="color:blue">忘記帳號或密碼?點擊</span>
			     <input type="submit" value="忘記帳號/密碼">
			     <input type="hidden" name="action" value="forget">
			  </FORM>

				</tr>

				<tr>	
				<div style="color:red">${msg}</div>
				</tr>

	</center>
</body>
</html>
