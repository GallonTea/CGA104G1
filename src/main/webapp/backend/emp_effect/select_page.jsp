<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/static/css/backend.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/static/css/backendStyle.css">
<title>員工權限首頁</title>
<style>
section{
	text-align: center;
}
</style>

</head>
<body>
<nav><%@include file="/backend/topNavbar.jsp"%></nav>
	<main>
		<%@include file="/backend/leftside.jsp"%>
		<section>
	<div class="titleBlock">員工權限管理首頁</div>
  
  
    <FORM METHOD="post" ACTION="Emp_effectServlet" >
    <b>輸入權限編號:</b>
        <input type="text" name="emp_id">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="送出" class="btn btn-info btnIn btnSmall"><font color=red>${errorMsgs.emp_id}</font>
    </FORM><br>

  <jsp:useBean id="emp_effectSvc" scope="page" class="com.emp_effect.model.Emp_effectService" />
   
     <FORM METHOD="post" ACTION="Emp_effectServlet" >
       <b>選擇權限編號:</b>
       <select size="1" name="emp_id">
         <c:forEach var="emp_effectVO" items="${emp_effectSvc.all}" > 
          <option value="${emp_effectVO.emp_id}">${emp_effectVO.emp_id}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="送出" class="btn btn-info btnIn btnSmall">
    </FORM><br>
  
     <FORM METHOD="post" ACTION="Emp_effectServlet" >
       <b>選擇權限名稱:</b>
       <select size="1" name="emp_id">
        <c:forEach var="emp_effectVO" items="${emp_effectSvc.all}" > 
          <option value="${emp_effectVO.emp_id}">${emp_effectVO.emp_id}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="送出" class="btn btn-info btnIn btnSmall">
     </FORM><br>
		<button onclick="location.href='<%=request.getContextPath()%>/backend/emp_effect/addEmp_Effect.jsp'" class="btn btn-success btnL">新增員工權限</button>
					&ensp;&ensp;
		<button onclick="location.href='<%=request.getContextPath()%>/backend/emp_effect/listAllEmp_Effect.jsp'" class="btn btn-dark btnL">查詢所有員工權限</button>	
		</section>
	</main>

</body>
</html>