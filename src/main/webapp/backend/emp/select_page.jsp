<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%@include file="/backend/backNavbar.jsp"%>
<html>
<head>
<title>首頁</title>
<style>

/* /* ===================================================================== */ */


/* /* ===================================================================== */ */\
  table#table-1 {
	width: 450px;
	background-color: #212529;
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
<!-- ====================================================== -->
<!--  <div class="container"> -->
<!--       <h2>Video Category</h2> -->

<!--       <div class="select-box"> -->
<!--         <div class="options-container"> -->
<!--           <div class="option"> -->
<!--             <input -->
<!--               type="radio" -->
<!--               class="radio" -->
<!--               id="automobiles" -->
<!--               name="category" -->
<!--             /> -->
<!--             <label for="automobiles">Automobiles</label> -->
<!--           </div> -->

<!--           <div class="option"> -->
<!--             <input type="radio" class="radio" id="film" name="category" /> -->
<!--             <label for="film">Film & Animation</label> -->
<!--           </div> -->

<!--           <div class="option"> -->
<!--             <input type="radio" class="radio" id="science" name="category" /> -->
<!--             <label for="science">Science & Technology</label> -->
<!--           </div> -->
<!--         </div> -->

<!--         <div class="selected"> -->
<!--           Select Video Category -->
<!--         </div> -->
<!--       </div> -->
<!--     </div> -->

<!-- ====================================================== -->



































<h3>資料查詢:</h3>
<table id="table-1">
  <c:forEach var="empVO" items="${list}" begin="0" end="0" >				
   <tr><td><h3>${empVO.emp_name}</h3></td></tr>
   	</c:forEach>
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
  <li><a href='listAllEmp.jsp'>List</a> all Emp  <br><br></li>
  
  
  <li>
    <FORM METHOD="get" ACTION="EmpServlet" >
        <input type="text" name="emp_id">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="送出">
    </FORM>
  </li>

  <jsp:useBean id="empSvc" scope="page" class="com.emp.model.EmpService" />
   
  <li>
     <FORM METHOD="post" ACTION="EmpServlet" >
       <b>選擇員工編號:</b>
       <select size="1" name="emp_id">
         <c:forEach var="empVO" items="${empSvc.all}" > 
          <option value="${empVO.emp_id}">${empVO.emp_id}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="送出">
    </FORM>     
  </li>
  
  <li>
     <FORM METHOD="post" ACTION="EmpServlet" >
       <b>選擇員工名稱:</b>
       <select size="1" name="emp_id">
        <c:forEach var="empVO" items="${empSvc.all}" > 
          <option value="${empVO.emp_id}">${empVO.emp_name}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="送出">
     </FORM>
  </li>
  <jsp:useBean id="effectSvc" scope="page" class="com.effect.model.EffectService"/>  
  <li>
     <FORM METHOD="post" ACTION="EffectServlet" >
       <b>選擇員工名稱:</b>
       <select size="1" name="emp_id">
        <c:forEach var="empVO" items="${empSvc.all}" > 
          <option value="${empVO.emp_id}">${empVO.emp_name}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="送出">
     </FORM>
  </li>
</ul>
<ul>
  <li><a href='addEmp.jsp'>Add</a> a new Emp.</li>
</ul>


</body>
<script type="text/javascript">
const selected = document.querySelector(".selected");
const optionsContainer = document.querySelector(".options-container");

const optionsList = document.querySelectorAll(".option");

selected.addEventListener("click", () => {
  optionsContainer.classList.toggle("active");
});

optionsList.forEach(o => {
  o.addEventListener("click", () => {
    selected.innerHTML = o.querySelector("label").innerHTML;
    optionsContainer.classList.remove("active");
  });
});
</script>

</html>