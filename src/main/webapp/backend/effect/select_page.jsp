<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/static/css/backend.css">
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
<nav><%@include file="/backend/topNavbar.jsp"%></nav>
	<main>
		<%@include file="/backend/leftside.jsp"%>
		<section>
<h3>資料查詢:</h3>
<table id="table-1">
   <tr><td><h3>權限首頁</h3></td></tr>
</table>

<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
<ul>
  <li><a href='listAllEffect.jsp'>List</a> all Effect.  <br><br></li>
  
  
  <li>
    <FORM METHOD="post" ACTION="EffectServlet" >
        <input type="text" name="effect_id">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="送出">
    </FORM>
  </li>

  <jsp:useBean id="effectSvc" scope="page" class="com.effect.model.EffectService" />
   
  <li>
     <FORM METHOD="post" ACTION="EffectServlet" >
       <b>選擇權限編號:</b>
       <select size="1" name="effect_id">
         <c:forEach var="effectVO" items="${effectSvc.all}" > 
          <option value="${effectVO.effect_id}">${effectVO.effect_id}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="送出">
    </FORM>
  </li>
  
  <li>
     <FORM METHOD="post" ACTION="EffectServlet" >
       <b>選擇權限名稱:</b>
       <select size="1" name="effect_id">
        <c:forEach var="effectVO" items="${effectSvc.all}" > 
          <option value="${effectVO.effect_id}">${effectVO.effect_name}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="送出">
     </FORM>
  </li>
</ul>
<ul>
  <li><a href='addEffect.jsp'>Add</a> a new Effect.</li>
</ul>


		</section>
	</main>

</body>
</html>