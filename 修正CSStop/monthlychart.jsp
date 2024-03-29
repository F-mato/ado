<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
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
<% List<String> monthgroup = (List<String>)request.getAttribute("momthgroup");
   List<String> agegroup = (List<String>)request.getAttribute("agegroup");
   List<String> gendergroup = (List<String>)request.getAttribute("gendergroup");
   List<String> monthgroup2 = (List<String>)request.getAttribute("momthgroup2");
   List<String> monthgroup3 = (List<String>)request.getAttribute("momthgroup3");
%>
<script type="text/javascript">
    // サーブレットにリクエストを投げる
    function execute() {
        location.href = "/dashboard2/week"
    }
</script>
<script type="text/javascript">
    // サーブレットにリクエストを投げる
    function executer() {
        location.href = "/dashboard2/birth"
    }
</script>
</head>
<header>
<h1>月間チャート</h1>
</header>
<body>
<div id="d2">&nbsp;</div>
       <div class="button">
<input type="button" value="月別" onclick="executer()">
<input type="button" value="週別" onclick="execute()">
		<%-- <button onclick="location.href='./chart.jsp'">本日</button> --%>
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

        setInterval(function() {
        	  document.getElementById("d2").innerHTML = new Date().toLocaleString();
        	}, 1000);

        var gendergroup = [<%
            for (int i = 0; i < gendergroup.size(); i++) {
                out.print("'" + gendergroup.get(i) + "'");
                if (i < gendergroup.size() - 1) {
                    out.print(",");
                }
            }
        %>];

        // JavaScriptで配列を表示
        console.log(gendergroup); 


        var agegroup = [<%
            for (int i = 0; i < agegroup.size(); i++) {
                out.print("'" + agegroup.get(i) + "'");
                if (i < agegroup.size() - 1) {
                    out.print(",");
                }
            }
        %>];

        // JavaScriptで配列を表示
        console.log(agegroup); 



        
        var monthgroup = [<%
            for (int i = 0; i < monthgroup.size(); i++) {
                out.print("'" + monthgroup.get(i) + "'");
                if (i < monthgroup.size() - 1) {
                    out.print(",");
                }
            }
        %>];

        // JavaScriptで配列を表示
        console.log(monthgroup); 




        var monthgroup2 = [<%
            for (int i = 0; i < monthgroup2.size(); i++) {
                out.print("'" + monthgroup2.get(i) + "'");
                if (i < monthgroup2.size() - 1) {
                    out.print(",");
                }
            }
        %>];

        // JavaScriptで配列を表示
        console.log(monthgroup2); 



        var monthgroup3 = [<%
            for (int i = 0; i < monthgroup3.size(); i++) {
                out.print("'" + monthgroup3.get(i) + "'");
                if (i < monthgroup3.size() - 1) {
                    out.print(",");
                }
            }
        %>];

        // JavaScriptで配列を表示
        console.log(monthgroup3); 



    	

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
                    label: 'CYBORG',
                    data: monthgroup,
                    backgroundColor: 'rgba(241, 107, 141, 1)',  //棒グラフの色
                },{
                    label: 'Look,people are like trash!',
                    data: monthgroup2,
                    backgroundColor: 'rgba( 31, 167, 165, 1)',  //棒グラフの色
                },{
                    label: '背面鬼',
                    data: monthgroup3,
                    backgroundColor: 'rgba(249, 199,  83, 1)',  //棒グラフの色

                }]
            },

            options: {

                //区分わけのコメント
                title: {
                    display: true,
                    text: '上映中の映画（人数別）'
                },

                //棒グラフの文字の調整
                scales: {
                    yAxes: [{
                        ticks: {
                            suggestedMax: 100000,
                            suggestedMin: 0,
                            stepSize: 10000,
                            callback: function (value, index, values) {
                                return value + '人';
                            }
                        },
                    }]
                }
            }
        });


            var ctx = $('#chart_nen');
            var mychart = new Chart(ctx, {
                type: 'pie',
                data: {
                    labels: [//data.labels,
                        '10代',
                        '20代',
                        '30代',
                        '40代',
                        '50代',
                        '60代'
                    ],
                    datasets: [{
                        label: 'サンプルグラフ',
                        data: agegroup,

                        //円グラフの色
                        backgroundColor: [
                            'rgba(241, 107, 141, 1)',
                            'rgba( 31, 167, 165, 1)',
                            'rgba(249, 199,  83, 1)',
                            'rgba(176, 110,  30, 1)',
                            'rgba(124,  91, 164, 1)',
                            'green'
                        ]
                    }]
                },
                options: {

                        //円グラフのコメント
                    title: {
                            display: true,
                            text: '来場者（年代別・年間）'
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

                    var text = "",
                        textX = Math.round((width - ctx.measureText(text).width) / 2),
                        textY = height / 4;

                    ctx.fillText(text, textX, textY);
                    ctx.save();
                }
            }
        });


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
                        data: gendergroup,

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
                            text: '来場者（性別・年間）'
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

                    var text = "",
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