<%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@page import="com.mem.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
Integer mem_id=(Integer)session.getAttribute("mem_id");
String mem_email=(String)session.getAttribute("mem_email");
MemService memSvc = new MemService();
MemVO memVO= memSvc.findByMemId(mem_id);
session.setAttribute("memVO", memVO);
session.invalidate();
%>
<%= memVO==null %>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>notVerify</title>
</head>
<body>
<%-- <% System.out.print(mem_email); %> --%>

				<form method="post" action="<%=request.getContextPath()%>/MemServlet" >
<table border='1' cellpadding='5' cellspacing='0' width="500" height="300">
		<tr bgcolor='skyblue' align='center' valign='middle' height='20'>
			<th>
			<div style="color:red">您的帳號已被停權,請聯繫管理員</div>
			<br> 
<!-- 			系統將在<span style="color: red">120</span>秒後跳轉回首頁!<br> -->





					<input type="button" value="回到登入頁面" onclick="location.href='<%=request.getContextPath()%>/frontend/memLogin/login.jsp'">
					
					<input type="button" value="寄信給客服" onclick="location.href='要前往的網頁連結'">


					<div style="color:red">${msg}</div>

					



			</th>

		</tr>

	</table>

	
</body>
</html>
