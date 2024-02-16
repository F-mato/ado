from flask import Flask, render_template
import sqlite3

app = Flask(__name__)

@app.route('/')
def show_data():
    # データベース接続
    conn = sqlite3.connect('sample.db')
    cursor = conn.cursor()

    # SQLクエリを実行
    query = "SELECT * FROM sample"
    cursor.execute(query)
    data = cursor.fetchall()

    # データベース接続を閉じる
    cursor.close()
    conn.close()

    # データをHTMLテンプレートに渡す
    return render_template('data.html', data=data)

if __name__ == '__main__':
    app.run(debug=True)
