<%@ page import="com.mem.model.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
MemVO memVO = (MemVO) session.getAttribute("memVO"); //EmpServlet.java(Concroller), 存入req的empVO物件
%>
<%= memVO==null %>

<html>
<head>
<title>會員查詢</title>
<style>
  table#table-1 {
	width: 450px;
	background-color: gray;
	margin-top: 5px;
	margin-bottom: 10px;
    border: 3px ridge black;
    height: 80px;
    text-align: center;
  }
  table#table-1 h4 {
    color: yellow;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

</head>
<body bgcolor='white'>

<table id="table-1">
   <tr><td><h3>會員查詢 Home</h3></td></tr>
</table>


<h3>資料查詢:</h3>${memVO.mem_id }

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<ul>
  <li><b>查詢所有會員:</b><a href='listAllMem.jsp'>  List All</a>  <br><br></li>
  
  
  <li>
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/mem/mem.do" >
        <b>輸入會員編號 (如1,2,3):</b>
        <input type="text" name="mem_id">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="送出">
    </FORM>
  </li>

  <jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService" />
   
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/mem/mem.do" >
       <b>選擇會員編號:</b>
       <select size="1" name=mem_id>
         <c:forEach var="memVO" items="${memSvc.all}" > 
          <option value="${memVO.mem_id}">${memVO.mem_id}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="送出">
    </FORM>
  </li>
  
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/mem/mem.do" >
       <b>選擇會員姓名:</b>
       <select size="1" name="mem_id">
         <c:forEach var="memVO" items="${memSvc.all}" > 
          <option value="${memVO.mem_id}">${memVO.mem_name}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="送出">
     </FORM>
  </li>
</ul>


<h3>會員管理</h3>


	<td>
		<FORM ACTION="<%=request.getContextPath()%>/frontend/mem/mem.do" style="margin-bottom: 0px;">

		<input type="submit" value="修改基本資料">
			<input type="hidden" name="mem_id"  value="${memVO.mem_id }">
		<input type="hidden" name="action"	value="getOne_For_UpdateMem"></FORM>
	</td>



<!-- <ul> -->
<!--   <li><b>手動新增會員:</b><a href='addMem.jsp'>  Add Mem	</a>  <br><br></li> -->
<!-- </ul> -->
<br>

<A HREF='<%=request.getContextPath()%>/frontend/mem/login.jsp'>回到登入頁面</A>

</body>
</html>