import sqlite3

# データベースに接続（存在しない場合は新しく作成）
conn = sqlite3.connect('views.db')

# カーソルを作成
cursor = conn.cursor()

# 閲覧数を記録するためのテーブルを作成
cursor.execute('''
CREATE TABLE IF NOT EXISTS page_views (
    id INTEGER PRIMARY KEY,
    count INTEGER NOT NULL DEFAULT 0
)
''')

# 初期データの挿入（既に存在する場合は無視）
cursor.execute('''
INSERT OR IGNORE INTO page_views (id, count) VALUES (1, 0)
''')

# 変更をコミットして接続を閉じる
conn.commit()
conn.close()

from flask import Flask, jsonify

app = Flask(__name__)

def update_view_count():
    conn = sqlite3.connect('views.db')
    cursor = conn.cursor()

    # 閲覧数を更新
    cursor.execute('UPDATE page_views SET count = count + 1 WHERE id = 1')

    # 最新の閲覧数を取得
    cursor.execute('SELECT count FROM page_views WHERE id = 1')
    count = cursor.fetchone()[0]

    conn.commit()
    conn.close()

    return count

@app.route('/')
def index():
    count = update_view_count()
    return jsonify({'view_count': count})

if __name__ == '__main__':
    app.run(debug=True)
