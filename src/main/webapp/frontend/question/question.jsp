<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/frontend/frontNavbar.jsp"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>常見問題</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js"
        integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk"
        crossorigin="anonymous"></script>
    <style>
        /* 設定頁面區塊 */
        .none {
            height: 70px;
        }

        .container {
            display: flex;
        }

        .menu {
            width: 30%;
            min-height: 300px;
            padding-right: 20px;
        }

        .accordion {
            width: 70%;
        }

        /* 設定目錄區塊 */
        .innerMenu {
            position: fixed;
            top: 25%;
            padding: 20px;
            width: 180px;
            min-height: 100px;
            border: 2px solid;
            border-image: linear-gradient(45deg, gold, deeppink) 1;
            clip-path: inset(0px round 10px);
            animation: huerotate 6s infinite linear;
            filter: hue-rotate(360deg);
        }

        @keyframes huerotate {
            0% {
                filter: hue-rotate(0deg);
            }

            100% {
                filter: hue-rotate(360deg);
            }
        }

        li {
            list-style-type: none;
        }

        .listTitle {
            font-size: 16px;
            color: black;
            text-decoration: none;
        }

        .listTitle:hover {
            color: #33b5e5;
        }

        /* 設定客服按鈕 */

        .button:hover {
            background-color: hsla(168, 100%, 50%, 0.2);
            color: #33b5e5;
        }

        .button {
            display: flex;
            background-color: white;
            align-items: center;
            justify-content: center;
            position: fixed;
            top: 80%;
            padding: 20px;
            width: 180px;
            height: 20px;
            border: 2px solid;
            font-size: 20px;
            font-weight: 700;
            border-image: linear-gradient(45deg, gold, deeppink) 1;
            clip-path: inset(0px round 10px);
            animation: huerotate 6s infinite linear;
            filter: hue-rotate(360deg);
        }


        @keyframes huerotate {
            0% {
                filter: hue-rotate(0deg);
            }

            100% {
                filter: hue-rotate(360deg);
            }
        }



        /* 設定摺疊區塊 */
        .title {
            font-size: 18px;
            font-weight: 700;
            color: #33b5e5;
            height: 40px;
            padding-top: 10px;
        }

        .accordion-button {
            font-weight: 600;
        }

        .accordion-body {
            font-size: 14px;
            color: rgb(50, 50, 50);
        }

        [aria-expanded="true"].accordion-button {
            border: 2px solid;
            border-image: linear-gradient(45deg, gold, deeppink) 1;
            clip-path: inset(0px round 10px);
            animation: huerotate 6s infinite linear;
            filter: hue-rotate(360deg);
        }

        @keyframes huerotate {
            0% {
                filter: hue-rotate(0deg);
            }

            100% {
                filter: hue-rotate(360deg);
            }
        }
    </style>
</head>

<body>
    <div class="none"></div>
    <div class="container">
        <div class="menu">
            <div class="innerMenu">
                <ul class="list-group list-group-flush">
                    <li><a class="listTitle" href="#title1">註冊問題</a></li>
                    <li><a class="listTitle" href="#title2">商城問題</a></li>
                    <li><a class="listTitle" href="#title3">團購問題</a></li>
                    <li><a class="listTitle" href="#title4">討論區問題</a></li>
                    <li><a class="listTitle" href="#title5">其他問題</a></li>
                </ul>
            </div>
            <form id="myForm" action="/CGA104G1/CusNameServlet" method="POST">
            <input id="userName" name="userName" type="hidden" value="${memVO.mem_account}" /> 
            <button class="button" type="submit">連繫客服</button>
            </form>
        </div>
        <div class="accordion  accordion-flush" id="accordionExample">
            <div class="title" id="title1">註冊問題</div>
            <div class="accordion-item">
                <h2 class="accordion-header" id="headingOne">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                        data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                        收不到 Barei 認證信
                    </button>
                </h2>
                <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne"
                    data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                        因電子郵件皆有可能被歸類「垃圾信件」例如: Gmail、Yahoo 或 Hinet，若「收件夾」未收到認證信函，
                        請檢視「垃圾信件」，若認證信件被歸類為垃圾郵件時，請您先將認證信件勾選起來，並點選「不是垃圾郵件」。
                    </div>
                </div>
            </div>
            <div class="accordion-item">
                <h2 class="accordion-header" id="headingTwo">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                        data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                        如果忘記密碼怎麼辦？
                    </button>
                </h2>
                <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo"
                    data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                        請至登入專區「忘記密碼」申請，請填寫您的帳號和新密碼，並按下「取得驗證碼」，填上系統傳至手機的驗證碼後，即完成變更密碼。
                    </div>
                </div>
            </div>
            <div class="title" id="title2">商城問題</div>
            <div class="accordion-item">
                <h2 class="accordion-header" id="headingThree">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                        data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                        訂購需要先加入會員嗎？
                    </button>
                </h2>
                <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree"
                    data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                        <strong>需先加入會員！</strong>
                        請直接輸入慣用的E-mail及密碼，
                        系統會發送會員認證信至您輸入的信箱，
                        因此請再次確認您輸入的E-mail是否正確，
                        送出後，即可至信箱進行收信並點選信件內的驗證網址即完成會員註冊
                        。註冊完成，需再次登入並填寫會員資料，進入購買清單頁面即可，敬請安心選購。
                    </div>
                </div>
            </div>
            <div class="accordion-item">
                <h2 class="accordion-header" id="headingFour">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                        data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                        我如何知道收到的商品，是我當初所訂購的商品內容？
                    </button>
                </h2>
                <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour"
                    data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                        在您收到訂購商品時，已隨貨為您附上了「商品明細表」，
                        請您依表核對包裝箱內的商品內容，若有不符或短少，
                        為確保您的權益請於24小時內來電聯絡我們，
                        Barei將即刻為您作紀錄並進行處理。商品明細表為退換貨憑證之一，
                        請您在天猶豫期內，妥善保管勿毀損丟棄。
                    </div>
                </div>
            </div>
            <div class="title" id="title3">團購問題</div>
            <div class="accordion-item">
                <h2 class="accordion-header" id="headingFive">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                        data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                        團購買的東西有瑕疵怎麼處理？
                    </button>
                </h2>
                <div id="collapseFive" class="accordion-collapse collapse" aria-labelledby="headingFive"
                    data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                        請先聯繫您的團購主保留交易之相關紀錄，並與我們聯繫，如仍無法排除交易糾紛，您可向行政院消費者保護會申訴：https://appeal.cpc.ey.gov.tw/WWW/Default.aspx
                    </div>
                </div>
            </div>
            <div class="accordion-item">
                <h2 class="accordion-header" id="headingSix">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                        data-bs-target="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
                        有些商品想下次再買該如何做呢?
                    </button>
                </h2>
                <div id="collapseSix" class="accordion-collapse collapse" aria-labelledby="headingSix"
                    data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                        可在登入會員後，於想下次再買的商品頁面點選「加入收藏」，等下次要購買時再到
                        會員中心→『我的收藏』中查看清單，並將商品加入購物車中。
                    </div>
                </div>
            </div>
            <div class="title" id="title4">討論區問題</div>
            <div class="accordion-item">
                <h2 class="accordion-header" id="headingSeven">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                        data-bs-target="#collapseSeven" aria-expanded="false" aria-controls="collapseSeven">
                        如何發表文章？
                    </button>
                </h2>
                <div id="collapseSeven" class="accordion-collapse collapse" aria-labelledby="headingSeven"
                    data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                        登入後在討論區首頁點選"我要發文"，填寫主題及內容，按下"發表文章"即可完成。如果你還沒登入，系統會要求你登入。
                    </div>
                </div>
            </div>
            <div class="accordion-item">
                <h2 class="accordion-header" id="headingEight">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                        data-bs-target="#collapseEight" aria-expanded="false" aria-controls="collapseEight">
                        我發表的文章怎麼消失了?
                    </button>
                </h2>
                <div id="collapseEight" class="accordion-collapse collapse" aria-labelledby="headingEight"
                    data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                        您可能被其他會員檢舉，並且經過Barei管理員檢查後發現確實有不符討論區使用規範的情節，因此管理員將您的文章進行刪除。
                    </div>
                </div>
            </div>
            <div class="title" id="title5">其他問題</div>
            <div class="accordion-item">
                <h2 class="accordion-header" id="headingNine">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                        data-bs-target="#collapseNine" aria-expanded="false" aria-controls="collapseNine">
                        我如何知道收到的商品，是我當初所訂購的商品內容？
                    </button>
                </h2>
                <div id="collapseNine" class="accordion-collapse collapse" aria-labelledby="headingNine"
                    data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                        在您收到訂購商品時，已隨貨為您附上了「商品明細表」，
                        請您依表核對包裝箱內的商品內容，若有不符或短少，
                        為確保您的權益請於24小時內來電聯絡我們，
                        Barei將即刻為您作紀錄並進行處理。商品明細表為退換貨憑證之一，
                        請您在天猶豫期內，妥善保管勿毀損丟棄。
                    </div>
                </div>
            </div>
            <div class="accordion-item">
                <h2 class="accordion-header" id="headingTen">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                        data-bs-target="#collapseTen" aria-expanded="false" aria-controls="collapseTen">
                        我如何知道收到的商品，是我當初所訂購的商品內容？
                    </button>
                </h2>
                <div id="collapseTen" class="accordion-collapse collapse" aria-labelledby="headingTen"
                    data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                        在您收到訂購商品時，已隨貨為您附上了「商品明細表」，
                        請您依表核對包裝箱內的商品內容，若有不符或短少，
                        為確保您的權益請於24小時內來電聯絡我們，
                        Barei將即刻為您作紀錄並進行處理。商品明細表為退換貨憑證之一，
                        請您在天猶豫期內，妥善保管勿毀損丟棄。
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>