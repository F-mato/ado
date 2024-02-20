from flask import Flask, g, render_template, request, redirect, url_for, flash
import sqlite3
import matplotlib.pyplot as plt 
import japanize_matplotlib
from matplotlib.backends.backend_agg import FigureCanvasAgg as FigureCanvas
from matplotlib.figure import Figure
import io
import base64
from datetime import datetime
import pathlib
from matplotlib.dates import DateFormatter
import webbrowser

app = Flask(__name__)
app.secret_key = 'supersecretkey'  # Flaskのセッション用の秘密鍵

DATABASE = 'sleep_data.db'

# データベースに接続する関数
def get_db():
    # ｇをきちんと定義する
    db = getattr(g, '_database', None)
    if db is None:
        db = g._database = sqlite3.connect(DATABASE)
    return db

# アプリケーションコンテキストが終了したときにデータベース接続を閉じる
@app.teardown_appcontext
def close_connection(exception):
    # ｇをきちんと定義する
    db = getattr(g, '_database', None)
    if db is not None:
        db.close()

# DBの初期化関数
def init_db():
    # flaskのアプリケーションコンテキストを取得
    with app.app_context():
        # グローバルオブジェクト g を介して、アプリケーションコンテキスト内で1つのデータベース接続
        db = get_db()
        # カーソルオブジェクトを取得する
        cursor = db.cursor()

        # テーブルが存在しない場合は作成
        cursor.execute('''
            CREATE TABLE IF NOT EXISTS sleep_data (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                sleep_time INTEGER,
                wakeup_mood INTEGER,
                date DATE
            )
        ''')
        # 変更の確約
        db.commit()

# ルートURLへのリクエストがあったとき
@app.route('/')
def index():
    return render_template('index.html')

# submitで送られてきたとき
@app.route('/submit', methods=['POST'])
def submit():

    sleep_time = int(request.form['sleep_time'])
    wakeup_mood = int(request.form['wakeup_mood'])

    # データベースにデータを挿入
    db = get_db()
    cursor = db.cursor()
    cursor.execute('''
        INSERT INTO sleep_data (sleep_time, wakeup_mood, date)
        VALUES (?, ?, CURRENT_DATE)
    ''', (sleep_time, wakeup_mood))
    # 変更の確約
    db.commit()

    # 目標達成の条件を設定（例: 睡眠時間が7時間以上かつ起床時の気分が8以上）
    if sleep_time >= 7 and wakeup_mood >= 8:
        flash('おめでとうございます！良い睡眠がとれましたね。', 'success')

    return redirect(url_for('index'))

# graph() 関数内の SQL クエリを修正して、現在の月のデータを取得するようにします。
@app.route('/graph')
def graph():
    # 現在の月の睡眠時間データを取得
    db = get_db()
    cursor = db.cursor()
    cursor.execute('''
        SELECT date, sleep_time, wakeup_mood
        FROM sleep_data
        WHERE strftime('%Y-%m', date) = strftime('%Y-%m', CURRENT_DATE, 'localtime')
    ''')
    data = cursor.fetchall()

    if not data:
        flash('今月のデータがありません。', 'warning')
        return redirect(url_for('index'))

    # 日付、睡眠時間、起床時の気分のデータを取得
    dates = [row[0] for row in data]
    sleep_times = [row[1] for row in data]
    wakeup_moods = [row[2] for row in data]

    # 日付データをdatetimeオブジェクトに変換する
    dates = [datetime.strptime(date, '%Y-%m-%d') for date in dates]

    # 日付と睡眠時間のデータをソートする
    sorted_data = sorted(zip(dates, sleep_times, wakeup_moods), key=lambda x: x[0])
    sorted_dates, sorted_sleep_times, sorted_wakeup_moods = zip(*sorted_data)

    # Matplotlibを使用してサブプロットを作成するためのコード
    fig, axs = plt.subplots(2, figsize=(12, 10))

    # 睡眠時間のグラフ
    axs[0].plot(sorted_dates, sorted_sleep_times, marker='o', color='b')
    axs[0].set_xlabel('日付')
    axs[0].set_ylabel('睡眠時間 (時間)')
    axs[0].set_title('睡眠時間の推移')
    axs[0].xaxis.set_major_formatter(DateFormatter('%Y-%m-%d'))  # x軸の日付フォーマットを設定

    # 起床時の気分のグラフ
    axs[1].plot(sorted_dates, sorted_wakeup_moods, marker='o', color='r')
    axs[1].set_xlabel('日付')
    axs[1].set_ylabel('起床時の気分')
    axs[1].set_title('起床時の気分の推移')
    axs[1].xaxis.set_major_formatter(DateFormatter('%Y-%m-%d'))  # x軸の日付フォーマットを設定

    # グラフを画像に変換
    img = io.BytesIO()
    plt.savefig(img, format='png')
    img.seek(0)
    plot_url = base64.b64encode(img.getvalue()).decode()

    return render_template('graph.html', plot_url=plot_url)


# テストデータをDBに挿入
def insert_test_data():
    # Flaskのアプリケーションコンテキストをセット
    with app.app_context():
        db = get_db()
        try:
            cursor = db.cursor()
            # テストデータ
            test_data = [
                ('2024-02-01', 7, 8),
                ('2024-02-02', 6, 7),
                ('2024-02-03', 7, 9),
                ('2024-02-04', 6, 8),
                ('2024-02-05', 8, 9),
                ('2024-02-06', 7, 8),
                ('2024-02-07', 7, 9),
                
            ]
            # テストデータをループして挿入
            for date, sleep_time, wakeup_mood in test_data:
                cursor.execute('''
                    INSERT INTO sleep_data (date, sleep_time, wakeup_mood)
                    VALUES (?, ?, ?)
                ''', (date, sleep_time, wakeup_mood))
            db.commit()
        except Exception as e:
            db.rollback()
            raise e
        finally:
            if cursor:
                cursor.close()


# このコードが直接実行された場合の処理
if __name__ == '__main__':
    init_db()  # データベースの初期化
    insert_test_data()  # テストデータの挿入
    webbrowser.open("http://127.0.0.1:5000", new=0, autoraise=True)
    app.run()
    



