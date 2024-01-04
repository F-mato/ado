<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログイン</title>
</head>
<body>
<form action="/cinema/LoginForm" method="post">
	ユーザーID : <input type="text" name="userId"/> <br><br>
	パスワード : <input type="password" name="pass"/> <br><br>
	<input type="submit" value="Login"/> <br><br>
	<a href="/cinema/register.jsp">会員登録はこちらから</a>
	<span class="btn1">
    <a href="/cinema/toppage.jsp"><button class="toppage" type="button">戻る</button></a>
    </span>
		
	
</form>
</body>
</html>