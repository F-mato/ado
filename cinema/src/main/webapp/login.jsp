<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/login.css" />
<title>ログイン</title>

</head>

 <!----------------------------------- ヘッダー -->
	<header id="introduction">

		<!----------------------------------- ロゴの部分 -->
		<div class="top-image">
			<img src="./pic/new-logo.gif" alt="クラシック映画館ロゴ">
		</div>
		<!----------------------------------- ロゴの部分 -->


		<!----------------------------------- 映画館名 -->
		<div class="theater">
			<h1>
				クラシック映画館
			</h1>
		</div>
		<!----------------------------------- 映画館名 -->


		<!----------------------------------- 映画館名右側の店舗情報 -->
		<div class="innertext">
			<h3>
				<p class="contact">
					お問い合わせはこちら<br> <span class="phonenum">☎092-●●●-▲▲▲▲</span>
				</p>
			</h3>
		</div>
		<!----------------------------------- 映画館名右側の店舗情報 -->
    </header>
 <body>   
    
<h2>ログインページ</h2>

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

<!----------------------------------- フッター -->
<footer id="footer">
  <div class="footer-text">
    <h3>― 誰もの人生、シネマティック。</h3>
    <br>
  </div>

  <div class="footer-profile">
    <ul>
      <li>
        <h3>クラシック映画館</h3>
      </li>
      <li>
        <h3>☎092-●●●-▲▲▲▲</h3>
      </li>
      <li>
        <h3>福岡県 福岡市 中央区 長浜〇丁目〇〇番</h3>
      </li>
    </ul>
  </div>
</footer>
<!----------------------------------- フッター -->
</html>