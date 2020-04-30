<!-- DO NOT ERASE PERIOD PLS -->
<head>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
google.charts.load('current', {
  callback: drawDashboard,
  packages: ['corechart', 'controls']
});

function drawDashboard() {
  var jsonData = {
    "cols":[
      {"label":"Data", "type":"string"},
      {"label":"OP1", "type":"number"},
      {"label":"OP2", "type":"number"},
      {"label":"OP3", "type":"number"},
      {"label":"SFR(208-10)", "type":"number"}
    ],
    "rows":[
      {"c":[{"v":"2016-10-18"},{"v":1},{"v":0},{"v":1},{"v":0}]},
      {"c":[{"v":"2016-10-19"},{"v":1},{"v":0},{"v":1},{"v":0}]},
      {"c":[{"v":"2016-10-20"},{"v":1},{"v":0},{"v":1},{"v":0}]},
      {"c":[{"v":"2016-10-21"},{"v":1},{"v":0},{"v":1},{"v":0}]},
      {"c":[{"v":""},{"v":1},{"v":0},{"v":1},{"v":0}]}
    ]
  };

  var data = new google.visualization.DataTable(jsonData);
  var view = new google.visualization.DataView(data);
  view.setColumns([{
    calc: function (data, row) {
      return new Date(data.getValue(row, 0))
    },
    type: 'date',
    label: 'Data'
  }, 1, 2, 3, 4]);

  var dataRangeSlider = new google.visualization.ControlWrapper({
    controlType: 'DateRangeFilter',
    containerId: 'filter_div',
    options: {
      filterColumnLabel: 'Data'
    }
  });

  google.visualization.events.addListener(dataRangeSlider, 'ready', function () {
    var state = dataRangeSlider.getState();
    console.log(state.lowValue, state.highValue);
  });

  var lineChart = new google.visualization.ChartWrapper({
    chartType: 'LineChart',
    containerId: 'chart_div',
    options: {
      title: 'UL Success per operatore',
      width: 1200,
      height: 900,
      chartArea: {
        left: 80,
        top: 50,
        width: '70%',
        height: '80%'
      }
    }
  });

  var dashboard = new google.visualization.Dashboard(document.getElementById('dashboard_div'));
  dashboard.bind(dataRangeSlider, lineChart);
  dashboard.draw(view);
}
</script>
</head>
<body>
  <div id="dashboard_div">
  <div id="filter_div"></div>
  <div id="chart_div"></div>
</div>
</body>