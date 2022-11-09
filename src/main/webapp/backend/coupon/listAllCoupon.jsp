<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.coupon.model.service.impl.CouponServiceImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="com.coupon.model.entity.Coupon" %><%--
  Created by IntelliJ IDEA.
  User: Tibame_T14
  Date: 2022/11/4
  Time: 下午 11:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    CouponServiceImpl couponService = new CouponServiceImpl();
    List<Coupon> list = couponService.listAllCoupon();
    pageContext.setAttribute("list", list);
%>

<html>
<head>
    <meta charset="UTF-8">
    <title>顯示所有優惠券</title>

    <!-- import bootstrap 5.2.1 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">

    <!-- import font-style -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@300&display=swap" rel="stylesheet">

    <!-- import jquery-3.6.0 -->
    <script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- import icon -->
    <script src="https://kit.fontawesome.com/b5ef6b60f3.js" crossorigin="anonymous"></script>
    <style>
        * {
            white-space: nowrap;
        }

        #add_coupon {
            position: relative;
        }

        #add_coupon:hover::after {
            position: absolute;
            top: -50px;
            left: 0;
            content: '新增商品';
        }
    </style>
</head>
<body id="body" onbeforeunload="return myFunction()">
<div class="container">

    <div class="col-md-12">

        <div>
            <a href="../home.jsp">回到後臺首頁</a>
        </div>

        <table class="table">
            <thead>
            <tr>
                <th scope="col">折價券編號</th>
                <th scope="col">折價券面額</th>
                <th scope="col">折價券說明</th>
                <th scope="col">開始領取日</th>
                <th scope="col">結束領取日</th>
                <th scope="col">開始使用日</th>
                <th scope="col">結束使用日</th>
                <th scope="col">最低消費金額</th>
            </tr>
            </thead>
            <%--   <%@ include file="page1.file" %>--%>
            <%--<c:forEach var="coupon" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">--%>
            <tbody>
            <c:forEach var="coupon" items="${list}">

                <tr>
                    <th scope="row">${coupon.couponId}</th>
                    <td>${coupon.couponVal}</td>
                    <td>${coupon.couponNar}</td>
                    <td>${coupon.receiveStart}</td>
                    <td>${coupon.receiveOver}</td>
                    <td>${coupon.useStart}</td>
                    <td>${coupon.useOver}</td>
                    <td>${coupon.minimum}</td>
                    <td>
                        <form method="post" action="updateCoupon.do" style="margin-bottom: 0px;">
                            <input class="btn btn-outline-secondary btn-sm" type="submit" value="修改">
                            <input type="hidden" name="coupon_id" value="${coupon.couponId}">
                            <input type="hidden" name="action" value="getOne_For_Update"></form>
                    </td>
                    <td>
                        <form method="post" action="removeCoupon.do" style="margin-bottom: 0px;">
                            <input class="btn btn-outline-secondary btn-sm" type="submit" value="刪除">
                            <input type="hidden" name="coupon_id" value="${coupon.couponId}">
                            <input type="hidden" name="action" value="delete"></form>
                    </td>

                </tr>
            </c:forEach>
            </tbody>
        </table>

        <div id="add_coupon">
            <a href="addCoupon.jsp">
                <i class="fa-solid fa-plus fa-2xl"></i>
            </a>
        </div>
        <%-- <%@ include file="page2.file" %>--%>
    </div>
</div>

</body>
</html>
