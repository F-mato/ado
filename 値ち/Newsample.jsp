<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<SCRIPT>
// Chart.jsモジュールを読み込む
import Chart from 'chart.js/auto';

// データベースのURL、ユーザー名、パスワードなどを指定してClientオブジェクトを作成する
const client = new Client({
  user: 'postgres',
  host: 'localhost:5432',
  database: 'mydb',
  password: 'admin',
  port: 5432,
});

// PostgreSQLに接続する
client.connect();

// SQL文を作成する
const sql = 'SELECT year, count FROM year_price_housing';

// SQL文を実行する
client.query(sql, (err, res) => {
  if (err) {
    console.error(err);
    return;
  }
  // 結果を配列に変換する
  const xValues = res.rows.map(row => row.year);
  const yValues = res.rows.map(row => row.count);

  // グラフを描画する
  new Chart(
    document.getElementById('myChart'),
    {
      type: 'bar',
      data: {
        labels: xValues,
        datasets: [
          {
            label: 'Acquisitions by year',
            data: yValues,
            backgroundColor: 'rgb(60, 186, 159)',
            borderColor: 'rgb(3, 102, 86)',
            borderWidth: 2,
          }
        ]
      },
      options: {
        scales: {
          y: {
            beginAtZero: true
          }
        }
      }
    }
  );

  // 接続を終了する
  client.end();
});
</SCRIPT>
</body>
</html>