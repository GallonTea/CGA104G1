<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<!-- ===============================來自團購編號查詢============================================= -->
<title>團購查詢</title>
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
<table id="table-1">
   <tr><td><h3>團購訂單查詢</h3></td></tr>
</table>

<ul>
  <li><a href='#'>回會員主頁</a>  <br><br></li>
  
  
  <li>
    <FORM METHOD="post" ACTION="/CGA104G1/Group_Buy_OrderServlet" >
        <input type="text" name="gborder_id">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="送出">
        <br>
        <font color=red>${errorMsgs.gborder_id}</font>
    </FORM>
  </li>

</ul>
</body>
</html>