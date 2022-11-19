<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Tibame_T14
  Date: 2022/10/20
  Time: 下午 04:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.coupon.model.entity.Coupon" %>

<%@include file="/backend/backNavbar.jsp"%>

<%
    String path = request.getContextPath();
    Coupon coupon = (Coupon) request.getAttribute("coupon");
%>
<%
    Date d = new Date();
    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
    String now = df.format(d);
%>

<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>折價券</title>


    <!-- import bootstrap 5.2.1 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">

    <!-- import font-style -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@300&display=swap" rel="stylesheet">

    <!-- import css stylesheet -->
    <link rel="stylesheet" href="#">

    <!-- import jquery-3.6.0 -->
    <script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- import icon -->
    <script src="https://kit.fontawesome.com/b5ef6b60f3.js" crossorigin="anonymous"></script>

    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css"/>
    <style>
        input {
            width: calc(50% - 80px);
        }

        @media (max-width: 768px) {
            input {
                width: calc(100% - 80px);
            }
        }
    </style>
</head>
<body>

<main>

    <div class="container">

        <div class="col-md-6">

        </div>

        <div class="col-md-12">

            <div>
                <a href="../home.jsp">回到後台首頁</a>
            </div>

            <h2>新增優惠券</h2>
            <form action="<%=path%>/backend/coupon/addCoupon.do" method="post" name="coupon">

                <div class="mb-3">
                    <label>輸入說明文字</label>
                    <input type="text" name="couponInfo" id="couponInfo"
                           value="<%= (coupon==null ? "" : coupon.getCouponNar())%>">
                </div>

                <div class="mb-3">
                    <label>設定優惠面額</label>
                    <input type="text" name="couponValue"
                           value="<%= (coupon==null)? "0" : coupon.getCouponVal()%>"/>
                </div>

                <div class="mb-3">
                    <label>設定領取時間</label>
                    <input type="text" id="get" class="datetimes" value="<c:if test = "null"> </c:if>">
                    <input type="hidden" id="get_time_start" name="getTimeStart" value="<%=now%>">
                    <input type="hidden" id="get_time_over" name="getTimeOver" value="<%=now%>">
                </div>

                <div class="mb-3">
                    <label>設定使用期限</label>
                    <input type="text" id="use" class="datetimes" value="<c:if test = "null"> </c:if>">
                    <input type="hidden" id="use_time_start" name="useTimeStart" value="<%=now%>">
                    <input type="hidden" id="use_time_over" name="useTimeOver" value="<%=now%>">
                </div>

                <div class="mb-3">
                    <label>最低消費金額</label>
                    <input type="text" name="minimum" value="<%= (coupon==null)? "0" : coupon.getMinimum()%>"/>
                </div>

                <button class="btn btn-secondary" type="submit" name="action" value="addCoupon">送出</button>
                <br/>

            </form>

            <a href="<%=path%>/backend/coupon/listAllCoupon.jsp">前往查看所有優惠券</a>
        </div>
                    <%-- 錯誤表列 --%>
                        <c:if test="${not empty errorMsgs}">
                            <label style="color:red">請修正以下錯誤:</label>
                            <ul>
                                <c:forEach var="message" items="${errorMsgs}">
                                    <li style="color:red">${message}</li>
                                </c:forEach>
                            </ul>
                        </c:if>
    </div>


</main>

<script>
    $(function () {
        $('input[class="datetimes"]').daterangepicker({
            showDropdowns: true,
            startDate:<%=now%>,
            endDate: <%=now%>,
            locale: {
                format: ' YYYY / MM / DD '
            }
        });
    });

    // $('#get').daterangepicker();
    $('#get').on('apply.daterangepicker', function (ev, picker) {
        $('#get_time_start').val(picker.startDate.format('YYYY-MM-DD'));
        $('#get_time_over').val(picker.endDate.format('YYYY-MM-DD'));
    });
    // $('#use').daterangepicker();
    $('#use').on('apply.daterangepicker', function (ev, picker) {
        $('#use_time_start').val(picker.startDate.format('YYYY-MM-DD'));
        $('#use_time_over').val(picker.endDate.format('YYYY-MM-DD'));
    });
</script>
<!-- import bootstrap 5.2.1 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
</body>

</html>
