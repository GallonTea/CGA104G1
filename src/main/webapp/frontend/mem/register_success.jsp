<%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>login_success.jsp</title>
</head>
<body>
				<form method="post" action="/CGA104G1/MemServlet">
<table border='1' cellpadding='5' cellspacing='0' width="500" height="300">
		<tr bgcolor='orange' align='center' valign='middle' height='20'>
			<th>驗證信已發送，請至信箱查收驗證碼： <br> 
			系統將在<span style="color: red">120</span>秒後跳轉回首頁!<br>

				請輸入驗證碼: <input type="text" name="regpasschk"> <br>



					<input type="hidden" name="action" value="confirmreg">
					<input id="1" type="submit" value="確認送出" style="margin-left: 100px">
					
					
				</form>

			</th>

		</tr>

	</table>

	
</body>
</html>
