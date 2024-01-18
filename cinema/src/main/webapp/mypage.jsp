<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>クラシック映画館 マイページ</title>


<!------------------------------------ リセットCSS リンク-->
<link rel="stylesheet"
	href="https://unpkg.com/modern-css-reset/dist/reset.min.css" />
<!------------------------------------ リセットCSS リンク-->



<!------------------------------------ CSSファイル リンク-->
<link rel="stylesheet" href="./css/Mypage.css" />
<!------------------------------------ CSSファイル リンク-->



<!------------------------------------google fonts リンク-->
<!---基本フォント-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=BIZ+UDGothic&family=IBM+Plex+Sans+JP:wght@400;500;600&display=swap"
	rel="stylesheet">
<!---基本フォント-->

<!---ヘッダーのロゴ隣のフォント-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Kaisei+Decol:wght@700&family=Kaisei+Tokumin:wght@700&family=Tsukimi+Rounded:wght@600&display=swap"
	rel="stylesheet">
<!---ヘッダーのロゴ隣のフォント-->

<!---ヘッダーの右側(店舗情報)のフォント-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=M+PLUS+Rounded+1c:wght@500&display=swap"
	rel="stylesheet">
<!---ヘッダーの右側(店舗情報)のフォント-->


<!------------------------------------google fonts リンク-->
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
				クラシック映画館
			</h1>
		</div>
		<!----------------------------------- 映画館名 -->


		<!----------------------------------- 映画館名右側の店舗情報 -->
		<div class="innertext">
			<h2>
				<p class="contact">
					お問い合わせはこちら<br>
					<span class="phonenum">☎111-1111</span>
				</p>
			</h2>
		</div>
		<!----------------------------------- 映画館名右側の店舗情報 -->


		<!----------------------------------- ログイン画面の領域 -->
		<div class="login">
			<div class="form">
	</header>
	<!-------------------------------- ここから各画面遷移の作成に移る -->
	<div class="mypage">
		<h4>マイページ</h4>

		<h2>登録情報</h2>
		<a href="/cinema/information.jsp"><button class="memberinfo"
				type="button">確認</button></a>

		<h2>予約</h2>
		<a href="/cinema/reserve.jsp"><button class="reserve"
				type="button">予約</button></a>

		<h2>予約履歴</h2>
		<a href="/cinema/history3.jsp"><button class="purchasehistory"
				type="button">確認</button></a>
				
		<h2>トップページ</h2>
		<a href="/cinema/top2.jsp"><button class="membertop"
				type="button">移動</button></a>		
		

		<h2>ログアウト</h2>
		<a href="/cinema/logout.jsp"><button class="memberinfo"
				type="button">確認</button></a>
				

				

	</div>

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

<style>
@charset "UTF-8";

html {
     margin: 0;
     padding: 0;
     box-sizing: border-box;
     font-size: 62.5%;
     /* ↑ デフォルトが16px設定なので62.5%=10pxにし、のちのサイズ設定を計算しやすくしています */
     color: #40403f;
     /* ↑まっくろじゃない色 */
}

p.contact {
    padding-left: 40px;
    font-size: 20px;
    
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
    background: linear-gradient(to top, rgb(247, 247, 233), rgb(239, 224, 103));
    font-family: 'Kaisei Tokumin', serif;
}

/* ------------------------------------------------------------ ヘッダー領域全体*/


/* ------------------------------------------------------------ ロゴ画像の領域 */
/* 全体 */
header div.top-image {
    text-align: center;
    width: 10%;
    height: 100%;
    margin-left: 15px;
    /* background-color: #40403f; */
}
/* 全体 */


/* その画像の大きさと位置とまわりのぼかし効果 */
header div.top-image img {
    display: block;
    max-width: 90%;
    max-height: 90%;
    border-radius: 100%;
    text-align: center;
    margin: auto;
    margin-top: 5px;
    box-shadow: 0px 0px 30px #be5e5e;
}
/* その画像の大きさと位置とまわりのぼかし効果 */


/* ------------------------------------------------------------ ロゴ画像の領域 */


/* --------------------------------------------------『クラシック映画館』の領域 */

h1 {
   font-size: 30px;
}

h4 {
   padding-top: 130px;
   font-size: 40px;
   color: red;
}

div.title {
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

div.mypage {
	text-align: center;
	padding-top: 20px;
	background-color: aliceblue;
	font-size: 20px;
}

div.mypage h1 {
	color: red;
	padding-top: 80px;
}

/*　▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼　　　フッターの領域の設定 ここから　　　▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼　*/
/* 全体 */
footer {
	display: flex;
	justify-content: space-between;
	margin-top: 40px;
	width: 100%;
	height: 120px;
	background-color: rgba(166, 146, 150, 0.168);
	background: linear-gradient(to top, rgb(232, 229, 229),
		rgb(165, 163, 163));
}
/* 全体 */

/* ロゴとかいれるなら…の領域(とりあえず残しといてください) */
/* footer div.logo img { 
     width: 130px;
     height: 130px;
     border-radius: 100%;
     margin-top: 20px;
     margin-left: 80px;
 }*/
/* ロゴとかいれるなら…の領域(とりあえず残しといてください) */

/* 左側のコピーテキスト */
footer div.footer-text {
	width: 250px;
	height: 30px;
	font-size: 130%;
	margin-top: 50px;
	margin-left: 20px;
	font-family: 'Kaisei Tokumin', serif;
}
/* 左側のコピーテキスト */

/* -------------------------------右側の店舗情報 */
/* 全体 */
footer div.footer-profile {
	width: 280px;
	height: 95px;
	font-size: 130%;
	border-left: 5px dotted rgb(182, 28, 43);
	margin-top: 15px;
	margin-right: 20px;
	font-family: 'Kaisei Tokumin', serif;
}
/* 全体 */

/* 文字の設定 */
footer div.footer-profile ul li {
	list-style: none;
	font-size: 80%;
}
/* 文字の設定 */

/* -------------------------------右側の店舗情報 */

</style>

</html>