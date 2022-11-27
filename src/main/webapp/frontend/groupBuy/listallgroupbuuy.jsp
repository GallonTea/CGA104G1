<%@page import="com.news.controller.newsServlet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.group_buy_item.model.*"%>
<%@ page import="com.group_buy_item_picture.model.*"%>
<%@ page import="java.util.*"%>

<%
Group_Buy_ItemService group_Buy_ItemService = new Group_Buy_ItemService();
List<Group_Buy_ItemVO> list = group_Buy_ItemService.getAll();
pageContext.setAttribute("list", list);
%>

<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>listallgroupbuy</title>

<!-- import bootstrap 5.2.1 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
	crossorigin="anonymous">

<!-- import font-style -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@300&display=swap"
	rel="stylesheet">

<!-- import css stylesheet -->
<link rel="stylesheet" href="../..//resources/static/css/plugins.css">
<link rel="stylesheet" href="../..//resources/static/css/style.css">
<link rel="stylesheet" href="../..//resources/static/css/responsive.css">
<!-- import jquery-3.6.0 -->
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- import icon -->
<script src="https://kit.fontawesome.com/b5ef6b60f3.js"
	crossorigin="anonymous"></script>

<script src="https://cdn.bootcdn.net/ajax/libs/qs/6.11.0/qs.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

<style>
html {
	font-size: 22px;
}

.home_main {
	z-index: -999999;
	position: relative;
	transition: 3s;
	opacity: 30%;
	height: 4160px;
	width: auto;
	background-image:
		url('../resources/static/image/andrew-s-ouo1hbizWwo-unsplash.jpg');
	background-repeat: no-repeat;
	background-size: 100%;
	background-color: transparent;
	transform: scale(1.111);
	margin-bottom: 10%;
}

body {
	background: #eee;
}

footer {
	background: #fbaa70;
	padding: 50px 10px;
	font-size: 18px;
}

.badge {
	padding-left: 9px;
	padding-right: 9px;
	-webkit-border-radius: 9px;
	-moz-border-radius: 9px;
	border-radius: 9px;
}

.label-warning[href], .badge-warning[href] {
	background-color: #c67605;
}

#lblCartCount {
	font-size: 12px;
	background: #ff0000;
	color: #fff;
	padding: 0 5px;
	vertical-align: top;
	margin-left: -10px;
}

/* footer 樣式 */
footer {
	border-top: solid 1px #c9c9c9;
	padding: 80px 0px;
}

footer a {
	color: black;
	text-decoration: none;
}

footer a:hover {
	color: #929292;
	opacity: 60%;
}

footer {
	border-top: solid 1px #c9c9c9;
	padding: 80px 0;
	background-color: white;
}

footer img {
	width: 110px;
	margin-bottom: 0;
}

@media all and (min-width: 992px) {
	.navbar .nav-item .dropdown-menu {
		display: none;
	}
	.navbar .nav-item:hover .nav-link {
		
	}
	.navbar .nav-item:hover .dropdown-menu {
		display: block;
	}
	.navbar .nav-item .dropdown-menu {
		margin-top: 0;
	}
}
</style>
</head>

<body>
	<!-- <div class="home_main"></div> -->



	<main>
	<div class="container">

	<!-- 新增團購團申請測試區 -->
	
		<form action="<%=request.getContextPath()%>/GroupBuyStartNewApplyListServlet">
		<%-- <input type="hidden" name="gbitem_id"  value="${Group_Buy_ItemVO.gbitem_id}"> --%>
		<input type="hidden" name="gbitem_id"  value="2">
		<input type="hidden" name="mem_id"  value="1">
		<input type="hidden" name="action" value="insert">
		<button class="btn btn-primary" type="submit">開新團購</button>
		</form>
		<form action="<%=request.getContextPath()%>/GroupBuyMasterApplyListServlet">
		<%-- <input type="hidden" name="gbitem_id"  value="${Group_Buy_ItemVO.gbitem_id}"> --%>
		<input type="hidden" name="mem_id"  value="1">
		<input type="hidden" name="action" value="listAllMyGroupBuy">
		<button class="btn btn-primary" type="submit">我的團購團</button>
		</form>
	<!-- 新增團購團申請測試區 -->		
			
			<c:forEach var="Group_Buy_ItemVO" items="${list}">
			
				<div class="grid-products">
					<div class="row">
						<div class="item col-lg-4 col-md-4 col-6">
							<div class="product-image">
<%-- 							<form action="<%=request.getContextPath()%>/frontend/groupBuy/showOneGroupBuyItem.jsp"> --%>
								<a href="<%=request.getContextPath()%>/frontend/groupBuy/showOneGroupBuyItem.jsp" class="product-img">
									<img
									class=""
									data-src="<%=request.getContextPath()%>/groupBuyItemPicture/groupBuyItemPictureGetOne.do?gbitem_id=${Group_Buy_ItemVO.gbitem_id}"
									src="<%=request.getContextPath()%>/groupBuyItemPicture/groupBuyItemPictureGetOne.do?gbitem_id=${Group_Buy_ItemVO.gbitem_id}"> 
									
									<img
									class="hover lazyload"
									data-src="<%=request.getContextPath()%>/groupBuyItemPicture/groupBuyItemPictureGetOneByGBItemID.do?gbip_id=${gbipVO.gbip_id+1}"
									src="<%=request.getContextPath()%>/groupBuyItemPicture/groupBuyItemPictureGetOneByGBItemID.do?gbip_id=${gbipVO.gbip_id+1}" >
									<div class="product-labels">
										<span class="lbl on-sale">Sale</span>
									</div>
                                     
									 <input type="submit" value="檢視詳細資料">
									 <input type="hidden" name="gbitem_id"  value="${Group_Buy_ItemVO.gbitem_id}">
								</a>
<!-- 								</form> -->
								<div class="button-set style3">
									<ul>
										<li><a href="index.html#quickview-popup"
											title="Quick View"
											class="btn-icon quick-view-popup quick-view"
											data-bs-toggle="modal" data-bs-target="#quickview_popup"><i
												class="icon an an-expand-arrows-alt"></i><span
												class="tooltip-label">Quick View</span></a> <!--End Quick View Button-->
										</li>
										<li>
											<div class="wishlist-btn">
												<a class="btn-icon wishlist add-to-wishlist"
													href="my-wishlist.html"><i class="icon an an-heart-o"></i><span
													class="tooltip-label">Add To Wishlist</span></a>
											</div> <!--End Wishlist Button-->
										</li>
										<li>
											<div class="compare-btn">
												<a class="btn-icon compare add-to-compare"
													href="compare-style2.html" title="Add to Compare"><i
													class="icon an an-balance-scale"></i><span
													class="tooltip-label">Add to Compare</span></a>
											</div> <!--End Compare Button-->
										</li>
									</ul>
								</div>
								<!--End Product Button-->
							</div>
							<div class="product-details text-left">
								<div class="brand-name">${Group_Buy_ItemVO.gbitem_name}</div>
								<!--End Brand Name-->
								</div>
								<div class="product-price">
									<span class="old-price">$${Group_Buy_ItemVO.gbitem_price}</span><span class="price">折扣價格$${Group_Buy_ItemVO.gbitem_price}</span>
								</div>
								<div class="product-review">
									<i class="an an-star"></i><i class="an an-star"></i><i
										class="an an-star"></i><i class="an an-star"></i><i
										class="an an-star"></i><span class="review-label">
								</div>
								<!--End Product Review-->
								</ul>
								<a href="index.html#pro-addtocart-popup" title="Add to Cart"
									class="btn-icon btn btn-addto-cart" data-bs-toggle="modal"
									class="btn-icon btn btn-addto-cart" data-bs-toggle="modal"
									data-bs-target="#pro-addtocart-popup"><i
									class="icon an an-shopping-cart"></i><span>Add to Cart</span></a>
<!-- 								<a href="index.html#pro-addtocart-popup" title="Add to Cart" -->
<!-- 									class="btn-icon btn btn-addto-cart" data-bs-toggle="modal" -->
<!-- 									class="btn-icon btn btn-addto-cart" data-bs-toggle="modal" -->
<!-- 									data-bs-target="#pro-addtocart-popup"><i -->
<!-- 									class="icon an an-shopping-cart"></i><span>Add to Cart</span></a> -->
								<!--end Cart Button-->
							</div>
						</div>
					</div>
				</div>

			</c:forEach>
		<%-- 		<%@ include file="page2.file" %> --%>

 

	<div id="test" class="row"></div>





	</div>

	</main>


	<!-- import bootstrap 5.2.1 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
		crossorigin="anonymous"></script>

	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
	<!--  NavBar  -->
	<script src="../../resources/static/js/navbar.js"></script>
	<!--  Footer  -->
	<script src="../../resources/static/js/footer.js"></script>
</body>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	var gbitemStatus = [ "超出團購期限下架", "上架中", "無庫存", "有庫存" ];
	var txt = "";
</script>
<script>
//    getAllItem();
// 		async function getAllItem(pageNumber = 1) {
// 			let pjName = getProjectName();
// 			//res:回應物件
// 			// let res = await fetch(`${pjName}/item/items?action=GetAll_For_Display_JS&pageNumber=${pageNumber}`, { method: 'get' });
// 			let res = await fetch(`${pjName}/groupBuyItemPicture/groupBuyItemPictureGetAll.do?`, { method: 'get' });
// 			let groupBuyItemPicture = await res.json();  //將回應本體中json格式的字串轉成javascript陣列


// 			$("#test").html('');



// 			groupBuyItemPicture.forEach(e => {
// 				// const image = item.itemPhoto
// 				//
// 				// function base64(image){
// 				// 	let binary ="";
// 				// 	const bytes = new Uint8Array(image)
// 				// 	const len =bytes.byteLength;
// 				// 	for(let i =0; i<len;i++){
// 				// 		binary += String.fromCharCode(bytes[i])
// 				// 	}
// 				// 	return window.btoa(binary)
// 				// }
// 				// let photo = base64(image)
// 				// photo="data:image/png;base64,"+photo
// 				$("#test").append(`
				
// 				 <div class="col-md-3">
// 		                <div class="outer">
// 		                    <div class="upper"> <img src="data:image/png;base64,${e.itemPhoto}"  onclick="showItem(${e.itemId})" class="card-img-top">
// 		                        <div class="innertext">
// 		            <a href="#">
// 		                            <h4>${e.itemName}</h4>
// 		                        </div>
// 		                    </div>
// 		                    <div class="lower">
//                             <span>NT${e.itemPrice}</span>
// 		            </a>

// 		                    </div>
// 		                </div>
// 		        </div>
// 		 `)



// 			})

// 			getCount();

// 		}

	
// 	  	async function showItem(gbitem_id){
//     	sessionStorage.setItem('gbitem_id', gbitem_id);  
//     	location.assign("showOneGroupBuyItem.html");
//     	/* location = "item_detail.html"; */
// 	}

// 		// async function getCount() {
// 		// 	let pjName = getProjectName();
// 		// 	$("#button").html('');
// 		// 	let res = await fetch(pjName + "/item/items?action=GetCount");
// 		// 	// let res = await fetch("/BA_REI/item/items?action=GetCount");
// 		// 	let item = await res.json();//將回應本體中json格式的字串轉成javsascript物件
// 		// 	let count = item.count;
// 		// 	let page = count % 8 === 0 ? count / 8 : count / 8 + 1;
// 		// 	for (let i = 1; i <= page; i++) {
// 		// 		$("#button").append(
// 		// 			`<button class="ghost-button" target="_blank" onclick="getAllItem(${i})">${i}</button>`
// 		// 		)
// 		// 	}
// 		// }

// 		// document.getElementById("keyWords").addEventListener('keypress', e => {
// 		// 	if (e.keyCode === 13) {
// 		// 		search();
// 		// 	}
// 		// })
// 		// async function search() {
// 		// 	let keyWords = document.getElementById("keyWords").value;
// 		// 	let pjName = getProjectName();
// 		// 	$("#test").html('');
// 		// 	let res = await fetch(pjName + "/item/items?action=search&keyWords=" + keyWords);
// 		// 	let items = await res.json();
// 		// 	console.log(items)
// 		// 	items.forEach(item => {


// 		// 		$("#test").append(`

// 		// 		 <div class="col-md-3">
// 		//                 <div class="outer">
// 		//                     <div class="upper"> <img src=data:image/jpeg;base64,${item.itemPhoto}  onclick="showItem(${item.itemId})" class="card-img-top">
// 		//                         <div class="innertext">
// 		//             <a href="#">
// 		//                             <h4>${item.itemName}</h4>
// 		//                         </div>
// 		//                     </div>
// 		//                     <div class="lower">
//         //                     <span>NT${item.itemPrice}</span>
// 		//             </a>

// 		//                     </div>
// 		//                 </div>
// 		//         </div>
// 		//  `)



// 			// })

// 		// }

// 		function getProjectName() {
// 			let path = window.location.pathname;
// 			let webCtx = path.substring(0, path.indexOf('/', 1));
// 			return webCtx;
// 		}


</script>


</html>