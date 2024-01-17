<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Dynamic Options</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
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
								value : timeOption.id,
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
</script>
</head>
<body>

	<label for="titleSelect">タイトル選択:</label>
	<select id="titleSelect">
		<!-- Optionsサーブレットから取得したタイトルの選択肢はここに挿入 -->
		<%-- タイトルの選択肢は初回ロード時にJavaScriptで取得されここに挿入される --%>
	</select>

	<br>

	<label for="timeSelect">時間選択:</label>
	<select id="timeSelect">
		<option value="" selected disabled>タイトルを選択してください</option>
		<!-- Optionsサーブレットから取得した時間の選択肢はここに挿入 -->
	</select>

</body>
</html>