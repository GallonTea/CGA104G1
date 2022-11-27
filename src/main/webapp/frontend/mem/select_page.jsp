<%@ page import="com.mem.model.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
MemVO memVO = (MemVO) session.getAttribute("memVO"); //EmpServlet.java(Concroller), 存入req的empVO物件
%>
<%@include file="/backend/backNavbar.jsp"%>

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
<body bgcolor='white'  style="color:white">

<table id="table-1">
   <tr><td><h3>會員資料查詢 </h3></td></tr>
</table>


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
  <li><b>查詢所有會員:</b><a href='<%=request.getContextPath()%>/frontend/mem/listAllMem.jsp'>  List All</a>  <br><br></li>
  
  
  <li>
    <FORM METHOD="post" ACTION="/CGA104G1/MemServlet" >
        <b>輸入會員編號 (如1,2,3):</b>
        <input type="text" name="mem_id">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="送出">
    </FORM>
  </li>

  <jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService" />
   
  <li>
     <FORM METHOD="post" ACTION="/CGA104G1/MemServlet" >
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
     <FORM METHOD="post" ACTION="/CGA104G1/MemServlet" >
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

<ul>  
  <li>   
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/mem/listAllMem.jsp" name="form2">
        <b><font color=blue>萬用複合查詢:</font></b> <br>
       <b>輸入會員編號:</b>
       <input type="text" name="mem_id" value=""><br>
       
       <b>輸入會員帳號:</b>
       <input type="text" name="mem_account" value=""><br>
           
       <b>輸入會員姓名:</b>
       <input type="text" name="mem_name" value=""><br>
              
       <b>選擇性別:</b>
       <select size="1" name="mem_sex" >
          <option value="">
         <c:forEach var="memVO" items="${memSvc.all}" > 
          <option value="${memVO.mem_sex}">${memVO.mem_sex}
         </c:forEach>   
       </select><br>
       
       <b>選擇狀態:</b>
       <select size="1" name="mem_status" >
          <option value="">
         <c:forEach var="memVO" items="${memSvc.all}" > 
          <option value="${memVO.mem_status}">${memVO.mem_status}
         </c:forEach>   
       </select><br>
       
       <b>會員生日:</b>
	   <input name="mem_dob" id="f_date1" type="text">
		        
        <input type="submit" value="送出">
        <input type="hidden" name="action" value="MemSerchPro">
     </FORM>
  </li>
</ul>


<h3>會員管理</h3>

	<td>
		<FORM ACTION="/CGA104G1/MemServlet" style="margin-bottom: 0px;">

		<input type="submit" value="修改基本資料">
			<input type="hidden" name="mem_id"  value="${memVO.mem_id }">
		<input type="hidden" name="action"	value="getOne_For_UpdateMem"></FORM>
	</td>


<A HREF='<%=request.getContextPath()%>/frontend/mem/login.jsp'>回到登入頁面</A>

</body>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>
<script type="text/javascript">
$.datetimepicker.setLocale('zh');
$('#f_date1').datetimepicker({
    theme: '',              //theme: 'dark',
   timepicker:false,       //timepicker:true,
   step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
   format:'Y-m-d',         //format:'Y-m-d H:i:s',
   value: '',              // value:   new Date(),
   //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
   //startDate:	            '2017/07/10',  // 起始日
   //minDate:               '-1970-01-01', // 去除今日(不含)之前
   //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
});
</script>
</html>