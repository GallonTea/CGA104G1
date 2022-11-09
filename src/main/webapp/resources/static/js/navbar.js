const navbar = `

<header>
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <a class="navbar-brand" href="">
                <!-- 網站 logo -->
                <img src="../resources/static/image/ba-rei%2002.png" alt="Logo" width="200px" height="10%"
                     class="d-inline-block align-text-top">
            </a>

            <!-- 右側 toggle 按鈕 -->
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation" style="margin-left: 0;">
                <span class="navbar-toggler-icon"></span>
            </button>

            <!-- 導覽列內容 -->
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="index.html">首頁</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="./orderBuy/Order.html">毛孩の商城</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">團購底加啦</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">家長討論區</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                           aria-expanded="false">
                            <i class="fa-regular fa-user"></i>
                            會員中心
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">成為會員 / 登入會員</a></li>
                            <li><a class="dropdown-item" href="./orderBuy/Order.html">追蹤訂單</a></li>
                            <li><a class="dropdown-item" href="#">團購訂單</a></li>
                            <li><a class="dropdown-item" href="./coupon/Coupon.html">查看折價券</a></li>
                            <li><a class="dropdown-item" href="./coupon/GetCoupon.html">領取折價券</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="#">會員中心首頁</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                           aria-expanded="false">
                            <i class="fa-regular fa-paper-plane"></i>
                            客服專區
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">關於我們</a></li>
                            <li><a class="dropdown-item" href="#">常見問題 Q&A</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="#">客服專區首頁</a></li>
                        </ul>
                    </li>
                </ul>

                <form class="d-flex" role="search" style="margin-bottom: 10px">
                    <input class="form-control me-2" type="search" placeholder="今天你想來點..." aria-label="Search"
                           id="search_bar">
                    <button class="btn btn-outline-success" type="submit" id="search_btn">Search</button>
                </form>
            </div>
            <div>
                <a href="#" style="text-decoration: none; margin-left: 10px; color: #484747">
                    <i class="fa" style="font-size:24px">&#xf07a;</i>
                    <span class='badge badge-warning' id='lblCartCount'> 5 </span>
                </a>
            </div>
        </div>
    </nav>

</header>
`



document.body.insertAdjacentHTML('afterbegin', navbar);
