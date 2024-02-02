# -*- coding: utf-8 -*-
import sqlite3
import os

# ユーザー名をここに設定
user_name = 'user'

# デスクトップへのパス（Windows）
db_path = os.path.join(f'C:\\Users\\user\\Desktop', 'jidouhanbaiki.db')

# データベースに接続（データベースが存在しない場合は新規作成される）
conn = sqlite3.connect(db_path)
cursor = conn.cursor()

# 'inventory' テーブルを作成するためのSQLステートメント
# '商品ID' は整数の主キー、'在庫' は整数として在庫数を保持
create_table_query = """
CREATE TABLE IF NOT EXISTS inventory (
    商品ID INTEGER PRIMARY KEY,
    在庫 INTEGER NOT NULL
);
"""

# テーブル作成のSQLステートメントを実行
cursor.execute(create_table_query)

# 変更をコミット
conn.commit()

# 接続を閉じる
conn.close()

import pandas as pd
import sqlite3

# ファイルパス（Windowsのユーザーデスクトップパスを例としています。適宜修正してください。）
file_path = r"C:\Users\user\Desktop\自動販売機完成版2 - コピー - コピー.xlsm"

# Excelファイルから'sheet2'のD列のデータを読み込む
df = pd.read_excel(file_path, sheet_name='sheet2', usecols="A,D")

# データを表示
print(df)



# SQLiteデータベースに接続する（データベースがない場合は新規作成される）
conn = sqlite3.connect('jidouhanbaiki.db')

# データフレームをSQLiteデータベースに保存する（'inventory'は新しいテーブル名）
df.to_sql('inventory', conn, if_exists='replace', index=False)

# 接続を閉じる
conn.close()

