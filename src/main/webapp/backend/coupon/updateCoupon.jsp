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
    <title>折價券</title>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
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

<div class="container">
    <div class="col-md-12">

        <div>
            <a href="../home.jsp">回到後臺首頁</a>
        </div>

        <h2>修改優惠券</h2>
        <form action="updateCoupon.do" method="post" name="coupon">

            <div class="mb-3">
                <label>輸入說明文字</label>
                <input type="text" name="couponInfo" id="couponInfo"
                       value="<%= (coupon==null ? "" : coupon.getCouponNar())%>">

            </div>

            <div class="mb-3">
                <label>設定優惠面額</label>
                <input type="text" name="couponValue" value="<%= (coupon==null)? "0" : coupon.getCouponVal()%>"/>
            </div>

            <div class="mb-3">
                <label>設定領取時間</label>
                <input type="text" id="get" class="datetimes">
                <input type="hidden" id="get_time_start" name="getTimeStart" value="<%=coupon.getReceiveStart()%>">
                <input type="hidden" id="get_time_over" name="getTimeOver" value="<%=coupon.getReceiveOver()%>">
            </div>

            <div class="mb-3">
                <label>設定使用期限</label>
                <input type="text" id="use" class="datetimes" value="null">
                <input type="hidden" id="use_time_start" name="useTimeStart" value="<%=coupon.getUseStart()%>">
                <input type="hidden" id="use_time_over" name="useTimeOver" value="<%=coupon.getReceiveOver()%>">
            </div>

            <div class="mb-3">
                <label>最低消費金額</label>
                <input type="text" name="minimum" value="<%= (coupon==null)? "0" : coupon.getMinimum()%>"/>
            </div>

            <input type="hidden" name="action" value="update">
            <input type="hidden" name="coupon_id" value="<%= coupon.getCouponId()%>">
            <button class="btn btn-secondary" type="submit" name="action" value="update">送出</button>
            <br/>

        </form>

    </div>
</div>

<script>
    $(function () {
        $('input[id="get"]').daterangepicker({
            showDropdowns: true,
            startDate: '<%=coupon.getReceiveStart().toString()%>>',
            endDate: '<%=coupon.getReceiveOver().toString()%>',
            locale: {
                format: ' YYYY / MM / DD '
            }
        });
        $('input[id="use"]').daterangepicker({
            showDropdowns: true,
            startDate: '<%=coupon.getUseStart().toString()%>>',
            endDate: '<%=coupon.getUseOver().toString()%>',
            locale: {
                format: ' YYYY / MM / DD '
            }
        });
    });
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
