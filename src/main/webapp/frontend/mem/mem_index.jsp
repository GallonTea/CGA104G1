
<%@ page import="com.mem.model.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
MemVO memVO = (MemVO) session.getAttribute("memVO"); //EmpServlet.java(Concroller), 存入req的empVO物件
%>
<%= memVO==null %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>會員管理</h3>

	<td>
		<FORM ACTION="<%=request.getContextPath()%>/MemServletFront" style="margin-bottom: 0px;">

		<input type="submit" value="修改基本資料">
		<input type="hidden" name="mem_id"  value="${memVO.mem_id }">
		<input type="hidden" name="action"	value="getOne_For_UpdateMem"></FORM>
	</td>
	<input type="button" value="回到登入頁面" onclick="location.href='<%=request.getContextPath()%>/frontend/memLogin/login.jsp'">
</body>
</html>