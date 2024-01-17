<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>


<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="./css/seat.css" />
<script src="./js/jquery.js" type="text/javascript"></script>
<script src="./js/ticket.js" type="text/javascript"></script>
<script src="./js/seat.js" type="text/javascript"></script>

<style type="text/css">
.reserved-seat-label {
    background-color: blue !important;  /* 任意の背景色を指定 */
    /* 他のスタイルプロパティも必要に応じて追加 */
}
</style>
<title>予約入力画面</title>



<header>クラシック映画館</header>

<h1>予約情報</h1>
</head>

<body>

	<form class="form-horizon" method="post" action="/cinema/Reserve">
		<div>
			<div class="mb-3">
				<label for="titleSelect">タイトル選択:</label><br><br> 
				<select id="titleSelect" name="titleid">
					<!-- Optionsサーブレットから取得したタイトルの選択肢はここに挿入 -->
					<%-- タイトルの選択肢は初回ロード時にJavaScriptで取得されここに挿入される --%>
				</select> <br>
			</div>
			<div class="mb-3">
				<p>予約日を選択</p>
				<br> <input type="date" id="start" name="date"><br>
				<br>
			</div>

			<div class="mb-3">
				<label for="timeSelect">時間選択:</label> 
				<select id="timeSelect" name="time">
					<option value="" selected disabled>上映開始時間を選択してください</option>
					<!-- Optionsサーブレットから取得した時間の選択肢はここに挿入 -->
				</select>
			</div>
		</div>
		<br> <a>------------------------------------------------------------------------------------------------</a>
		<div class="container">

			<div class="row" id="seat">
				<input id="toggleS1" type="checkbox" class="seats" name="seats"
					value="S1"> <label for="toggleS1">S1</label> <input
					id="toggleS2" type="checkbox" class="seats" name="seats" value="S2">
				<label for="toggleS2">S2</label> <input id="toggleA3"
					type="checkbox" class="seats" name="seats" value="A3"> <label
					for="toggleA3">A3</label> <input id="toggleA4" type="checkbox"
					class="seats" name="seats" value="A4"> <label
					for="toggleA4">A4</label> <input id="toggleA5" type="checkbox"
					class="seats" name="seats" value="A5"> <label
					for="toggleA5">A5</label> <input id="toggleA6" type="checkbox"
					class="seats" name="seats" value="A6"> <label
					for="toggleA6">A6</label> <input id="toggleA7" type="checkbox"
					class="seats" name="seats" value="A7"> <label
					for="toggleA7">A7</label> <input id="toggleA8" type="checkbox"
					class="seats" name="seats" value="A8"> <label
					for="toggleA8">A8</label> <input id="toggleS3" type="checkbox"
					class="seats" name="seats" value="S3"> <label
					for="toggleS3">S3</label> <input id="toggleS4" type="checkbox"
					class="seats" name="seats" value="S4"> <label
					for="toggleS4">S4</label>
			</div>

			<div class="row" id="seat">
				<input id="toggleB1" type="checkbox" class="seats" name="seats"
					value="B1"> <label for="toggleB1">B1</label> <input
					id="toggleB2" type="checkbox" class="seats" name="seats" value="B2">
				<label for="toggleB2">B2</label> <input id="toggleB3"
					type="checkbox" class="seats" name="seats" value="B3"> <label
					for="toggleB3">B3</label> <input id="toggleB4" type="checkbox"
					class="seats" name="seats" value="B4"> <label
					for="toggleB4">B4</label> <input id="toggleB5" type="checkbox"
					class="seats" name="seats" value="B5"> <label
					for="toggleB5">B5</label> <input id="toggleB6" type="checkbox"
					class="seats" name="seats" value="B6"> <label
					for="toggleB6">B6</label> <input id="toggleB7" type="checkbox"
					class="seats" name="seats" value="B7"> <label
					for="toggleB7">B7</label> <input id="toggleB8" type="checkbox"
					class="seats" name="seats" value="B8"> <label
					for="toggleB8">B8</label> <input id="toggleB9" type="checkbox"
					class="seats" name="seats" value="B9"> <label
					for="toggleB9">B9</label> <input id="toggleB10" type="checkbox"
					class="seats" name="seats" value="B10"> <label
					for="toggleB10">B10</label>
			</div>

			<div class="row" id="seat">
				<input id="toggleC1" type="checkbox" class="seats" name="seats"
					value="C1"> <label for="toggleC1">C1</label> <input
					id="toggleC2" type="checkbox" class="seats" name="seats" value="C2">
				<label for="toggleC2">C2</label> <input id="toggleC3"
					type="checkbox" class="seats" name="seats" value="C3"> <label
					for="toggleC3">C3</label> <input id="toggleC4" type="checkbox"
					class="seats" name="seats" value="C4"> <label
					for="toggleC4">C4</label> <input id="toggleC5" type="checkbox"
					class="seats" name="seats" value="C5"> <label
					for="toggleC5">C5</label> <input id="toggleC6" type="checkbox"
					class="seats" name="seats" value="C6"> <label
					for="toggleC6">C6</label> <input id="toggleC7" type="checkbox"
					class="seats" name="seats" value="C7"> <label
					for="toggleC7">C7</label> <input id="toggleC8" type="checkbox"
					class="seats" name="seats" value="C8"> <label
					for="toggleC8">C8</label> <input id="toggleC9" type="checkbox"
					class="seats" name="seats" value="C9"> <label
					for="toggleC9">C9</label> <input id="toggleC10" type="checkbox"
					class="seats" name="seats" value="C10"> <label
					for="toggleC10">C10</label>
			</div>

			<div class="row" id="seat">
				<input id="toggleD1" type="checkbox" class="seats" name="seats"
					value="D1"> <label for="toggleD1">D1</label> <input
					id="toggleD2" type="checkbox" class="seats" name="seats" value="D2">
				<label for="toggleD2">D2</label> <input id="toggleD3"
					type="checkbox" class="seats" name="seats" value="D3"> <label
					for="toggleD3">D3</label> <input id="toggleD4" type="checkbox"
					class="seats" name="seats" value="D4"> <label
					for="toggleD4">D4</label> <input id="toggleD5" type="checkbox"
					class="seats" name="seats" value="D5"> <label
					for="toggleD5">D5</label> <input id="toggleD6" type="checkbox"
					class="seats" name="seats" value="D6"> <label
					for="toggleD6">D6</label> <input id="toggleD7" type="checkbox"
					class="seats" name="seats" value="D7"> <label
					for="toggleD7">D7</label> <input id="toggleD8" type="checkbox"
					class="seats" name="seats" value="D8"> <label
					for="toggleD8">D8</label> <input id="toggleD9" type="checkbox"
					class="seats" name="seats" value="D9"> <label
					for="toggleD9">D9</label> <input id="toggleD10" type="checkbox"
					class="seats" name="seats" value="D10"> <label
					for="toggleD10">D10</label>
			</div>

			<div class="row" id="seat">
				<input id="toggleE1" type="checkbox" class="seats" name="seats"
					value="E1"> <label for="toggleE1">E1</label> <input
					id="toggleE2" type="checkbox" class="seats" name="seats" value="E2">
				<label for="toggleE2">E2</label> <input id="toggleE3"
					type="checkbox" class="seats" name="seats" value="E3"> <label
					for="toggleE3">E3</label> <input id="toggleE4" type="checkbox"
					class="seats" name="seats" value="E4"> <label
					for="toggleE4">E4</label> <input id="toggleE5" type="checkbox"
					class="seats" name="seats" value="E5"> <label
					for="toggleE5">E5</label> <input id="toggleE6" type="checkbox"
					class="seats" name="seats" value="E6"> <label
					for="toggleE6">E6</label> <input id="toggleE7" type="checkbox"
					class="seats" name="seats" value="E7"> <label
					for="toggleE7">E7</label> <input id="toggleE8" type="checkbox"
					class="seats" name="seats" value="E8"> <label
					for="toggleE8">E8</label> <input id="toggleE9" type="checkbox"
					class="seats" name="seats" value="E9"> <label
					for="toggleE9">E9</label> <input id="toggleE10" type="checkbox"
					class="seats" name="seats" value="E10"> <label
					for="toggleE10">E10</label>
			</div>
		</div>
		<a>------------------------------------------------------------------------------------------------</a>
		<div id="wrapper">

			<section id="contents">
				<div class="">
					<p>【3】 ご希望の券種と数を選択してください。</p>

					<div class="form-box">
						<p class="buy_itemu_menu" data-price="2000">
							一般・車椅子 <span class="kakaku">(￥2,000)</span>
						</p>
						<select name="adult">
							<option data-num="0" value="0" selected>0枚</option>
							<option data-num="1" value="1">1枚</option>
							<option data-num="2" value="2">2枚</option>
							<option data-num="3" value="3">3枚</option>
						</select>
					</div>

					<div class="form-box">
						<p class="buy_itemu_menu" data-price="1800">
							シニア <span class="kakaku">(￥1,800)</span>
						</p>
						<select name="senior">
							<option data-num="0" value="0" selected>0枚</option>
							<option data-num="1" value="1">1枚</option>
							<option data-num="2" value="2">2枚</option>
							<option data-num="3" value="3">3枚</option>
						</select>
					</div>
					<div class="form-box">
						<p class="buy_itemu_menu" data-price="1500">
							4歳以上大学生まで <span class="kakaku">(￥1,500)</span>
						</p>
						<select name="kid">
							<option data-num="0" value="0" selected>0枚</option>
							<option data-num="1" value="1">1枚</option>
							<option data-num="2" value="2">2枚</option>
							<option data-num="3" value="3">3枚</option>
						</select>
					</div>

					<hr>

					<div class="form-box">
						<p>合計金額：</p>
						<input id="item_price_total" class="" name="total" value="" readonly>
					</div>

					<div class="mb-3">
						<p>【4】 備考欄</p>
						<textarea class="form-control" id="exampleFormControlTextarea1" name="freewrite" rows="3" placeholder="備考欄"></textarea>
					</div>

					<div class="submit-form">
						<button class="btn btn-primary rounded-pill" type="submit">予約確定</button>
						<button class="btn btn-secondary rounded-pill" id="resetButton" type="reset">リセット</button>
						<a href="/cinema/mypage.jsp"><button class="btn btn-primary rounded-pill" type="button">戻る</button></a>
					</div>
				</div>
				<!-- section -->
			</section>
			<!-- /entry-content -->
		</div>
		<!-- /#wrapper -->
	</form>


<script type="text/javascript">
	$(document).ready(function() {
		// 初回ロード時にタイトルの選択肢を取得
		loadTitles();

		// タイトル選択時の処理
		$("#titleSelect").change(function() {
			var selectedTitleId = $(this).val();

			// Optionsサーブレットに選択されたタイトルIDを送信してデータを取得
			$.ajax({
				type : "GET",
				url : "Options?selectedTitleId=" + selectedTitleId,
				success : function(data) {
					// 取得したデータを元に時間の選択肢を生成
					var timeSelect = $("#timeSelect");
					timeSelect.empty();
					if (data.length > 0) {
						// Loop through each time option in the data
						$.each(data, function(index, timeOption) {
							timeSelect.append($('<option>', {
								value : timeOption.value,
								text : timeOption.value
							}));
						});
					} else {
						// If no time options are available, provide a default message
						timeSelect.append($('<option>', {
							value : "",
							text : "選択可能な時間がありません"
						}));
					}
				},
				error : function(error) {
					console.log("Error fetching data: " + error);
				}
			});
		});
	});

	// タイトルの選択肢を取得する関数
	function loadTitles() {
		$.ajax({
			type : "GET",
			url : "Options", // タイトルを取得するためのサーブレットへのリクエスト
			success : function(data) {
				// 取得したデータを元にタイトルの選択肢を生成
				var titleSelect = $("#titleSelect");
				titleSelect.empty();
				titleSelect.append($('<option>', {
					value : "", // タイトルが選択されていない状態
					text : "タイトルを選択してください"
				}));
				$.each(data, function(index, title) {
					titleSelect.append($('<option>', {
						value : title.id,
						text : title.name
					}));
				});
			},
			error : function(error) {
				console.log("Error fetching data: " + error);
			}
		});
	}

	 function resetDisabled() {
	        $(".seats").prop("disabled", false);
	    }
</script>


</body>



</html>