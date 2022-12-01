<%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf-8" %>
<%@page import="com.mem.model.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    Integer mem_id = (Integer) session.getAttribute("mem_id");
    String mem_email = (String) session.getAttribute("mem_email");
    MemService memSvc = new MemService();
    MemVO memVO = memSvc.findByMemId(mem_id);
    session.setAttribute("memVO", memVO);
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>notVerify</title>
    <!-- import bootstrap 5.2.1 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">

    <!-- import font-style -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@300&display=swap" rel="stylesheet">

    <!-- import css stylesheet -->

    <!-- import jquery-3.6.0 -->
    <script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://demeter.5fpro.com/tw/zipcode-selector.js"></script>

    <!-- import icon -->
    <script src="https://kit.fontawesome.com/b5ef6b60f3.js" crossorigin="anonymous"></script>

    <link rel="stylesheet" type="text/css" href="../../resources/static/css/main.css"/>
</head>
<body>
<%-- <% System.out.print(mem_email); %> --%>
<%int memID = memVO.getMem_id(); %>
<%String memEmail = memVO.getMem_email(); %>

<div class="container">
    <div class="row">
        <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
            <div class="card border-0 shadow rounded-3 my-5">
                <div class="card-body p-4 p-sm-5">
                    <form method="post" action="<%=request.getContextPath()%>/MemServlet">
                        <table style="height: 300px">
                            <tr bgcolor='skyblue' align='center' valign='middle' height='20'>
                                <th>
                                    <div style="color:white">您的帳號尚未驗證成功，請重新至信箱查收驗證碼：</div>
                                    <br>
                                    <!-- 			系統將在<span style="color: red">120</span>秒後跳轉回首頁!<br> -->

                                    請輸入驗證碼: <input type="text" name="regpasschk"> <br>


                                    <input type="hidden" name="action" value="regconfirm">

                                    <input type="hidden" name="mem_id" value="<%= memID %>">
                                    <input id="1" type="submit" value="確認送出" style="margin-left: 100px">
                    </form>

                    <form method="post" action="<%=request.getContextPath()%>/MemServlet">
                        <input type="hidden" name="action" value="resend">
                        <input type="hidden" name="mem_email" value="<%= memEmail %>">
                        <input type="hidden" name="mem_id" value="<%= memID %>">
                        <input id="2" type="submit" value="重寄驗證信" style="margin-left: 100px"></form>

                    <div style="color:red">${msg}</div>


                    </th>

                    </tr>

                    </table>

                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
