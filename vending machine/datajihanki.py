import pandas as pd
import sqlite3
import os

# Excelファイルのパス
file_path = r"C:\Users\user\Desktop\自動販売機完成版.xlsm"

# Excelファイルからデータを読み込む（'商品ID'と'在庫'カラム）
df = pd.read_excel(file_path, sheet_name='sheet2', usecols="A,D")


# データを表示
print(df)# データ型を整数に変換する


# データフレームからNaNを削除する（エラー値があれば）
df = df.dropna()

# デスクトップへのパスを設定（Windows）
db_path = os.path.join('C:\\Users\\user\\Desktop', 'jidouhanbaiki.db')

# データベースに接続
conn = sqlite3.connect(db_path)

# 既存の在庫データをアップデートするSQLコマンドを準備
update_sql = 'UPDATE inventory SET 在庫 = ? WHERE 商品ID = ?'

try:
    # カーソルを生成
    cur = conn.cursor()
    
    # データフレームの各行でアップデートを行う
    for index, row in df.iterrows():
        # 商品IDが'合計'でないことを確認
        if row['商品ID'] != '合計':
            cur.execute(update_sql, (row['在庫'], row['商品ID']))
    
    # 変更をコミット
    conn.commit()
except Exception as e:
    print(f"データベースのアップデート中にエラーが発生しました: {e}")
finally:
    conn.close()  # 接続を閉じる



