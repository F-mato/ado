<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>クラシック映画館 予約ページ</title>

<!-- リセットCSS リンク -->
<link rel="stylesheet"
	href="https://unpkg.com/modern-css-reset/dist/reset.min.css" />

<!-- CSSファイル リンク -->
<link rel="stylesheet" href="./css/style.css" />

<!-- google fonts リンク -->
<!-- 基本フォント -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=BIZ+UDGothic&family=IBM+Plex+Sans+JP:wght@400;500;600&family=Kaisei+Tokumin:wght@800&display=swap"
	rel="stylesheet">
<!-- 上映中作品 映画タイトルのフォント -->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@700&display=swap"
	rel="stylesheet">
<!-- google fonts リンク -->

<style>
.schedule {
	display: flex;
	justify-content: space-between;
}

.s-btn {
	color: white;
	font-size: 24px;
}
</style>

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


		<!----------------------------------- ログイン画面の領域 -->
		<div class="login">
			<div class="form">
				<!----------------------------------- ログインボタン左 全体(会員登録) -->
				<div class="btn1">
					<span class="btn1-text"> 会員の方はこちら </span> <br> <br> <br>
					<!----------------------------------- ログインボタン左(ログイン) -->
					<span class="btn1"> <a href="/cinema/login.jsp" class="btn">ログイン</a>
					</span>
					<!----------------------------------- ログインボタン左(ログイン) -->
				</div>
				<!----------------------------------- ログインボタン左 全体(会員登録) -->


				<!----------------------------------- ログインボタン右 全体(会員登録) -->
				<div class="btn2">
					<span class="btn2-text"> 当館を初めて<br>ご利用の方はこちら
					</span> <br> <br>
					<!----------------------------------- ログインボタン右本体(会員登録) -->
					<span class="btn2"> <a href="/cinema/register.jsp"
						class="btn">会員登録</a>
					</span>
					<!----------------------------------- ログインボタン右本体(会員登録) -->
				</div>
				<!----------------------------------- ログインボタン右 全体(会員登録) -->
			</div>
		</div>
		<!----------------------------------- ログイン画面の領域 -->
	</header>
	<!----------------------------------- ヘッダー -->

	<!----------------------------------- ナビメニュー -->
	<!-- GitHubにある『A班とのまとめ』ファイルの文言に、ナビメニューに何を設定するのか明記なかったので、項目についてはこちらで仮に入れています -->

	<nav id="filmnav">
		<div class="nav-brank1"></div>

		<div class="nav1">
			<span><a href="#">新作情報</a></span>

		</div>

		<div class="nav2">
			<span><a href="#">上映中の作品</a></span>
		</div>

		<div class="nav3">
			<span><a href="#">予約</a></span>

		</div>

		<div class="nav4">
			<span><a href="#">当館について</a></span>
		</div>

		<div class="nav-brank2"></div>
	</nav>
	<!----------------------------------- ナビメニュー -->

	<main id="contents">
		<!----------------------------------- 新作情報の領域 -->
		<section class="new">
			<!----------------------------------- 文字の領域 -->
			<div class="new-inner-top">
				<h2>新 作 情 報</h2>
			</div>
			<!----------------------------------- 文字の領域 -->


			<!----------------------------------- 動画の領域 -->
			<!--共有用に動画ファイルは抜いています。あとでWeb動画データにしまーす……-->
			<div class="new-movie">
				<img src="./pic/screen.jpg" alt="スクリーンの画像">
				<video controls
					src="./pic/Black and White Old Movie Silent Film Cinema Projector Video.mp4"
					alt="新作1" autoplay muted playsinline loop></video>
			</div>
			<!----------------------------------- 動画の領域 -->
		</section>
		<!----------------------------------- 新作情報の領域 -->

		<!----------------------------------- 上映中作品の領域 -->
		<section id="showing-now">
			<div class="showing-now-top">
				<h2>上 映 中 の 作 品</h2>
			</div>

			<div class="schedule">
				<input class="date" type="button" id="date1" /> 
				<input class="date" type="button" id="date2" /> 
				<input class="date" type="button" id="date3" /> 
				<input class="date" type="button" id="date4" />
				<input class="date" type="button" id="date5" />
				<input class="date" type="button" id="date6" /> 
				<input class="date" type="button" id="date7" />
			</div>



			<div class="screen" id="screen">
				<!-- JavaScriptによってデータ行がここに挿入されます -->
			</div>

			<!-- テンプレートの定義 -->
			<template id="dataRowTemplate">
				<div class="screenId"></div>
				<div class="title"></div>
				<img class="imgpath" alt="映画の画像"></img>
				<div class="description"></div>
				<div class="time1"></div>
				<div class="time2"></div>
				<div class="time3"></div>
				<div class="time4"></div>
				<div class="time5"></div>
				<div class="time6"></div>
			
				<img class="moviepath" alt="映画の動画"></img>
			</template>


		</section>
	</main>

	<!----------------------------------- フッター -->
	<footer id="footer">
		<div class="footer-text">
			<h3>― 誰もの人生、シネマティック。</h3>
			<br>
		</div>

		<div class="footer-profile">
			<ul>
				<li>
					<h2>クラシック映画館</h2>
				</li>
				<li>
					<h2>☎092-●●●-▲▲▲▲</h2>
				</li>
				<li>
					<h3>福岡県 福岡市 中央区 長浜〇丁目〇〇番</h3>
				</li>
			</ul>
		</div>
	</footer>
	<!----------------------------------- フッター -->

	<script>
            window.onload = function () {

                var today = new Date();

                for (var i = 0; i < 7; i++) {
                    var date = new Date(today);
                    date.setDate(today.getDate() + i);

                    var month = (date.getMonth() + 1).toString().padStart(2, '0');
                    var day = date.getDate().toString().padStart(2, '0');

                    document.getElementById('date' + (i + 1)).value = month + "月" + day + "日";
                }

                // ページロード時に今日の日付の映画情報を表示
                fetchData().then(data => {
                    displayData(data);
                });

                // 日付ボタンにクリックイベントを追加
                for (var i = 0; i < 7; i++) {
                    var dateButton = document.getElementById('date' + (i + 1));
                    dateButton.addEventListener('click', function (event) {
                        console.log('Button Clicked:', event.target.value);
                        var selectedDate = event.target.value;
                        fetchData(selectedDate).then(data => {
                            displayData(data);
                        });
                    });
                }
            };

            function fetchData(selectedDate = getCurrentDate()) {
                var url = '/cinema/DataInfo';
                if (selectedDate) {
                    url += '?date=' + encodeURIComponent(selectedDate);
                }

                return fetch(url, {
                    method: 'GET',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                })
                    .then(response => {
                        return response.json();
                    })
                    .catch(error => {
                        console.error('Error:', error);
                    });
            }
            function getCurrentDate() {
                var today = new Date();
                var month = (today.getMonth() + 1).toString().padStart(2, '0');
                var day = today.getDate().toString().padStart(2, '0');
                return month + "月" + day + "日";
            }

            // displayData関数は変更なし
            function displayData(data) {
                const template = document.getElementById('dataRowTemplate').content;
                const container = document.getElementById('screen');
                console.log('data', data);
                container.innerHTML = "";

                data.movies.forEach(item => {
                    const clone = document.importNode(template, true);
                    clone.querySelector('.screenId').textContent = item.screenId;
                    clone.querySelector('.title').textContent = item.title;
                    clone.querySelector('.description').textContent = item.description;
                    clone.querySelector('.imgpath').src = item.imgpath;
                    clone.querySelector('.moviepath').src = item.moviepath;
                    clone.querySelector('.time1').textContent = item.time1;
                    clone.querySelector('.time2').textContent = item.time2;
                    clone.querySelector('.time3').textContent = item.time3;
                    clone.querySelector('.time4').textContent = item.time4;
                    clone.querySelector('.time5').textContent = item.time5;
                    clone.querySelector('.time6').textContent = item.time6;
                    container.appendChild(clone);
                });
            }
        </script>

</body>

</html>