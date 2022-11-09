<%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ page import="com.mem.model.*"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
MemVO memVO = (MemVO) request.getAttribute("memVO");
%>
<%= memVO==null %>
<html>
<head>
<title>會員資料 </title>

<style>
  table#table-1 {
	background-color: gray;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: yellow;
    display: block;
    margin-bottom: 1px;
  }

</style>

<style>
  table {
	width: 600px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid black;
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
		 <h3>會員資料 </h3>
		 <h4><a href="select_page.jsp">回首頁</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>會員帳號</th>
		<th>會員密碼</th>
		<th>會員編號</th>
		<th>會員姓名</th>
		<th>會員地址</th>
		<th>會員電話</th>
		<th>會員證號</th>
		<th>會員Email</th>
		<th>會員性別</th>
		<th>會員生日</th>
		<th>會員狀態</th>
		
	</tr>
	<tr>
		<td><%=memVO.getMem_account()%></td>
		<td><%=memVO.getMem_password()%></td>
		<td><%=memVO.getMem_id()%></td>
		<td><%=memVO.getMem_name()%></td>
		<td><%=memVO.getMem_address()%></td>
		<td><%=memVO.getMem_phone()%></td>
		<td><%=memVO.getMem_uid()%></td>
		<td><%=memVO.getMem_email()%></td>
		<td><%=memVO.getMem_sex()%></td>
		<td><%=memVO.getMem_dob()%></td>
		<td><%=memVO.getMem_status()%></td>
	</tr>
</table>

</body>
</html>