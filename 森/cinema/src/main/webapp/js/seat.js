$(document).ready(function() {
	// 選択が変更されたときのイベントハンドラ
	$('#titleSelect, #start, #timeSelect').change(function() {
		// 選択された各オプションの値を取得
		var selectedTitleId = $('#titleSelect').val();
		var selectedDate = $('#start').val();
		var selectedTime = $('#timeSelect').val();

		// サーバーに選択された値を送信
		$.ajax({
			type: 'POST',
			url: '/cinema/ReservationServlet', // あなたのサーブレットのURLに置き換えてください
			data: {
				titleId: selectedTitleId,
				date: selectedDate,
				time: selectedTime
			},
			success: function(data) {
				console.log(data);
				try {
					//var reservedSeatArray = JSON.parse(reservedSeats);
					//var reservedSeatArray = jsonData.reservedSeats;
					var reservedSeatArray = data.reservedSeats;
					// 予約済みの座席を取得
					// var reservedSeatArray = reservedSeats.split(',');

					// すべての座席を有効にする
					$(".seats").prop("disabled", false);

					// 予約済みの座席にdisabled属性を追加し、色を変更
					$.each(reservedSeatArray, function(index, reservedSeat) {
						var seatToggle = $("#toggle" + reservedSeat);
						seatToggle.prop("disabled", true);

						// 対応するラベルの背景色を変更
						var labelForSeat = $('label[for="toggle' + reservedSeat + '"]');
						if (labelForSeat.length) {
							labelForSeat.addClass("reserved-seat-label");
						}
					});
				} catch (error) {
					console.error('Error handling data:', error);
				}
			},
			error: function(jqXHR, textStatus, errorThrown) {
				console.error('Error:', textStatus, errorThrown);
			}
			
		});
	});
});

$(document).ready(function() {
    // リセットボタンがクリックされたときの処理
    $('#resetButton').click(function() {
        // すべての座席のスタイルをリセット
        $(".seats").each(function() {
            var seatToggle = $(this);
            seatToggle.prop("disabled", false);

            // 対応するラベルのスタイルをリセット
            var labelForSeat = $('label[for="' + seatToggle.attr('id') + '"]');
            if (labelForSeat.length) {
                labelForSeat.removeClass("reserved-seat-label");
            }
        });
    });
});