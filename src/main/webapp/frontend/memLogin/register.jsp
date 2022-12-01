<%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*"%>
<%
MemVO memVO = (MemVO) request.getAttribute("memVO");
// Object errorMsgs = session.getAttribute("errorMsgs");
%>




<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>會員資料新增 </title>

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

	width: 65%;
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
<style>
    .empTable {
      border-collapse: collapse
    }

    .empTable th {
      background-color: #BFBFFF;
      color: blue;
      text-align: right;
      border-style: dotted;
      font-weight: normal;
      padding: 5px;
    }

    .empTable td {
      border: 2px dotted deepPink;
      padding: 5px;
    }
  </style>
</head>
<body bgcolor='white'>
  <div id="showPanel">
  </div>
<table id="table-1" ALIGN=center>
	<tr><td> 
	<h3>會員註冊 </h3>
		 <h4><a href='<%=request.getContextPath()%>/frontend/memLogin/login.jsp'>回登入首頁</a></h4>
	</td></tr>
</table>


<!-- 錯誤表列 -->
<%-- <c:if test="${not empty errorMsgs}"> --%>
<!-- 	<font style="color:red">請修正以下錯誤:</font> -->
<!-- 	<ul> -->
<%-- 		<c:forEach var="message" items="${errorMsgs}"> --%>
<%-- 			<li style="color:red">${message}</li> --%>
<%-- 		</c:forEach> --%>
<!-- 	</ul> -->
<%-- </c:if> --%>


<FORM  ALIGN=center METHOD="post" ACTION="<%=request.getContextPath()%>/MemServlet">


<table ALIGN=center>

	<tr>
		<td>會員帳號:<font color=red><b>*</b></font></td>
		<td><input id ="mem_account" name="mem_account" type="TEXT" size="38" 
			 value="<%= (memVO==null)? "" : memVO.getMem_account()%>" />
			 <input type="button" id="chkaccount" value=" 檢查是否可以使用" ></td><td style="color:red">${errorMsgs.mem_account}</td>

<!-- 			 <td><input type="submit" name="action" value="檢查帳號是否可用" size="45" ></td> -->


			 <td style="color:gray">${msg}</td>
		
	</tr>
	<tr>
		<td>會員密碼:<font color=red><b>*</b></font></td>
		<td><input type="TEXT" name="mem_password" size="38"
			 value="<%= (memVO==null)? "" : memVO.getMem_password()%>" /></td><td style="color:red">${errorMsgs.mem_password}</td>
	</tr>
		<tr>
	<tr>
		<td>會員姓名:<font color=red><b>*</b></font></td>
		<td><input type="TEXT" name="mem_name" size="38" 
			 value="<%= (memVO==null)? "" : memVO.getMem_name()%>" /></td><td style="color:red">${errorMsgs.mem_name}</td>
	</tr>
		<tr>
		<td>會員地址:<font color=red><b>*</b></font></td>
		<td><input type="TEXT" name="mem_address" size="38"
			 value="<%= (memVO==null)? "" : memVO.getMem_address()%>" /></td><td style="color:red">${errorMsgs.mem_address}</td>
	</tr>
	<tr>
		<td>會員電話:<font color=red><b>*</b></font></td>
		<td><input type="TEXT" name="mem_phone" size="38"
			 value="<%= (memVO==null)? "" : memVO.getMem_phone()%>" /></td><td style="color:red">${errorMsgs.mem_phone}</td>
	</tr>
	<tr>
		<td>身分證字號:<font color=red><b>*</b></font></td>
		<td><input type="TEXT" name="mem_uid" size="38"
			 value="<%= (memVO==null)? "" : memVO.getMem_uid()%>" /></td><td style="color:red">${errorMsgs.mem_uid}</td>
	</tr>
		<tr>
		<td>會員信箱:<font color=red><b>*</b></font></td>
		<td><input type="TEXT" name="mem_email" size="38"
			 value="<%= (memVO==null)? "" : memVO.getMem_email()%>" /></td><td style="color:red">${errorMsgs.mem_email}</td>
	</tr>
		<tr>
		<td>會員性別:<font color=red><b>*</b></td>
		<td>
		<input type="radio" name="mem_sex" size="38" value="男" ${(memVO.mem_sex=="男")? 'checked':'' }><b>男</b>
		<input type="radio" name="mem_sex" size="38" value="女" ${(memVO.mem_sex=="女")? 'checked':'' }><b>女</b>
		<input type="hidden" name="mem_sex" value="${memVO.mem_sex}">
		</td><td style="color:red">${errorMsgs.mem_sex}</td>
		</tr>
	<tr>
		<td>會員生日:<font color=red><b>*</b></font></td>
		<td><input type="TEXT" name="mem_dob" id="dob_date1" size="38" /></td><td style="color:red">${errorMsgs.mem_dob}</td>
	</tr>

	
<!-- 	<tr> -->
<!-- 		<td>會員編號:<font color=red><b>*</b></font></td> -->
<!-- 		<td><select size="1" name="mem_id"> -->
<%-- 			<c:forEach var="memVO" items="${memSvc.all}"> --%>
<%-- 				<option value="${memVO.mem_id}" ${(memVO.mem_id==memVO.mem_id)? 'selected':'' } >${memVO.mem_id} --%>
<%-- 			</c:forEach> --%>
<!-- 		</select></td> -->
<!-- 	</tr> -->

</table>
<br>
<input type="hidden" name="action" value="register">
<input type="submit" value="送出註冊"></FORM>


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


  <script>
    function showEmployee(json) {
      //剖析json字串,將其轉成js物件
      let chkAc = JSON.parse(json);      
      
      if (!(chkAc.mem_account == "null")) {
          

          console.log(chkAc.mem_account);

          alert("此帳號已被使用");
                           
//         let html;
//         html = `
//         <table class='empTable' align='center'>
//         <tr><th>工號</th><td>${emp.empno}</td></tr>
//         <tr><th>姓名</th><td>${emp.ename}</td></tr>
//         <tr><th>薪資</th><td>${emp.sal}</td></tr>
//         <tr><th>到職日</th><td>${emp.hiredate}</td></tr>
//       </table>

       }else {
          alert("此帳號可以使用");
//           html = "<center>查無此員工</center>";

      }
      

     
      
    }
     
//       document.getElementById("showPanel").innerHTML = html;
    
    
    $("#chkaccount").click(function getEmployee() {
        //===實作(填入程式碼)
        let xhr = new XMLHttpRequest();
        let mem_account = $("#mem_account").val();
        //設定好回呼函數   
        
        let url = "/CGA104G1/MemServlet?action=accountchk&mem_account="+mem_account ;
//         xhr.setRequestHeader("content-type", "application/x-www-form-urlencoded");
        xhr.open("get", url, true);
        xhr.onload = function () {
          if (xhr.status == 200) {
            console.log(xhr.responseText);
            showEmployee(xhr.responseText);
// alert(xhr.responseText);
//             alert("123");
          } else {
            alert(xhr.status);
          }// status
        };// onload

        //建立好Get連接與送出請求 
// let mem_account = document.getElementById("mem_account").value;
        xhr.send(null);
      });

    </script>



</html>