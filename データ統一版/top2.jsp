<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>クラシック映画館 予約ページ</title>

    <!------------------------------------ リセットCSS リンク-->
    <link rel="stylesheet" href="https://unpkg.com/modern-css-reset/dist/reset.min.css" />
    <!------------------------------------ リセットCSS リンク-->

    <!------------------------------------ CSSファイル リンク-->
    <link rel="stylesheet" href="./css/style.css" />
    <!------------------------------------ CSSファイル リンク-->

    <!------------------------------------ javaScriptファイル リンク-->
    <script src="./js/main.js"></script>
    <!------------------------------------ javaScriptファイル リンク-->

    <!------------------------------------google fonts リンク-->
    <!---基本フォント-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=BIZ+UDGothic&family=IBM+Plex+Sans+JP:wght@400;500;600&family=Kaisei+Tokumin:wght@800&display=swap"
        rel="stylesheet">
    <!---基本フォント-->

    <!---上映中作品 映画タイトルのフォント-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@700&display=swap" rel="stylesheet">
    <!---上映中作品 映画タイトルのフォント-->
    <!------------------------------------google fonts リンク-->
</head>


<body>
    <!----------------------------------- ヘッダー -->
    <header id="introduction">

        <!----------------------------------- ロゴの部分 -->
        <div class="top-image">
            <img src="./pic/new-logo.gif" alt="クラシック映画館ロゴ">
        </div>
        <!----------------------------------- ロゴの部分 -->


        <!----------------------------------- 映画館名 -->
        <div class="theater">
            <h1>
                <p>クラシック映画館</p>
            </h1>
        </div>
        <!----------------------------------- 映画館名 -->


        <!----------------------------------- 映画館名右側の店舗情報 -->
        <div class="innertext">
            <h2>
                <p class="contact">お問い合わせはこちら<br><span class="phonenum">☎092-●●●-▲▲▲▲</span></p>
            </h2>
        </div>
        <!----------------------------------- 映画館名右側の店舗情報 -->


        <!----------------------------------- ログイン画面の領域 -->
        <div class="login">
            <div class="form">

                <div class="btn2">
                    <!----------------------------------- ログインボタン右本体(会員登録) -->
                    <br><br><br>
                    <span class="btn2">
                        <a href="/cinema/mypage.jsp" class="btn">welcome:${session_name}</a>
                    </span>
                    <!----------------------------------- ログインボタン右本体(会員登録) -->
                </div>
                <!----------------------------------- ログインボタン右 全体(会員登録) -->
            </div>
        </div>
        <!----------------------------------- ログイン画面の領域 -->
    </header>
    <!----------------------------------- ヘッダー -->

    <!----------------------------------- ナビメニュー -->
    <!-- GitHubにある『A班とのまとめ』ファイルの文言に、ナビメニューに何を設定するのか明記なかったので、項目についてはこちらで仮に入れています -->

    <nav id="filmnav">
            <div class="nav-brank1"></div>

            <div class="nav1">
                <span><a href="#">新作情報</a></span>

            </div>

            <div class="nav2">
              <span><a href="#">上映中の作品</a></span>
            </div>

            <div class="nav3">
                <span><a href="#">予約</a></span>

            </div>

            <div class="nav4">
               <span><a href="#">当館について</a></span>
            </div>

            <div class="nav-brank2"></div>
    </nav>
    <!----------------------------------- ナビメニュー -->

    <main id="contents">
        <!----------------------------------- 新作情報の領域 -->
        <section class="new">
            <!----------------------------------- 文字の領域 -->
            <div class="new-inner-top">
                <h2>新　作　情　報</h2>
            </div>
            <!----------------------------------- 文字の領域 -->


            <!----------------------------------- 動画の領域 -->
            <!--共有用に動画ファイルは抜いています。あとでWeb動画データにしまーす……-->
            <div class="new-movie">
                <img src="./pic/screen.jpg" alt="スクリーンの画像">
                <video controls src="./pic/Black and White Old Movie Silent Film Cinema Projector Video.mp4"
                    alt="新作1" autoplay muted playsinline loop></video>
            </div>
            <!----------------------------------- 動画の領域 -->
        </section>
        <!----------------------------------- 新作情報の領域 -->

        <!----------------------------------- 上映中作品の領域 -->
        <section id="showing-now">
            <div class="showing-now-top">
                <h2>上 映 中 の 作 品</h2>
            </div>

            <div class="schedule">
                <div class="s-btn-1st">
                    <script>
                        today();
                        // 本日の日付取得
                    </script>
                </div>

                <div class="s-btn">
                    2個目
                    <script>
                        // 以降、ボタン全部に日付を増やしていくスクリプトを入力したい(未実装) 
                    </script>
                </div>

                <div class="s-btn">
                    3
                </div>

                <div class="s-btn">
                    4個目
                </div>

                <div class="s-btn">
                    5個目
                </div>

                <div class="s-btn">
                    6個目
                </div>

                <div class="s-btn">
                    7個目
                </div>
            </div>

            <div class="screen1">
                <div class="movie-profile1">
                    <div class="screen-num">
                        スクリーン　<span>1</span>
                    </div>

                    <div class="movie-title1">
                        <!--  ↓ 仮でテキトーなタイトル入れてますので、取得リンクできたら消してください -->
                        キャプテン・キューシュー
                        <!-- ここに作品タイトルを取得リンクを記入してください -->
                    </div>

                    <div class="movie-image1">
                        画像がここにきます
                        <!-- ここに画像データ取得リンクを記入してください -->
                    </div>
                </div>
            </div>

            <div class="screen2">
                <div class="movie-profile2">
                    <div class="screen-num">
                        スクリーン　<span>2</span>
                    </div>

                    <div class="movie-title2">
                        <!--  ↓ 仮でテキトーなタイトル入れてますので、取得リンクできたら消してください -->
                        スライダーマン3
                        <!-- ここに作品タイトルを取得リンクを記入してください -->
                    </div>

                    <div class="movie-image2">
                        画像がここにきます
                        <!-- ここに画像データ取得リンクを記入してください -->
                    </div>
                </div>
            </div>

            <div class="screen3">
                <div class="movie-profile3">
                    <div class="screen-num">
                        スクリーン　<span>3</span>
                    </div>

                    <div class="movie-title3">
                        <!--  ↓ 仮でテキトーなタイトル入れてますので、取得リンクできたら消してください -->
                        アイロンマン
                        <!-- ここに作品タイトルを取得リンクを記入してください -->
                    </div>

                    <div class="movie-image3">
                        画像がここにきます
                        <!-- ここに画像データ取得リンクを記入してください -->
                    </div>
                </div>
            </div>

        </section>
    </main>

    <!----------------------------------- フッター -->
    <footer id="footer">
        <div class="footer-text">
            <h3>― 誰もの人生、シネマティック。</h3><br>
        </div>

        <div class="footer-profile">
            <ul>
                <li>
                    <h2>クラシック映画館</h2>
                </li>
                <li>
                    <h2>☎092-●●●-▲▲▲▲</h2>
                </li>
                <li>
                    <h3>福岡県 福岡市 中央区 長浜〇丁目〇〇番</h3>
                </li>
            </ul>
        </div>
    </footer>
    <!----------------------------------- フッター -->
</body>

</html>