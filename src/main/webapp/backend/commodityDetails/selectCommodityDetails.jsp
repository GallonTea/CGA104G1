<%@ page import="java.util.List" %>
<%@ page import="com.commodityDetails.model.service.impl.CommodityDetailsServiceImpl" %>
<%@ page import="com.commodityDetails.model.entity.CommodityDetails" %>
<%@ page import="com.orderBuy.model.service.impl.OrderBuyServiceImpl" %>
<%@ page import="com.orderBuy.model.entity.OrderBuy" %><%--
  Created by IntelliJ IDEA.
  User: Tibame_T14
  Date: 2022/10/25
  Time: 下午 11:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    CommodityDetailsServiceImpl commodityDetailsService = new CommodityDetailsServiceImpl();
    List<CommodityDetails> list = commodityDetailsService.listAllDetails();
    pageContext.setAttribute("list", list);

    OrderBuyServiceImpl orderBuyService = new OrderBuyServiceImpl();
    List<OrderBuy> list2 = orderBuyService.listAllOrder();
    pageContext.setAttribute("list", list2);
%>

<html>
<head>
    <title>選擇要查詢的訂單編號</title>
</head>
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

<style>
    @import url('https://fonts.googleapis.com/css?family=Open+Sans&display=swap');

    body {
        background-color: #eeeeee;
    }

    .container {
        margin-top: 50px;
        margin-bottom: 50px
    }

    .card {
        position: relative;
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-orient: vertical;
        -webkit-box-direction: normal;
        -ms-flex-direction: column;
        flex-direction: column;
        min-width: 0;
        word-wrap: break-word;
        background-color: #fff;
        background-clip: border-box;
        border: 1px solid rgba(0, 0, 0, 0.1);
        border-radius: 0.10rem
    }


    .track {
        position: relative;
        background-color: #ddd;
        height: 7px;
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        margin-bottom: 60px;
        margin-top: 50px;
        padding: 0;
    }

    .track .step {
        -webkit-box-flex: 1;
        -ms-flex-positive: 1;
        flex-grow: 1;
        width: 25%;
        margin-top: -18px;
        text-align: center;
        position: relative
    }

    .track .step.active:before {

        background: #FF5722
    }

    .track .step::before {
        height: 7px;
        position: absolute;
        content: "";
        width: 100%;
        left: 0;
        top: 18px
    }

    .track .step.active .icon {
        background: #ee5435;
        color: #fff;
    }

    .track .icon {
        padding-top: 4%;
        display: inline-block;
        width: 40px;
        height: 40px;
        line-height: 40px;
        position: relative;
        border-radius: 100%;
        background: #ddd
    }

    @media (max-width: 768px) {
        .track .icon {
            padding-top: 12%;
        }
    }

    .track .step.active .text {
        font-weight: 400;
        color: #000
    }

    .track .text {
        display: block;
        margin-top: 7px
    }

    .btn-warning {
        color: #ffffff;
        background-color: #ee5435;
        border-color: #ee5435;
        border-radius: 1px
    }

    .btn-warning:hover {
        color: #ffffff;
        background-color: #ff2b00;
        border-color: #ff2b00;
        border-radius: 1px
    }
</style>

<body>
<div class="container">
    <div class="col-md-12">
        <div>
            <a href="../home.jsp">回到後臺首頁</a>
        </div>

        <ul>
            <li>
                <form method="post" action="commodityDetails.do">
                    <b>選擇查詢的訂單編號:</b>
                    <select size="1" name="orderId" id="select">
                        <c:forEach var="commodityDetailsVO" items="${list}">
                        <option value="${commodityDetailsVO.orderId}">${commodityDetailsVO.orderId}
                            </c:forEach>
                    </select>
                    <input type="hidden" name="action" value="getOne_For_Display">
                    <input type="submit" value="送出">
                </form>
            </li>
        </ul>

        <c:forEach var="orderBuyVO" items="${list}">
            <div class="container">

            <article class="card">



                <div class="card row tester">
                    <div class="card-body row"></div>
                    <hr>
                    <h4>訂單編號: ${orderBuyVO.orderId}</h4>
                    <span>訂單時間: ${orderBuyVO.orderDate}</span>
                    <article class="card>">

                        <div class="card-body row">
                            <div class="col"><strong>會員編號:</strong> ${orderBuyVO.memId}</div>
                            <div class="col"><strong>收件姓名:</strong> ${orderBuyVO.receiverName}</div>
                            <div class="col"><strong>付款方式:</strong>
                                <c:if test = "${orderBuyVO.orderPaying == 0}">貨到付款</c:if>
                                <c:if test = "${orderBuyVO.orderPaying == 1}">ATM轉帳</c:if>
                                <c:if test = "${orderBuyVO.orderPaying == 2}">信用卡付款</c:if>
                            </div>
                            <div class="col"><strong>連絡電話:</strong> ${orderBuyVO.receiverPhone}</div>
                        </div>
                        <div class="card-body row">
                            <div class="col"><strong>訂單狀態:</strong>
                                <c:if test = "${orderBuyVO.orderStatus == 0}"><span class="test">等待付款中</span></c:if>
                                <c:if test = "${orderBuyVO.orderStatus == 1}">已取消訂單</c:if>
                                <c:if test = "${orderBuyVO.orderStatus == 2}"><strong class="test" style=" color: limegreen">訂單已完成</strong></c:if>
                                <c:if test = "${orderBuyVO.orderStatus == 3}"><span class="test">準備出貨中</span></c:if>
                                <c:if test = "${orderBuyVO.orderStatus == 4}"><span class="test">正在運輸途中</span> </c:if>
                                <c:if test = "${orderBuyVO.orderStatus == 5}">未取貨，退回平台</c:if>
                                <c:if test = "${orderBuyVO.orderStatus == 6}">已完成取貨</c:if>
                                <c:if test = "${orderBuyVO.orderStatus == 7}">退貨處理中</c:if>
                                <c:if test = "${orderBuyVO.orderStatus == 8}">換貨處理中</c:if>
                                <c:if test = "${orderBuyVO.orderStatus == 9}"><strong style=" color: red">訂單已銷毀</strong></c:if>
                            </div>
                            <div class="col"><strong>寄送方式:</strong>
                                <c:if test = "${orderBuyVO.orderSend == 0}">宅配</c:if>
                                <c:if test = "${orderBuyVO.orderSend == 1}">便利商店</c:if>
                            </div>
                            <div class="col"><strong>收件地址:</strong> ${orderBuyVO.receiverAddress}</div>
                            <div class="col"><strong>物流編號:</strong> ${orderBuyVO.trackingNum}</div>
                        </div>
                        <div class="card-body row">
                            <div class="col"><strong>備註:</strong> ${orderBuyVO.orderOther}</div>
                        </div>
                    </article>
                        <div class="track">
                            <div id="step1" class="step"><span class="icon"><i class="fa fa-check"></i><br><span class="text"></span></span></div>
                            <div id="step2" class="step"><span class="icon"><i class="fa fa-user"></i><br><span class="text"></span></span></div>
                            <div id="step3" class="step"><span class="icon"><i class="fa fa-truck"></i><br><span class="text"></span></span></div>
                            <div id="step4" class="step"><span class="icon"><i class="fa fa-box"></i><br><span class="text"></span></span></div>
                        </div>
                            <div class="card-body justify-content-right align-items-right"><strong>取貨時間:</strong> ${orderBuyVO.pickupTime}</div>
                        <hr>
                        <div class="card-body row">
                            <div class="col"><strong>原始總價:</strong> ${orderBuyVO.originalPrice}</div>
                            <div class="col"><strong>折抵金額:</strong> ${orderBuyVO.discountPrice}</div>
                            <div class="col"><strong>結帳金額:</strong> ${orderBuyVO.finalPrice}</div>
                        </div>
                    <div class="card-body row float-right">

                        <form method="post" action="commodityDetails.do" style="margin-bottom: 0px;">
                            <input class="btn btn-outline-secondary btn-sm" type="submit" value="查看訂單明細">
                            <input type="hidden" name="orderId" value="${orderBuyVO.orderId}">
                            <input type="hidden" name="action" value="getOne_For_Display"></form>
                    </div>
                </div>
            </article>

                </div>
        </c:forEach>

    </div>

</div>
<script type="text/javascript">
    window.onload = function () {
        var opts = document.getElementById('select').options;
        var obj = new Object(), index = 0;
        while (index < opts.length) {
            if (opts[index].text in obj) opts[index] = null;
            else {
                obj[opts[index].text] = opts[index].text;
                index++;
            }
        }
        obj = null;
    }
</script>


</body>
</html>
<%--等待付款中--%>
<%--已取消訂單--%>
<%--準備出貨中--%>
<%--已完成出貨--%>
<%--已完成取貨--%>
<%--退貨處理中--%>
<%--換貨處理中--%>
<%--未取貨，退--%>
