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
    <link rel="stylesheet" href="https://unpkg.com/modern-css-reset/dist/reset.min.css" />
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
    <link href="https://fonts.googleapis.com/css2?family=M+PLUS+Rounded+1c:wght@500&display=swap" rel="stylesheet">
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
                <p>クラシック映画館</p>
            </h1>
        </div> 
        <!----------------------------------- 映画館名 -->


        <!----------------------------------- 映画館名右側の店舗情報 -->
        <div class="innertext">
            <h2>
                <p class="contact">お問い合わせはこちら<br><span class="phonenum">☎111-1111</span></p>
            </h2>
        </div> 
        <!----------------------------------- 映画館名右側の店舗情報 -->


        <!----------------------------------- ログイン画面の領域 -->
        <div class="login">
        <div class="form">

    </header>
    <!-------------------------------- ここから各画面遷移の作成に移る -->
		<div class = "mypage">
			<h1>マイページ</h1>
			
			<h2>予約</h2>
			<a href="/cinema/reserve.jsp"><button class="reserve" type="button">予約</button></a>
			
			<h2>購入履歴</h2>
			<a href="/cinema/history.jsp"><button class="purchasehistory" type="button">確認</button></a>
			
			<h2>登録情報</h2>
			<a href="/cinema/information.jsp"><button class="memberinfo" type="button">確認</button></a>
			
			<h2>Logout</h2>
			<a href="/cinema/logout.jsp"><button class="memberinfo" type="button">確認</button></a>
			
			
		</div>
    <!----------------------------------- フッター -->
    <footer id="footer">
        <div class="footer-profile">
            <h3>― 誰もの人生、シネマティック。</h3><br>
            <h4>クラシック映画館</h4>
        </div>
    </footer>
    <!----------------------------------- フッター -->
</body>
</html>