import webbrowser
from flask import Flask, render_template, request, g
import requests
import json
import sqlite3
import os
import sys

app = Flask(__name__)


# OpenWeatherMap APIキー
api_key = 'e9b7c51ac28e841172549eb0a3900501'

# プログラムファイルのディレクトリパスを取得
current_dir = os.path.dirname(__file__)

# SQLiteデータベースのファイル名（相対パス）
db_name = os.path.join(current_dir, 'weather.db')
#db_name = 'C:\\Users\\7d23\\Desktop\\Python最終課題\\weather.db'

def get_db_path():
    # 実行中のスクリプトまたはexeファイルの場所を取得する
    if getattr(sys, 'frozen', False):
        # exeファイルから実行されている場合
        return os.path.join(os.path.dirname(sys.executable), 'weather.db')
    else:
        # スクリプトが直接実行されている場合
        return os.path.join(os.path.dirname(__file__), 'weather.db')

# データベースへの接続
def get_db():
    db_path = get_db_path()
    if 'db' not in g:
        g.db = sqlite3.connect(db_path)
    return g.db

# データベースから都市一覧を取得
def get_cities():
    db = get_db()
    cursor = db.cursor()
    cursor.execute('SELECT DISTINCT city FROM weather_data')
    cities = [row[0] for row in cursor.fetchall()]
    return cities

@app.route('/', methods=['GET', 'POST'])
def index():
    city = None
    weather_data = None
    cities = get_cities()

    if request.method == 'POST':
        city = request.form['city']
        weather_data = get_weather_data(city)
        save_city_to_database(city)

    return render_template('index_weather_db.html', city=city, weather_data=weather_data, cities=cities)

def get_weather_data(city):
    base_url = 'http://api.openweathermap.org/data/2.5/forecast'
    params = {
        'q': city,
        'appid': api_key,
        'units': 'metric'
    }

    response = requests.get(base_url, params=params)
    data = json.loads(response.text)

    if response.status_code == 200:
        # 最初のデータを取得（5日間の予報データは3時間ごとに提供される）
        today_info = {
            'temperature': data['list'][0]['main']['temp'],
            'description': data['list'][0]['weather'][0]['description'],
            'icon': data['list'][0]['weather'][0]['icon']
        }

        # 5日間の予報データを取得
        forecast_info = []
        for forecast in data['list'][1::8]:  # 1日ごとに1つのデータを取得
            forecast_data = {
                'date': forecast['dt_txt'],
                'temperature': forecast['main']['temp'],
                'description': forecast['weather'][0]['description'],
                'icon': forecast['weather'][0]['icon']
            }
            forecast_info.append(forecast_data)

        return {'today': today_info, 'forecast': forecast_info}
    else:
        return None

def save_city_to_database(city):
    db = get_db()
    cursor = db.cursor()
    cursor.execute('INSERT INTO weather_data (city, latitude, longitude) VALUES (?, 0.0, 0.0)', (city,))
    db.commit()

if __name__ == '__main__':
    app.run(debug=True)

    
# from flask import jsonify

# @app.route('/get_location', methods=['POST'])
# def get_location():
#     if request.method == 'POST':
#         try:
#             # リクエストから位置情報を取得
#             lat = request.json['latitude']
#             lon = request.json['longitude']

#             # 位置情報を返す
#             return jsonify({'latitude': lat, 'longitude': lon})
#         except KeyError:
#             return jsonify({'error': 'Invalid data'}), 400
        
from flask import jsonify

@app.route('/get_location', methods=['POST'])
def get_location():
    if request.method == 'POST':
        try:
            selected_city = request.json['city']
            # データベースから選択された都市の位置情報を取得
            db = get_db()
            cursor = db.cursor()
            cursor.execute('SELECT latitude, longitude FROM weather_data WHERE city = ?', (selected_city,))
            result = cursor.fetchone()
            if result:
                latitude, longitude = result
                return jsonify({'latitude': latitude, 'longitude': longitude})
            else:
                return jsonify({'error': 'City not found'}), 404
        except KeyError:
            return jsonify({'error': 'Invalid data'}), 400