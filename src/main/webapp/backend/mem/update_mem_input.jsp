<%@page import="com.mem.model.MemVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%
MemVO memVO = (MemVO) request.getAttribute("memVO");
%>
<%@include file="/backend/backNavbar.jsp"%>
<%= memVO==null %>
<html>
<head>
<title>會員資料修改</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
	crossorigin="anonymous"></script>

<style>
/* <!-- ===========================================樣式欄位================================================================== --> */

/* tr:nth-child(odd){ */
/*   background:white; */
/* } */

/* tr:nth-child(even){ */
/*   background:#a4a9ad; */
/* } */
.styled-table {
	margin-left: auto;
	margin-right: auto;
	border-collapse: collapse;
	margin: auto;
	font-size: 0.9em;
	font-family: sans-serif;
	min-width: 400px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
}

.styled-table thead tr {
	background-color: #212529;
	color: #ffffff;
	text-align: left;
}

.styled-table th, .styled-table td {
	padding: 12px 15px;
}

.styled-table tbody tr {
	border-bottom: 1px solid #dddddd;
}

.styled-table tbody tr:nth-of-type(even) {
	background-color: #f3f3f3;
}

.styled-table tbody tr:last-of-type {
	border-bottom: 2px solid #212529;
}

.styled-table tbody tr.active-row {
	font-weight: bold;
	color: #212529;
}

/* <!-- ===========================================樣式欄位================================================================== --> */
table#table-1 {
	background-color: #212529;
	border: 2px solid black;
	text-align: center;
	margin-left: auto;
	margin-right: auto;
	width: 1000px;
	margin-top: 5px;
	margin-bottom: 5px;
}

table#table-1 h4 {
	color: red;
	display: block;
	margin-bottom: 1px;
}

h3 {
	color: #6c757d;
}

h4 {
	color: blue;
	display: inline;
}

/*   a{ */
/*     color: white; */
/*     display: inline; */
/*   } */
</style>

<style>
table {
	margin-left: auto;
	margin-right: auto;
	width: 50%;
	margin-top: 5px;
	margin-bottom: 5px;
}
/*    table, th, td {  */
/*      border: 1px solid #212529;  */
/*    }  */
th, td {
	padding: 5px;
	text-align: left;
}

</style>

</head>
<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		 <h3>會員資料修改 </h3>
		 <h4><a href="<%=request.getContextPath()%>/backend/mem/select_page.jsp">回首頁</a></h4>
	</td></tr>
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

<FORM METHOD="post" ACTION="/CGA104G1/MemServlet" name="form1">
<table>

	<tr>
		<td style="color: gray"><b>會員帳號:</b></td>
		<td><input type="TEXT" name="mem_account" size="45" readonly style="color: gray" value="<%=memVO.getMem_account()%>" /></td>
	</tr>
	<tr>
		<td style="color: gray"><b>會員密碼:</b></td>
		<td><input type="password" name="mem_password" size="45" readonly style="color: gray" value="<%=memVO.getMem_password()%>"/></td>
	</tr>
	<tr>
		<td><b>會員姓名:</b></td>
		<td><input type="TEXT" name="mem_name" size="45" value="<%=memVO.getMem_name()%>" /></td>
	</tr>
	<tr>
		<td><b>會員地址:</b></td>
		<td><input type="TEXT" name="mem_address" size="45"	value="<%=memVO.getMem_address()%>" /></td>
	</tr>
	<tr>
		<td><b>會員電話:</b></td>
		<td><input type="TEXT" name="mem_phone" size="45"	value="<%=memVO.getMem_phone()%>" /></td>
	</tr>
	<tr>
		<td><b>會員證號:</b></td>
		<td><input type="TEXT" name="mem_uid" size="45" value="<%=memVO.getMem_uid()%>" /></td>
	</tr>
		<tr>
		<td><b>會員Email:</b></td>
		<td><input type="TEXT" name="mem_email" size="45" value="<%=memVO.getMem_email()%>" /></td>
	</tr>

		<tr>
		<td><b>會員性別:</b></td>
		<td>
		<input type="radio" name="mem_sex" size="45" value="男" ${(memVO.mem_sex=="男")? 'checked':'' } ><b>男</b>
		<input type="radio" name="mem_sex" size="45" value="女" ${(memVO.mem_sex=="女")? 'checked':'' }><b>女</b>
		<input type="hidden" name="mem_sex" value="${memVO.mem_sex}">
		</td>
		</tr>

		<tr>
		<td><b>會員生日:</b></td>
		<td><input type="TEXT" name="mem_dob" size="45" id="dob_date1" /></td>
	</tr>
<!-- 	<tr> -->
<!-- 		<td>會員狀態:</td> -->
<%-- 		<td><input type="TEXT" name="mem_status" size="45"	value="<%=memVO.getMem_status()%>" /></td> --%>
<!-- 	</tr> -->
	
		
<%-- 		<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService" /> --%>
	<tr>
		<td><b>會員狀態:</b><font color=red><b>*</b></font></td>
		<td><select size="1" name="mem_status">
				<option value="0" ${(memVO.mem_status==0)? 'selected':'' } >停權</option>
				<option value="1" ${(memVO.mem_status==1)? 'selected':'' } >未驗證</option>
				<option value="2" ${(memVO.mem_status==2)? 'selected':'' } >已驗證</option>
		</select></td>
	</tr>
	

	
</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="mem_id" value="<%=memVO.getMem_id()%>">
<input type="submit" style="margin-left:38%" value="送出修改"></FORM>

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

        
//              2.以下為某一天之後的日期無法選擇
//              var somedate2 = new Date('2019-01-01');
//              $('#dob_date1').datetimepicker({
//                  beforeShowDay: function(date) {
//                	  if (  date.getYear() >  somedate2.getYear() || 
//         		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
//         		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
//                      ) {
//                           return [false, ""]
//                      }
//                      return [true, ""];
//              }});


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
        
        //-------------------------------------------------------------------------------------------------------------------
 
</script>

</html>