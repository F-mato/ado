
var ctx = $('#chart');
var mychart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: [
            '10代',
            '20代',
            '30代',
            '40代',
            '50代'
        ],
        datasets: [{
            label: '映画1',
            data: [
                1000,400,200,1000,200
            ],
            backgroundColor: 'rgba(241, 107, 141, 1)',  //棒グラフの色
        },{
            label: '映画2',
            data: [
                300,100,500,50,50
            ],
            backgroundColor: 'rgba( 31, 167, 165, 1)',  //棒グラフの色
        },{
            label: '映画3',
            data: [
                400,50,100,1500,300
            ],
            backgroundColor: 'rgba(249, 199,  83, 1)',  //棒グラフの色
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
                    suggestedMax: 2000,
                    suggestedMin: 0,
                    stepSize: 200,
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