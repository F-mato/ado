import sys
from cx_Freeze import setup, Executable

from cx_Freeze import setup, Executable
import os
import shutil

# ビルドディレクトリの削除
if os.path.exists("build"):
    shutil.rmtree("build")

# データベースファイルをコピーする
if os.path.exists("weather.db"):
    shutil.copy("weather.db", "build")
    
base = None
if sys.platform == "win32":
    base = "Win32GUI"  # GUIアプリケーションの場合は"Win32GUI"を使用

setup(
    name="YourAppName",  # アプリケーションの名前
    version="1.0",
    description="Description of your app",  # アプリケーションの説明
    executables=[Executable("app.py")],
    options={
        "build_exe": {
            "includes": ["click"]
        }
    }
)