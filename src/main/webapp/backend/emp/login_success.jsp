<%@page import="com.emp_effect.model.Emp_effectVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.emp.model.*"%>
<%@ page import="com.emp_effect.model.*"%>
<%@ page import="com.effect.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%
EmpService empSvc = new EmpService();
List<EmpVO> list = empSvc.login((String)session.getAttribute("account"),(String)session.getAttribute("password"));
session.setAttribute("list", list);
%> 


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>login_success.jsp</title>
</head>
<body>

<button  type= "button" onclick="window.location.href='login2.jsp'">登出</button>
       
	<br>
	
	<table border='1' cellpadding='5' cellspacing='0' width='400'>
		<tr bgcolor='orange' align='center' valign='middle' height='300'>
		
			 <td> 
			
			       <h3> 登入成功的頁面 - login_success.jsp           </h3> 
			        <c:forEach var="empVO" items="${list}" begin="0" end="0" >
	              <div>${empVO.emp_name} 你好</div>	
					</c:forEach>
			       
				 
			 </td>
			 
		</tr>
	</table>


	<b> <br>
	<br>                以下留空....
	</b>
	
	<table>
		
	<c:forEach var="empVO" items="${list}" >
	<c:if test="${empVO.getEffect_id()==1}">
		<input type="button"  value="員工管理" onclick="window.location.href='../emp/select_page.jsp'"/>
			</c:if>
			<c:if test="${empVO.getEffect_id()==2}">
		<input type="button"  value="xx管理" onclick="window.location.href='../effect/select_page.jsp'"/>
			</c:if>
			<c:if test="${empVO.getEffect_id()==3||empVO.getEffect_id()==1}">
		<input type="button"  value="x3管理" onclick="window.location.href='../emp/select_page.jsp'"/>
			</c:if>		
	</c:forEach>	

</table>
	
	
</body>
</html>
