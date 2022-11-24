<%@page import="com.mem.model.MemVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%
MemVO memVO = (MemVO) session.getAttribute("memVO");
%>

<%= memVO==null %>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>會員資料修改 </title>

<style>
  table#table-1 {
	background-color: gray;
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
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
  }
  table, th, td {
    border: 0px solid black;
  }
  th, td {
    padding: 1px;
  }
</style>

</head>
<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		 <h3>會員資料修改 </h3>
		 <h4><a href="<%=request.getContextPath()%>/frontend/mem/select_page.jsp">回首頁</a></h4>
	</td></tr>
</table>

<h3>資料修改:</h3>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="/CGA104G1/MemServlet" name="form1">
<table>

<!-- 	<tr> -->
<!-- 		<td>會員帳號:</td> -->
<%-- 		<td><input type="TEXT" name="mem_account" size="45" value="<%=memVO.getMem_account()%>" /></td> --%>
<!-- 	</tr> -->
	<tr>
		<td>會員密碼:</td>
		<td><input type="password" name="mem_password" size="45"	value="<%=memVO.getMem_password()%>" /></td>
	</tr>
<!-- 		<tr> -->
<!-- 		<td>確認密碼:</td> -->
<%-- 		<td><input type="TEXT" name="mem_password" size="45"	value="<%=memVO.getMem_password()%>" /></td> --%>
<!-- 	</tr> -->

	<tr>
		<td>會員姓名:</td>
		<td><input type="TEXT" name="mem_name" size="45" value="<%=memVO.getMem_name()%>" /></td>
	</tr>
	<tr>
		<td>會員地址:</td>
		<td><input type="TEXT" name="mem_address" size="45"	value="<%=memVO.getMem_address()%>" /></td>
	</tr>
	<tr>
		<td>會員電話:</td>
		<td><input type="TEXT" name="mem_phone" size="45"	value="<%=memVO.getMem_phone()%>" /></td>
	</tr>
	<tr>
		<td>會員證號:</td>
		<td><input type="TEXT" name="mem_uid" size="45" value="<%=memVO.getMem_uid()%>" /></td>
	</tr>
		<tr>
		<td>會員Email:</td>
		<td><input type="TEXT" name="mem_email" size="45" value="<%=memVO.getMem_email()%>" /></td>
	</tr>
		<tr>
		<td>會員性別:</td>
		<td>
		<input type="radio" name="mem_sex" size="45" value="男" ${(memVO.mem_sex=="男")? 'checked':'' } ><b>男</b>
		<input type="radio" name="mem_sex" size="45" value="女" ${(memVO.mem_sex=="女")? 'checked':'' }><b>女</b>
		<input type="hidden" name="mem_sex" value="${memVO.mem_sex}">
		</td>
		</tr>
	<tr>
		<td>會員生日:</td>
		<td><input type="TEXT" name="mem_dob" size="45" id="dob_date1" /></td>
	</tr>
<!-- 	<tr> -->
<!-- 		<td>會員狀態:</td> -->
<%-- 		<td><input type="TEXT" name="mem_status" size="45"	value="<%=memVO.getMem_status()%>" /></td> --%>
<!-- 	</tr> -->
	
	

<!-- 	<tr > -->
<!-- 		<td>會員狀態:<font color=red><b>*</b></font></td> -->
<!-- 		<td><select size="1" name="mem_status"> -->
<%-- 				<option value="0" ${(memVO.mem_status==0)? 'selected':'' } >停權</option> --%>
<%-- 				<option value="1" ${(memVO.mem_status==1)? 'selected':'' } >未驗證</option> --%>
<%-- 				<option value="2" ${(memVO.mem_status==2)? 'selected':'' } >已驗證</option> --%>
<!-- 		</select></td> -->
<!-- 	</tr> -->

	
	
	
</table>
<br>
<input type="hidden" name="action" value="updateMem">
<input type="hidden" name="mem_id" value="<%=memVO.getMem_id()%>">
<input type="submit" value="送出修改"></FORM>
</body>

<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->

<% 
  java.sql.Date mem_dob = null;
  try {
	  mem_dob = memVO.getMem_dob();
   } catch (Exception e) {
	   mem_dob = new java.sql.Date(System.currentTimeMillis());
   }
%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
  .xdsoft_datetimepicker .xdsoft_datepicker {
           width:  300px;   /* width:  300px; */
  }
  .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
           height: 151px;   /* height:  151px; */
  }
</style>

<script>
        $.datetimepicker.setLocale('zh');
        $('#dob_date1').datetimepicker({
 	       theme: '',              //theme: 'dark',
	       timepicker:false,       //timepicker:true,
	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
		   value: '<%=mem_dob%>', // value:   new Date(),
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
           //startDate:	            '2017/07/10',  // 起始日
           //minDate:               '-1970-01-01', // 去除今日(不含)之前
           //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
        });
        
        
   
        // ----------------------------------------------------------以下用來排定無法選擇的日期-----------------------------------------------------------

        //      1.以下為某一天之前的日期無法選擇
        //      var somedate1 = new Date('2017-06-15');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() <  somedate1.getYear() || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});

        
        //      2.以下為某一天之後的日期無法選擇
        //      var somedate2 = new Date('2017-06-15');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() >  somedate2.getYear() || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});


        //      3.以下為兩個日期之外的日期無法選擇 (也可按需要換成其他日期)
        //      var somedate1 = new Date('2017-06-15');
        //      var somedate2 = new Date('2017-06-25');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() <  somedate1.getYear() || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
        //		             ||
        //		            date.getYear() >  somedate2.getYear() || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});
        
</script>


</html>