<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/topadmin.css" />
<title>管理者トップ画面</title>
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
			<h2>
				<p>クラシック映画館</p>
			</h2>
		</div>
		<!----------------------------------- 映画館名 -->


		<!----------------------------------- 映画館名右側の店舗情報 -->
		<div class="innertext">
			<h1>
				<p class="contact">
					お問い合わせはこちら<br> <span class="phonenum">☎092-●●●-▲▲▲▲</span>
				</p>
			</h1>
		</div>
		<!----------------------------------- 映画館名右側の店舗情報 -->
    </header>
    
			<h2>会員登録情報</h2>
			<a href="/admin/search.jsp"><button class="reserve" type="button">確認</button></a>
			
			<h2>上映情報</h2>
			<a href="/admin/movie.jsp"><button class="purchasehistory" type="button">確認</button></a>
			
			
			<h2>Logout</h2>
			<a href="/admin/logout.jsp"><button class="memberinfo" type="button">確認</button></a>

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