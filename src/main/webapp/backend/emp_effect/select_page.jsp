<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%@include file="/backend/backNavbar.jsp"%>
<html>
<head>

<title>首頁</title>
<style>
  table#table-1 {
	width: 450px;
	background-color: #CCCCFF;
	margin-top: 5px;
	margin-bottom: 10px;
    border: 3px ridge Gray;
    height: 80px;
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

</head>
<body bgcolor='white'>
<h3>資料查詢:</h3>
<table id="table-1">
   <tr><td><h3>權限首頁</h3></td></tr>
</table>


<ul>
  <li><a href='listAllEmp_Effect.jsp'>List</a> all Effect.  <br><br></li>
  
  
  <li>
    <FORM METHOD="post" ACTION="Emp_effectServlet" >
        <input type="text" name="emp_id">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="送出"><font color=red>${errorMsgs.emp_id}</font>
    </FORM>
  </li>

  <jsp:useBean id="emp_effectSvc" scope="page" class="com.emp_effect.model.Emp_effectService" />
   
  <li>
     <FORM METHOD="post" ACTION="Emp_effectServlet" >
       <b>選擇權限編號:</b>
       <select size="1" name="emp_id">
         <c:forEach var="emp_effectVO" items="${emp_effectSvc.all}" > 
          <option value="${emp_effectVO.emp_id}">${emp_effectVO.emp_id}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="送出">
    </FORM>
  </li>
  
  <li>
     <FORM METHOD="post" ACTION="Emp_effectServlet" >
       <b>選擇權限名稱:</b>
       <select size="1" name="emp_id">
        <c:forEach var="emp_effectVO" items="${emp_effectSvc.all}" > 
          <option value="${emp_effectVO.emp_id}">${emp_effectVO.emp_id}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="送出">
     </FORM>
  </li>
</ul>
<ul>
  <li><a href='addEmp_Effect.jsp'>Add</a> a new Effect.</li>
</ul>


</body>
</html>