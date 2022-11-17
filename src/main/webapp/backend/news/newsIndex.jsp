<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/backend/backNavbar.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.news.model.*"%>

<%
    NewsService newsSvc = new NewsService();
    List<NewsVO> list = newsSvc.getAll();
    pageContext.setAttribute("list",list);
%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>最新消息管理</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js"
        integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk"
        crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.1.js"
        integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>

    <style>
        /* 設定按鈕位置 */
        .btnArea {
            text-align: right;
        }

        /* 設定消息顯示表頭外觀 */
        .newsHead {
            display: flex;
            background-color: #FFC107;
            color: white;
            font-weight: 700;
            text-align: center;
        }

        .nTitle {
            width: 60%;
        }

        .nTime {
            width: 30%;
        }

        .nEmp {
            width: 10%;
        }

        .none {
            height: 10px;
        }

        /* 設定消息顯示表內容 */
        .allNews {
            width: 100%;
            display: flex;
            text-align: center;
        }

        .Title {
            width: 60%;
        }

        .Time {
            width: 30%;
        }

        .Emp {
            width: 10%;
        }

        ::after {
            display: none !important;
        }

        .accordion-body {
            text-align: center;
        }

        .addTitle {
            width: 100%;
        }

        .readNews {
            border: none;
            resize: none;
            outline: none;
            width: 100%;
            min-height: 80px;
            height: auto;
            text-align: center;
        }

        /* 設定新增消息區塊 */
        .addWord {
            color: #33b5e5;
            font-weight: 700;
        }

        .addArea {
            /* border: 1px solid black; */
            padding: 10px;
        }
    </style>
</head>

<body>
    <div class="none"></div>
    <div class="container">
        <div class="btnArea">
            <button class="btn btn-outline-success text-nowrap addNews" type="submit">新增消息</button>
        </div>

        <div class="none"></div>
        <div class="addArea"></div>
        <div class="newsHead">
            <div class="nTitle">最新消息標題</div>
            <div class="nEmp">發布員工</div>
            <div class="nTime">發布時間</div>
        </div>

		<c:forEach var="newsVO" items="${list}">
        <div class="accordion accordion-flush" id="accordionFlushExample${newsVO.newsId}">
            <div class="accordion-item">
                <h2 class="accordion-header" id="flush-heading${newsVO.newsId}">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                        data-bs-target="#flush-collapse${newsVO.newsId}" aria-expanded="false" aria-controls="flush-collapse${newsVO.newsId}">
                        <div class="allNews">
                            <div class="Title">${newsVO.newsTitle}</div>
                            <div class="Emp">${newsVO.empId}</div>
                            <div class="Time">${newsVO.createTime}</div>
                        </div>
                    </button>
                </h2>

                <div id="flush-collapse${newsVO.newsId}" class="accordion-collapse collapse" aria-labelledby="flush-headingOne"
                    data-bs-parent="#accordionFlushExample">
                    <div class="btnArea">
                        <button class="btn btn-outline-dark text-nowrap updateNews" type="button">修改消息</button>
                        <button class="btn btn-outline-danger text-nowrap" type="button">刪除消息</button>
                    </div>
                    <div class="accordion-body">${newsVO.newsContent}</div>
                </div>
            </div>
        </div>
        </c:forEach>
    </div>
    </div>

    <script src="<%=request.getContextPath() %>/ckeditor5/build/ckeditor.js"></script>
    <script>

        // 點擊新增消息觸發動作
        $('.addNews').click(function () {
            $('.addArea').html(`<div class="form">
			<form method="post" action="/CGA104G1/newsServlet" name="form1">					
				
				<div class="ntitle">
                    <span class="addWord">消息標題</span><br>
					<input type="text" class="addTitle" name="newsTitle" placeholder="請輸入消息標題" value="${param.newsTitle}">
				</div>
				<div class="addContent">
					<span class="addWord">消息內容</span><br>
					<textarea name="newsContent" class="editor" value="${param.newsContent}"></textarea>
				</div>
				Emp<input type="text" name="empId" value="${param.empId}"> <br>
                <div class="none"></div>
				<input type="hidden" name="action" value="insert">
                <div class="btnArea">
				<button class="btn btn-info" value="送出新增" type="submit">確認發布</button>
                </div>
                </form>
            <div class="none"></div>
			</div>
		</div>
		`);

            ClassicEditor
                .create(document.querySelector('.editor'), {
                    cloudServices: {
                        tokenUrl: 'https://93322.cke-cs.com/token/dev/f61fb72c46962eeef89212e54452b4a95a6198649d6d844997f8a0be111e?limit=10',
                        uploadUrl: 'https://93322.cke-cs.com/easyimage/upload/'
                    },
                    toolbar: {
                        items: [
                            'heading', '|', 'bold', 'italic', 'link', 'bulletedList', 'numberedList',
                            '|', 'alignment', 'outdent', 'indent', '|', 'fontSize', 'fontColor',
                            '|', 'imageUpload', 'blockQuote', 'insertTable', 'mediaEmbed',
                            'undo', 'redo'
                        ]
                    }
                })
                .then(editor => {
                    console.log(editor);
                });
            $('.addNews').hide();
        })

        // 點擊修改消息觸發動作
//         $('.updateNews').click(function () {
//         	<textarea class="editor readNews" value="${newsVO.newsContent}"></textarea>
//         })


    </script>
</body>

</html>