<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/register.css" />
<title>Insert title here</title>
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
			<h2>
				<p>クラシック映画館</p>
			</h2>
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

<body>

<h1>会員登録ページ</h1>

<form action="/cinema/Regform"  method="post">
		ユーザーID :    <input type="text"  	required   		 name="userId" 		placeholder="ユーザーＩＤ"/>  <br>
		パスワード :    <input type="password"	required		 name="pass"   		placeholder="パスワード"/>  <br>
		名前(氏名) :    <input type="text" 	    required 		 name="name"   		placeholder="氏名"/>  <br>
		名前(かな) :  	<input type="text" 	    required 		 name="kana"   		placeholder="氏名（かな）"/>  <br> 
		☎電話番号 :    <input type="tel"  	    required		 name="tel"    		placeholder="電話番号"pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" />  <br>
		〒郵便番号 :    <input type="text"     	required		 name="postNum" 	placeholder="郵便番号"/>  <br>
		現在地住所 :    <input type="text"     	required		 name="address" 	placeholder="住所"/>  <br>
		✉アドレス : 	<input type="email"    	required		 name="mail" 	 	placeholder="メールアドレス"/>  <br> 
		性別:           <input type="radio"    	required		 name="gender" value="男性">男性
			            <input type="radio"    	required		 name="gender" value="女性">女性 <br>
		生年月日:		<input type="date" 		required		 name="birth"		value=""> <br>	
		
						<input type="submit"   value="新規登録"/>
						<span class="btn1">
                        <a href="/cinema/toppage.jsp"><button class="toppage" type="button">戻る</button></a>
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

form {
	 text-align: center;
	 font-size: 30px;
}

input {
	 padding: 10px;
	 font-size: 15px;
	 
}

h1 {
     padding-top: 100px;
     text-align: center;
     font-size: 50px;
}
    
h2 {
	 text-align: center;
	 font-size: 40px;
}
	
    
 button {
	 padding: 5px;
	 font-size: 20px;
}
	
	/*　▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼　　　フッターの領域の設定 ここから　　　▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼　*/
 /* 全体 */
 footer {
    display: flex;
    justify-content: space-between;
    margin-top: 140px;
    width: 100%;
    height: 120px;
    background-color: rgba(166, 146, 150, 0.168);
    background: linear-gradient(to top, rgb(232, 229, 229), rgb(165, 163, 163));
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


/*　▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲　　　フッターの領域の設定 ここまで　　　▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲　*/
</style>	
</html>