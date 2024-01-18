<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/history.css" />

<title>Insert title here</title>

<script>
        window.onload = function() {
            fetchData();
        };

        function fetchData() {
            fetch('/cinema/History') // サーブレットのURLを指定
                .then(response => response.json()) // JSON形式でレスポンスを解析
                .then(data => {
                    displayData(data); // データを表示する関数に渡す
                })
                .catch(error => {
                    console.error('Error:', error);
                });
        }

        function displayData(data) {
            const template = document.getElementById('dataRowTemplate').content;
            const container = document.getElementById('dataContainer');
            container.innerHTML = "";

            data.reserveHistory.forEach(item => {
                const clone = document.importNode(template, true);
                clone.querySelector('.reserveId').textContent = item.reserveId;
                clone.querySelector('.title').textContent = item.title;
                clone.querySelector('.seat').textContent = item.seat;
                clone.querySelector('.date').textContent = item.date;
                clone.querySelector('.time').textContent = item.time;
                clone.querySelector('.total').textContent = item.total;
                clone.querySelector('.freewrite').textContent = item.freewrite;
            	const id = "" + item.reserveId;
                clone.querySelector('.deleteHistory').onclick = function(){
                    deleteHistory(id);
                    }
                container.appendChild(clone);
            });
        }

        function deleteHistory(deleteReserveId){
            console.log("deleteReserveId:" + deleteReserveId);
            fetch('/cinema/History?id=' + deleteReserveId, {
                method: 'DELETE'
            })
            .then(response => {
                if (response.ok) {
                    console.log('削除に成功しました');
                    // 削除成功時の処理
                    fetchDataAndDisplay(); 
                } else {
                    console.error('削除に失敗しました');
                    // 削除失敗時の処理
                }
            })
            .catch(error => {
                console.error('Error:', error);
            });
        }

        function fetchDataAndDisplay() {
            fetch('/cinema/History') // サーブレットのURLを指定
                .then(response => response.json()) // JSON形式でレスポンスを解析
                .then(data => {
                    displayData(data); // データを表示する関数に渡す
                })
                .catch(error => {
                    console.error('Error:', error);
                });
        }
            
    </script>
</head>
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
	<h2>予約履歴:</h2>
	<table border="1">
		<thead>
			<tr>
				<th>予約ID</th>
				<th>タイトル</th>
				<th>席番号</th>
				<th>予約日</th>
				<th>時間</th>
				<th>合計金額</th>
				<th>備考欄</th>
				<th></th>
			</tr>
		</thead>
		<tbody id="dataContainer">
			<!-- JavaScriptによってデータ行がここに挿入されます -->
		</tbody>
	</table>
	<!-- テンプレートの定義 -->
	<template id="dataRowTemplate">
		<tr>
			<td class="reserveId"></td>
			<td class="title"></td>
			<td class="seat"></td>
			<td class="date"></td>
			<td class="time"></td>
			<td class="total"></td>
			<td class="freewrite"></td>
			<td><button class="deleteHistory" type="button">キャンセル</button></td>
		</tr>
	</template>
	<a href="/cinema/mypage.jsp"><button class="mypage" type="button">マイページへ</button></a>
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