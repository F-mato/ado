<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/GetId.css" />
<title>Insert title here</title>
</head>
<body>

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
				<p>クラシック映画館</p>
			</h1>
		</div>
		<!----------------------------------- 映画館名 -->


		<!----------------------------------- 映画館名右側の店舗情報 -->
		<div class="innertext">
			<h2>
				<p class="contact">
					お問い合わせはこちら<br> <span class="phonenum">☎092-●●●-▲▲▲▲</span>
				</p>
			</h2>
		</div>
		<!----------------------------------- 映画館名右側の店舗情報 -->
    </header>
    
    
<form method="post" action="GetId">
    ID：<input type="text" name="id"><br>
    <input type="submit" value="パラメータを送信する"><br>
    
</form>
</body>

<!----------------------------------- フッター -->
<footer id="footer">
  <div class="footer-text">
    <h4>― 誰もの人生、シネマティック。</h4>
    <br>
  </div>

  <div class="footer-profile">
    <ul>
      <li>
        <h4>クラシック映画館</h4>
      </li>
      <li>
        <h4>☎092-●●●-▲▲▲▲</h4>
      </li>
      <li>
        <h4>福岡県 福岡市 中央区 長浜〇丁目〇〇番</h4>
      </li>
    </ul>
  </div>
</footer>
<!----------------------------------- フッター -->

</html>