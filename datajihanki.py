import pandas as pd
import sqlite3
import os

# Excelファイルのパス
file_path = r"C:\Users\user\Desktop\自動販売機完成版2 - コピー - コピー.xlsm"

# Excelファイルからデータを読み込む（'商品ID'と'在庫'カラム）
df = pd.read_excel(file_path, sheet_name='sheet2', usecols="A,D")

# データを表示
print(df)


# デスクトップへのパスを設定（Windows）
db_path = os.path.join('C:\\Users\\user\\Desktop', 'jidouhanbaiki.db')

# データベースに接続
conn = sqlite3.connect(db_path)


# テーブルにデータを挿入する前に、DataFrameの列名をデータベースのカラム名と一致させる
df.columns = ['商品ID', '在庫']

try:
    # データフレームをSQLiteデータベースに保存する
    df.to_sql('inventory', conn, if_exists='append', index=False)
    conn.commit()  # 変更をコミット
except Exception as e:
    print(f"データの挿入中にエラーが発生しました: {e}")
finally:
    conn.close()  # 接続を閉じる


# 変更をコミット
#conn.commit()

# 接続を閉じる
conn.close()
