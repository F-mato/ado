<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログイン</title>
<style>
html {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-size: 62.5%;
	/* ↑ デフォルトが16px設定なので62.5%=10pxにし、のちのサイズ設定を計算しやすくしています */
	color: #40403f;
	/* ↑まっくろじゃない色 */
}

header {
	box-sizing: content-box;
	position: fixed;
	z-index: 999;
	top: 0;
	left: 0;
	display: flex;
	flex-wrap: nowrap;
	width: 100%;
	height: 113px;
	align-items: center;
	border-bottom-style: solid;
	border-bottom-color: rgb(182, 28, 43);
	border-width: 4.5px;
	box-shadow: 0 10px 10px #FFFFFF;
	background: linear-gradient(to top, rgb(247, 247, 233),
		rgb(239, 224, 103));
	font-family: 'Kaisei Tokumin', serif;
}

form {
	text-align: center;
	padding-top: 20px;
	background-color: aliceblue;
	font-size: 30px;
}

input {
	padding: 10px;
	font-size: 30px;
}

h1 {
	text-align: center;
	font-size: 40px;
}
</style>
</head>
<body>
	<form action="/cinema/LoginForm" method="post">
		ユーザーID : <input type="text" name="userId" /> <br>
		<br> パスワード : <input type="password" name="pass" /> <br>
		<br> <input type="submit" value="Login" /> <br>
		<br> <a href="/cinema/register.jsp">会員登録はこちらから</a> <span
			class="btn1"> <a href="/cinema/toppage.jsp"><button
					class="toppage" type="button">戻る</button></a>
		</span>


	</form>
</body>
</html>