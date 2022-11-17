<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Barei後臺首頁</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

    <style>
        .myButton {
            box-shadow: inset 0px 1px 0px 0px #fff6af;
            background: linear-gradient(to bottom, #ffec64 5%, #ffab23 100%);
            background-color: #ffec64;
            border: 1px solid #ffaa22;
            display: inline-block;
            color: #333333;
            font-family: Arial;
            font-size: 14px;
            font-weight: bold;
            padding: 6px 24px;
            text-decoration: none;
            text-shadow: 0px 1px 0px #ffee66;
        }

        .myButton2 {
            box-shadow: inset 0px 1px 0px 0px #fff6af;
            background-color: transparent;
            border: 1px solid #ffaa22;
            display: inline-block;
            cursor: pointer;
            color: #333333;
            font-family: Arial;
            font-size: 14px;
            font-weight: bold;
            padding: 6px 24px;
            text-decoration: none;
            text-align: center;
        }

        .myButton2:hover {
            color: #f0094a;
            background: transparent;
            box-shadow: none;
        }

        .myButton2:before,
        .myButton2:after {
            content: '';
            position: absolute;
            top: 0;
            right: 0;
            height: 2px;
            width: 0;
            background: #f0094a;
            box-shadow:
                -1px -1px 5px 0px #fff,
                7px 7px 20px 0px #0003,
                4px 4px 5px 0px #0002;
            transition: 400ms ease all;
        }

        .myButton2:after {
            right: inherit;
            top: inherit;
            left: 0;
            bottom: 0;
        }

        .myButton2:hover:before,
        .myButton2:hover:after {
            width: 100%;
            transition: 800ms ease all;
        }

        .block_text {
            display: block;
        }

        .EMPINFO {
            text-align: right;
        }

        .fixed-top {
            position: sticky;
        }

        .img_block {
            border: 0;
            padding: 0;
            height: 150px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .list-group-item {
            width: 150px;
        }

        .no {
            content: "";
            height: 100px;
        }
    </style>
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
        <div class="container-fluid">
            <a class="navbar-brand" href="#"><img src="<%=request.getContextPath()%>/backend/asset/img/share_icon/logo.png" width="100px" height="40px"></a>
            <span id="EMPINFO" style="color: white">員工編號000 Gallon您好</span>
        </div>
    </nav>

    <div class="no"></div>
    <div class="container">
        <div class="row">
            <div class="col-2">
                <div class="list-group">
                    <li class="list-group-item list-group-item-primary img_block myButton"><img src="<%=request.getContextPath()%>/backend/asset/img/share_icon/user.png"
                            width="80px" height="80px" class="block_image"></li>
                    <a href="#" class="list-group-item list-group-item-action myButton2">會員帳號查詢</a>
                    <a href="#" class="list-group-item list-group-item-action myButton2">會員帳號管理</a>
                    <a href="#" class="list-group-item list-group-item-action myButton2">認證醫生管理</a>
                </div>
            </div>

            <div class="col-2">
                <div class="list-group">
                    <li class="list-group-item list-group-item-primary img_block myButton"><img src="<%=request.getContextPath()%>/backend/asset/img/share_icon/cart.png"
                            width="80px" height="80px" class="block_image"></li>
                    <a href="<%=request.getContextPath()%>/backend/commodityDetails/selectCommodityDetails.jsp" class="list-group-item list-group-item-action myButton2">商品管理</a>
                    <a href="#" class="list-group-item list-group-item-action myButton2">商城訂單管理</a>
                    <a href="#" class="list-group-item list-group-item-action myButton2">折價券管理</a>
                </div>
            </div>

            <div class="col-2">
                <div class="list-group">
                    <li class="list-group-item list-group-item-primary img_block myButton"><img src="<%=request.getContextPath()%>/backend/asset/img/share_icon/group.png"
                            width="80px" height="80px" class="block_image"></li>
                    <a href="<%=request.getContextPath()%>/backend/Discount/select_page.jsp" class="list-group-item list-group-item-action myButton2">團購折扣管理</a>
                    <a href="<%=request.getContextPath()%>/backend/Group_Buy_Item/select_page.jsp" class="list-group-item list-group-item-action myButton2">團購商品管理</a>
                    <a href="#" class="list-group-item list-group-item-action myButton2">團購訂單管理</a>
                    <a href="#" class="list-group-item list-group-item-action myButton2">團購檢舉管理</a>
                </div>
            </div>

            <div class="col-2">
                <div class="list-group">
                    <li class="list-group-item list-group-item-primary img_block myButton"><img src="<%=request.getContextPath()%>/backend/asset/img/share_icon/forum.png"
                            width="80px" height="80px" class="block_image"></li>
                    <a href="#" class="list-group-item list-group-item-action myButton2">文章分類管理</a>
                    <a href="<%=request.getContextPath()%>/backend/article/selectPage.jsp" class="list-group-item list-group-item-action myButton2">文章檢舉管理</a>
                </div>
            </div>

            <div class="col-2">
                <div class="list-group">
                    <li class="list-group-item list-group-item-primary img_block myButton"><img src="<%=request.getContextPath()%>/backend/asset/img/share_icon/info.png"
                            width="80px" height="80px" class="block_image"></li>
                    <a href="#" class="list-group-item list-group-item-action myButton2">最新消息管理</a>
                    <a href="#" class="list-group-item list-group-item-action myButton2">Q&A管理</a>
                </div>
            </div>

            <div class="col-2">
                <div class="list-group">
                    <li class="list-group-item list-group-item-primary img_block myButton"><img src="<%=request.getContextPath()%>/backend/asset/img/share_icon/staff.png"
                            width="80px" height="80px" class="block_image"></li>
                    <a href="<%=request.getContextPath()%>/backend/emp/select_page.jsp" class="list-group-item list-group-item-action myButton2">員工資料查詢與管理</a>
                    <a href="<%=request.getContextPath()%>/backend/effect/select_page.jsp" class="list-group-item list-group-item-action myButton2">權限查詢與管理</a>
                </div>
            </div>
        </div>
    </div>



    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
</body>

</html>