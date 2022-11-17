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
   <tr><td><h3>團購訂單查詢首頁</h3></td></tr>
</table>

<ul>
  <li><a href='listAllEffect.jsp'>List</a> all Effect.  <br><br></li>
  
  
  <li>
    <FORM METHOD="post" ACTION="Group_Buy_OrderServlet" >
        <input type="text" name="gborder_id">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="送出">
        <br>
        <font color=red>${errorMsgs.gborder_id}</font>
    </FORM>
  </li>

</ul>
<ul>
  <li><a href='addEffect.jsp'>Add</a> a new Effect.</li>
</ul>


</body>
</html>