document.addEventListener('DOMContentLoaded', function () {
    // フォームの送信時にローディングメッセージを表示
    document.querySelector('form').addEventListener('submit', function () {
        document.getElementById('loading-message').style.display = 'block';
    });

    // 天気情報が表示されたらローディングメッセージを非表示にする
    if (document.querySelector('weather-info')) {
        document.getElementById('loading-message').style.display = 'none';
    }

    // Leafletを使用して地図を初期化
    var map = L.map('map').setView([35.6895, 139.6917], 13); // デフォルトの位置（東京）を指定
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
    }).addTo(map);

    // 都市を選択したときに地図の位置を更新する
    document.getElementById('city').addEventListener('change', function () {
        var selectedCity = this.value;
        // 選択された都市の位置情報を取得するAjaxリクエスト
        fetch('/get_location', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ city: selectedCity }),
        })
        .then(response => response.json())
        .then(data => {
            // 都市の位置情報が取得できたら地図の位置を更新する
            var latitude = data.latitude;
            var longitude = data.longitude;
            map.setView([latitude, longitude], 13);
            L.marker([latitude, longitude]).addTo(map)
                .bindPopup(selectedCity)
                .openPopup();
        });
    });
});