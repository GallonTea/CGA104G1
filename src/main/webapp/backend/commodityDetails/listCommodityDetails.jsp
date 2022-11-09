<%@ page import="com.orderBuy.model.entity.OrderBuy" %>
<%@ page import="com.commodityDetails.model.service.impl.CommodityDetailsServiceImpl" %>
<%@ page import="com.commodityDetails.model.entity.CommodityDetails" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: Tibame_T14
  Date: 2022/10/25
  Time: 下午 09:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String path = request.getContextPath();
    OrderBuy orderBuy = (OrderBuy) request.getAttribute("orderBuy");
%>

<%
    CommodityDetailsServiceImpl commodityDetailsService = new CommodityDetailsServiceImpl();
    List<CommodityDetails> list = commodityDetailsService.listOrderDetails((Integer) request.getAttribute("orderId"));
    pageContext.setAttribute("list", list);
%>

<html lang="zh-hart" dir="ltr">
<head>
    <meta charset="UTF-8">
    <title>後台訂單查看</title>
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

    <!-- import icon -->
    <script src="https://kit.fontawesome.com/b5ef6b60f3.js" crossorigin="anonymous"></script>

    <script src="https://unpkg.com/vue@3"></script>
    <script src="https://unpkg.com/vue-router@4"></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/qs/6.11.0/qs.min.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>

    <style>
        * {
            white-space: nowrap;
        }

        .inputs input {
            width: 500px;
            margin: 10px;
            border-style: hidden;

        }

        #twzipcode input {
            border-style: solid;

        }
    </style>
</head>
<body id="body">

<div class="container">

    <div class="col-md-12">

        <div>
            <a href="../home.jsp">回到後臺首頁</a>
        </div>

        <strong>訂單狀態</strong>
        <form action="<%=path%>/backend/commodityDetails/commodityDetails.do" method="post" name="update_Order"
              class="form">

            <input type="hidden" name="action" value="update_Order">
            <div class="inputs">
                <input type="hidden" name="orderId" value="${orderBuy.orderId}" readonly>

                <label>收件姓名: </label>
                <input type="text" name="receiverName" value="${orderBuy.receiverName}" readonly>

                <input type="hidden" name="memId" value="${orderBuy.memId}" readonly>
                <input type="hidden" name="originalPrice" value="${orderBuy.originalPrice}" readonly>
                <input type="hidden" name="discountPrice" value="${orderBuy.discountPrice}" readonly>
                <input type="hidden" name="finalPrice" value="${orderBuy.finalPrice}" readonly>
                <input type="hidden" name="orderDate" value="${orderBuy.orderDate}" readonly>
                <input type="hidden" name="orderPaying" value="${orderBuy.orderPaying}" readonly>
                <input type="hidden" name="orderStatus" value="${orderBuy.orderStatus}" class="orderStatus" readonly>

                <label>連絡電話: </label>
                <input type="text" name="receiverPhone" value="${orderBuy.receiverPhone}" readonly>
                <br>

                <input type="hidden" name="orderSend" value="${orderBuy.orderSend}" readonly>
                <label>寄件地址: </label>
                <input type="text" name="receiverAddress" value="${orderBuy.receiverAddress}" readonly>

                <label>物流編號: </label>
                <input type="text" name="trackingNum" value="${orderBuy.trackingNum}" readonly>
                <input type="hidden" name="pickupDate" value="${orderBuy.pickupTime}">
                <br>
                <div style="margin-top: 10px">
                    <label style="margin-right: 13px">備註資訊: </label>
                    <span>${orderBUyVO.orderOther}</span>
                </div>
                <input type="hidden" name="orderOther" value="${orderBUyVO.orderOther}" readonly>
                <br>
                <div id="btn-area" class="d-flex" style="float: right">

                    <button id="finnish" class="btn btn-success" style="margin-right: 10px" type="submit">完成訂單
                    </button>
                    <button id="vanish" class="btn btn-danger" type="submit">銷毀訂單</button>
                </div>

                <br>
                <hr>

            </div>
            <select id="orderStatus" value="${orderBuy.orderStatus}">

                <option value="0">等待付款中</option>
                <option value="3">完成付款，準備出貨中</option>
                <option value="4">已完成出貨</option>
                <option value="6">已完成取貨</option>
                <option value="7">退貨處理中</option>
                <option value="8">換貨處理中</option>
                <option value="1">已取消訂單</option>
                <option value="5">未取貨，退回平台</option>
            </select>

            <input id="updateDeliver" class="btn btn-warning" style="margin-bottom: 0;" type="submit" value="更新狀態">
        </form>

        <!-- Button trigger modal -->
        <button id="myModal" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop" style="display: none">
            Launch
        </button>

        <!-- Modal -->
        <%--<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">--%>
        <%--    <div class="modal-dialog">--%>
        <%--        <div class="modal-content">--%>
        <%--            <div class="modal-header">--%>
        <%--                <h5 class="modal-title" id="staticBackdropLabel">錯誤</h5>--%>
        <%--                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>--%>
        <%--            </div>--%>

                        <div class="modal-body">
            <%-- 錯誤表列 --%>
            <c:if test="${not empty errorMsgs}">
                <label style="color:red">請修正以下錯誤:</label>
                <ul>
                    <c:forEach var="message" items="${errorMsgs}">
                        <li style="color:red">${message}</li>
                    </c:forEach>
                </ul>
            </c:if>

            <%--            </div>--%>
            <%--            <div class="modal-footer">--%>
            <%--                <button id="revise2" type="button" class="btn btn-secondary" data-bs-dismiss="modal">了解</button>--%>
<%--                        </div>--%>
        <%--        </div>--%>
        <%--    </div>--%>
        </div>

        <div style="text-align: right">
            <button class="btn btn-warning" id="revise">修改訂單資訊</button>
        </div>

        <br>



        <hr>

        <h4>訂單編號: <%=request.getAttribute("orderId")%>
        </h4>

        <table class="table">
            <thead>
            <tr>
                <th scope="col">商品編號</th>
                <th scope="col">商品名稱</th>
                <th scope="col">商品數量</th>
                <th scope="col">商品價格</th>
            </tr>
            </thead>
            <%--   <%@ include file="page1.file" %>--%>
            <%--<c:forEach var="commodityDetails" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">--%>

            <c:forEach var="commodityDetails" items="${list}">

                <tr>
                    <td>${commodityDetails.itemId}</td>
                    <td>${commodityDetails.itemName}</td>
                    <td>${commodityDetails.cdAmount}</td>
                    <td>${commodityDetails.itemPrice}</td>


                </tr>
            </c:forEach>



        </table>
        <table class="table">
            <tr>
                <th>訂單總金額</th>
                <th>折扣後價格</th>
            </tr>
            <tr>
                <td>${orderBuy.originalPrice}</td>
                <td>${orderBuy.finalPrice}</td>
            </tr>
        </table>




        <%-- <%@ include file="page2.file" %>--%>
    </div>
</div>



<!-- import main.js -->
<script src="#"></script>

<!-- import bootstrap 5.2.1 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<!-- import vue.js  -->
<script src="https://unpkg.com/vue@3"></script>
<script src="https://unpkg.com/vue-router@4"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

<script>


    $(document).ready(function () {

        if ($('.orderStatus').val() === '9' || $('.orderStatus').val() === '2') {
            $('#revise').attr('hidden', 'hidden');
            $('#vanish').attr('hidden', 'hidden');
            $('#finnish').attr('hidden', 'hidden');
            $('#updateDeliver').attr('hidden', 'hidden');
            $('select').attr('hidden', 'hidden');

        }

        switch ($('.orderStatus').val()) {
            case '0':
                $('#orderStatus').val(0)
                break
            case '1':
                $('#orderStatus').val(1)
                break
            case '2':
                $('#revise').attr('hidden', 'hidden');
                $('#vanish').attr('hidden', 'hidden');
                $('#finnish').attr('hidden', 'hidden');
                $('#updateDeliver').attr('hidden', 'hidden');
                break
            case '3':
                $('#orderStatus').val(3)
                break
            case '4':
                $('#orderStatus').val(4)
                break
            case '5':
                $('#orderStatus').val(5)
                break
            case '6':
                $('#orderStatus').val(6)
                break
            case '7':
                $('#orderStatus').val(7)
                break
            case '8':
                $('#orderStatus').val(8)
                break
            case '9':
                $('#revise').attr('hidden', 'hidden');
                $('#vanish').attr('hidden', 'hidden');
                $('#finnish').attr('hidden', 'hidden');
                $('#updateDeliver').attr('hidden', 'hidden');
        }
        $('#orderStatus').change(function () {
            $('.orderStatus').val($('#orderStatus option:selected').val());
        });
        $('#revise').click(function () {
            $('.inputs input').css('border-style', 'solid').removeAttr('readonly').css('border-radius', '5px');
            $('#revise').attr('hidden', 'hidden');
            $('#vanish').attr('hidden', 'hidden');
            $('#finnish').attr('hidden', 'hidden');
            $('#updateDeliver').attr('hidden', 'hidden');
            var btn = '<button id="sendRevise" class="btn btn-warning" type="submit">送出修改</button>';
            $('#btn-area').append(btn);
        });
        $('#finnish').click(function () {
            $('.orderStatus').val(2)
        });
        $('#vanish').click(function () {
            $('.orderStatus').val(9);
        });
        $('#revise2').click(function () {
            $('.inputs input').css('border-style', 'solid').removeAttr('readonly').css('border-radius', '5px');
            $('#revise').attr('hidden', 'hidden');
            $('#vanish').attr('hidden', 'hidden');
            $('#finnish').attr('hidden', 'hidden');
            $('#updateDeliver').attr('hidden', 'hidden');
            var btn = '<button class="btn btn-warning" type="submit">送出修改</button>';
            $('#btn-area').append(btn);
            $('#modal-body').modal('hide');
        });


        // if($('#modal-body').text != ''){
        //     $('#myModal').click()
        // }

    })

</script>

</body>
</html>

