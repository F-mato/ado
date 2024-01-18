<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/information.css" />
<title>My information</title>

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
    
<body>

<h3>会員登録ページ</h3>

<form action="/cinema/Information"  method="post">
 		パスワード :	<input type="password"   	required	name="pass"  value="${session_pass}"    />  <br>
		名前(氏名) :    <input type="text"   		required	name="name"  value="${session_name}"    />  <br>
		名前(かな) :  	<input type="text"   		required	name="kana"  value="${session_kana}"/>  <br> 
		☎電話番号 :	<input type="tel"    		required	name="tel"  pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" value="${session_tel}"/>  <br>
		〒郵便番号 :	<input type="text"   		required	name="postNum"  value="${session_postNum}"/>  <br>
		現在地住所 :	<input type="text"   		required	name="address"  value="${session_address}"/>  <br>
		✉アドレス :	<input type="email"  		required	name="mail"  value="${session_mail}"/>  <br>
		生年月日:		<input type="date" 			required	name="birth"	value="${session_birth}> <br>
						<input type="submit"   value="変更"/>
						<span class="btn1">
                        <a href="/cinema/mypage.jsp"><button class="mypage" type="button">マイページへ</button></a>
                    	</span>
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


