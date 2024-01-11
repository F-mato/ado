<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="./css/chart.css" />
<script src="./js/chart.js" type="text/javascript"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js" integrity="sha256-R4pqcOYV8lt7snxMQO/HSbVCFRPMdrhAFMH+vr9giYI=" crossorigin="anonymous"></script>
<title>月間チャート</title>
</head>
<header>
<h1>月間チャート</h1>
</header>
<body>
       <div class="button">
        <button onclick="location.href='./monthlychart.jsp'">月別</button>
		<button onclick="location.href='./weekchart.jsp'">週別</button>
		<button onclick="location.href='./chart.jsp'">本日</button>
 <h1>作品別</h1>
    <div class="chart1">
    	<div style="width: 600px;">
        	<canvas id="chart" width="600" height="300"></canvas>
        </div>
    </div>
    
<h1>年代・性別</h1>
<div class="chart2">
	<div style="width: 300px;">
    	<canvas id="chart_nen" width="150" height="150"></canvas>
</div>

 <div class="chart3">
      <div style="width: 300px;">
           <canvas id="chart_jender" width="150" height="150"></canvas>
        </div>
</div>
        
        
        <SCRIPT>

        var ctx = $('#chart');
        var mychart = new Chart(ctx, {
            type: 'bar',
            data: {
            	labels: [
                    '1月度',
                    '2月度',
                    '3月度',
                    '4月度',
                    '6月度',
                    '7月度',
                    '8月度',
                    '9月度',
                    '10月度',
                    '11月度',
                    '12月度'
                ],
                datasets: [{
                    label: '10代',
                    data: [
                        1000,400,200,1000,200
                    ],
                    backgroundColor: 'rgba(241, 107, 141, 1)',  //棒グラフの色
                },{
                    label: '20代',
                    data: [
                        300,100,500,50,50
                    ],
                    backgroundColor: 'rgba( 31, 167, 165, 1)',  //棒グラフの色
                },{
                    label: '30代',
                    data: [
                        400,50,100,1500,300
                    ],
                    backgroundColor: 'rgba(249, 199,  83, 1)',  //棒グラフの色
                },{
                    label: '40代',
                    data: [
                        400,500,100,1200,300
                    ],
                    backgroundColor: 'rgba(176, 110,  30, 1)',
                },{
                    label: '50代',
                    data: [
                        400,50,100,1800,300
                    ],
                    backgroundColor: 'rgba(124,  91, 164, 1)',
                }]
            },

            options: {

                //区分わけのコメント
                title: {
                    display: true,
                    text: '上映中の映画（年代別）'
                },

                //棒グラフの文字の調整
                scales: {
                    yAxes: [{
                        ticks: {
                            suggestedMax: 20000,
                            suggestedMin: 0,
                            stepSize: 1000,
                            callback: function (value, index, values) {
                                return value + '円';
                            }
                        },
                    }]
                }
            }
        });

            //ここからデータを取得を追加した
            //async function drawChartFromAPI() {
            //const response = await fetch('https://api.example.com/data');
            //const data = await response.json();

            //const ctx = document.getElementById('chart_en').getContext('2d');




            var ctx = $('#chart_nen');
            var mychart = new Chart(ctx, {
                type: 'pie',
                data: {
                    labels: [//data.labels,
                        '10代',
                        '20代',
                        '30代',
                        '40代',
                        '50代'
                    ],
                    datasets: [{
                        label: 'サンプルグラフ',
                        data: [
                            10,
                            30,
                            30,
                            10,
                            20
                        ],

                        //円グラフの色
                        backgroundColor: [
                            'rgba(241, 107, 141, 1)',
                            'rgba( 31, 167, 165, 1)',
                            'rgba(249, 199,  83, 1)',
                            'rgba(176, 110,  30, 1)',
                            'rgba(124,  91, 164, 1)'
                        ]
                    }]
                },
                options: {

                        //円グラフのコメント
                    title: {
                            display: true,
                            text: '来場者（年代別）'
                        },

                        //区分わけの位置
                    legend: {
                        position: 'bottom',
                    },
                    scales: {
                        yAxes: [{
                            ticks: {
                                display: false,
                                beginAtZero: true,
                            },
                            gridLines: {
                                display: false
                            }
                        }]
                    }
                }
            //}
            //)
            });

            //中央の文字
            Chart.pluginService.register({
            afterDraw: function(chart) {
                if (chart.config.type === 'pie') {
                    var width = chart.chart.width,
                        height = chart.chart.height,
                        ctx = chart.chart.ctx;

                    ctx.restore();
                    var fontSize = (height / 300).toFixed(2);
                    ctx.font = fontSize + "em sans-serif";
                    ctx.textBaseline = "middle";

                    var text = "中央のテキスト",
                        textX = Math.round((width - ctx.measureText(text).width) / 2),
                        textY = height / 4;

                    ctx.fillText(text, textX, textY);
                    ctx.save();
                }
            }
        });

               //ここからデータを取得を追加した
            //async function drawChartFromAPI() {
            //const response = await fetch('https://api.example.com/data');
            //const data = await response.json();

            //const ctx = document.getElementById('chart_en').getContext('2d');




            var ctx = $('#chart_jender');
            var mychart = new Chart(ctx, {
                type: 'pie',
                data: {
                    labels: [//data.labels,
                        '男性',
                        '女性'
                    ],
                    datasets: [{
                        label: 'サンプルグラフ',
                        data: [
                            10,
                            20
                        ],

                        //円グラフの色
                        backgroundColor: [
                            'rgba( 31, 167, 165, 1)',
                            'rgba(241, 107, 141, 1)'
                        ],
                    }]
                },
                options: {

                        //円グラフのコメント
                    title: {
                            display: true,
                            text: '来場者（性別別）'
                        },

                        //区分わけの位置
                    legend: {
                        position: 'bottom',
                    },
                    scales: {
                        yAxes: [{
                            ticks: {
                                display: false,
                                beginAtZero: true,
                            },
                            gridLines: {
                                display: false
                            }
                        }]
                    }
                }
            //}
            //)
            });

            //中央の文字
            Chart.pluginService.register({
            afterDraw: function(chart) {
                if (chart.config.type === 'pie') {
                    var width = chart.chart.width,
                        height = chart.chart.height,
                        ctx = chart.chart.ctx;

                    ctx.restore();
                    var fontSize = (height / 300).toFixed(2);
                    ctx.font = fontSize + "em sans-serif";
                    ctx.textBaseline = "middle";

                    var text = "中央のテキスト",
                        textX = Math.round((width - ctx.measureText(text).width) / 2),
                        textY = height / 4;

                    ctx.fillText(text, textX, textY);
                    ctx.save();
                }
            }
        });

        </SCRIPT>
</body>
</html>
