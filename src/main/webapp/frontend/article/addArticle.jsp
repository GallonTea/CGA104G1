<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.article.model.*"%>
<%@ page import="com.article_sorttype.model.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">

<style>
.none {
	height: 60px;
}

.title {
	/* width: 75%; */
	height: 40px;
	background-color: #33b5e5;
	position: relative;
	left: 50%;
	transform: translate(-50%);
	display: flex;
	align-items: center;
	padding: 10px;
	color: white;
	font-size: 20px;
	font-weight: 800;
	margin-bottom: 10px;
}

.container {
	margin: 0%;
	width: 75%;
	padding: 10px;
	position: relative;
	left: 50%;
	transform: translate(-50%);
}

.form {
	padding: 10px;
}

.asort, .acontent, .atitle {
	margin-bottom: 10px;
}

.ititle {
	width: 100%;
}

.icontent {
	width: 100%;
	height: 500px;
}

#tcontent {
	font-weight: 800;
	color: #33b5e5;
}

.btn-warning {
	position: absolute;
	right: 2%;
	color: white;
	font-weight: 600;
}

#logo {
	width: 100px;
	height: 40px;
}

</style>
</head>

<body>
	<nav class="navbar navbar-expand-lg bg-light fixed-top">
		<div class="container-fluid">
			<a class="navbar-brand" href="select_page.jsp"><img id="logo" src="img/logo.png"></a>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				</ul>
				<form class="d-flex" role="search">
					<input class="form-control me-2" type="search"
						placeholder="請輸入文章編號">
					<button class="btn btn-outline-info text-nowrap" type="submit">查詢</button>
				</form>
			</div>
		</div>
	</nav>
	<div class="none"></div>
	<div class="container">
		<div class="title">發表新文章</div>
		<div class="form">
			<form method="post" action="/CGA104G1/ArticleServlet" name="form1">
				<div class="asort">
				<jsp:useBean id="article_sorttypeSvc" scope="page" class="com.article_sorttype.model.Article_sorttypeService" />

					<select name="sort_id">
						<c:forEach var="article_sorttypeVO" items="${article_sorttypeSvc.all}">
							<option value="${article_sorttypeVO.sort_id}" ${(articleVO.sort_id==article_sorttypeVO.sort_id)? 'selected':'' }>${article_sorttypeVO.sort_content}</option>
						</c:forEach>
					</select>
					
				</div>
				<div class="atitle">
					<input type="text" class="ititle" name="article_title"
						value="${param.article_title}" placeholder="請輸入文章標題">
				</div>
				<div class="acontent">
					<span id="tcontent">文章內容</span>
					<textarea name="article_content" class="editor" value="${param.article_content}"></textarea>
				</div>
				<input type="text" name="mem_id" value="${param.mem_id}"> 
				<input type="hidden" name="action" value="insert">
				<button class="btn btn-warning" value="送出新增">確認發文</button>
			</form>
		</div>
	</div>

	<script src="<%=request.getContextPath() %>/ckeditor5/build/ckeditor.js"></script>
	<script>
	ClassicEditor
    .create(document.querySelector('.editor'), {
        cloudServices: {
            tokenUrl: 'https://93940.cke-cs.com/token/dev/91a66de3b51363daded4bc4c728bc0c521dfcfff6dc0a75d8f54767efd03?limit=10',
            uploadUrl: 'https://93940.cke-cs.com/easyimage/upload/'
        },
        toolbar: {
            items: [
                'heading', '|', 'bold', 'italic', 'link', 'bulletedList', 'numberedList',
                '|', 'alignment', 'outdent', 'indent', '|', 'fontColor',
                '|', 'imageUpload', 'blockQuote', 'insertTable', 'mediaEmbed',
                'undo', 'redo'
            ]
        }
    })
    .then(editor => {
        console.log(editor);
    });
	</script>
</body>
</html>