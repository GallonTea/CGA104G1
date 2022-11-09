<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.effect.model.*"%>

<%
EffectService effectSvc = new EffectService();
List<EffectVO> list = effectSvc.getAll();
pageContext.setAttribute("list", list);
%>
<html>
<head>
<title>所有權限資料</title>

<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

<style>
  table {
	width: 800px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>

</head>
<body bgcolor='white'>
<table id="table-1">
	<tr><td>
		 <h3>所有權限資料</h3>
		 <h4><a href="select_page.jsp">回首頁</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>權限編號</th>
		<th>權限名稱</th>
		<th>權限說明</th>

	</tr>

	<c:forEach var="effectVO" items="${list}" >
		
		<tr>
			<td>${effectVO.effect_id}</td>
			<td>${effectVO.effect_name}</td>
			<td>${effectVO.effect_info}</td>

			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/effect/effect.do" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="effect_id"  value="${effectVO.effect_id}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/effect/effect.do" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="effect_id"  value="${effectVO.effect_id}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>


</body>
</html>