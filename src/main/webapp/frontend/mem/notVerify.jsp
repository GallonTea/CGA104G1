<%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@page import="com.mem.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
Integer mem_id=(Integer)session.getAttribute("mem_id");
String mem_email=(String)session.getAttribute("mem_email");
MemService memSvc = new MemService();
MemVO memVO= memSvc.findByMemId(mem_id);
session.setAttribute("memVO", memVO);
%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>notVerify</title>
</head>
<body>
<%-- <% System.out.print(mem_email); %> --%>
<%int memID=memVO.getMem_id(); %>
<%String memEmail=memVO.getMem_email(); %>
				<form method="post" action="/CGA104G1/MemServlet" >
<table border='1' cellpadding='5' cellspacing='0' width="500" height="300">
		<tr bgcolor='skyblue' align='center' valign='middle' height='20'>
			<th>
			<div style="color:white">您的帳號尚未驗證成功，請重新至信箱查收驗證碼：</div>
			<br> 
<!-- 			系統將在<span style="color: red">120</span>秒後跳轉回首頁!<br> -->

				請輸入驗證碼: <input type="text" name="regpasschk"> <br>

				

					<input type="hidden" name="action" value="regconfirm"> 
					
					<input type="hidden" name="mem_id" value="<%= memID %>">
					<input id="1" type="submit" value="確認送出" style="margin-left: 100px"></form>
					
					<form method="post" action="/CGA104G1/MemServlet" >
					<input type="hidden" name="action" value="resend"> 
					<input type="hidden" name="mem_email" value="<%= memEmail %>">
					<input type="hidden" name="mem_id" value="<%= memID %>">
					<input id="2" type="submit" value="重寄驗證信" style="margin-left: 100px"></form>
					
					<div style="color:red">${msg}</div>

					



			</th>

		</tr>

	</table>

	
</body>
</html>
