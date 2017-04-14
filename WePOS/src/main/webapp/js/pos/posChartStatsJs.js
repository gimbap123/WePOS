/**
 * posChartStats.jsp의 자바스크립트
 */

function checkPosChartStats()
{
	if($("#chartType").val() == 0)
	{
		alert("차트를 선택하세요.");
		return false;
	}
	else if($("#startMonth").val() == 0)
	{
		alert("시작일을 선택하세요.");
		return false;
	}
	else if($("#endMonth").val() == 0)
	{
		alert("종료일을 선택하세요.");
		return false;
	}
	
	document.chartStatsOption.submit();	
}

function chartTypeSelect(jsonChartData)
{
	
	var chartTitle = $("#chartTitle").val();
	
	if($("#chartType").val() == 0)
	{
		$("#chartDiv").html('<h1>차트를 검색하세요.</h1>');
	}
	else if($("#chartType").val() == 1 || $("#chartType").val() == 2)
	{
		$("#chartDiv").html('<div class="box box-success"><div class="box-header with-border">' 
				+ '<h3 class="box-title">' + chartTitle + '</h3></div><div class="box-body"> <div class="chart">' 
				+ '<canvas id="barChart" style="height:300px"></div></canvas></div></div>');
		barChartStats(jsonChartData);
	}
}

function barChartStats(jsonChartData)
{
	if(jsonChartData == null)
	{
		return false;
	}
	//-------------
    //- BAR CHART -
    //-------------
    var barChartCanvas = $("#barChart").get(0).getContext("2d");
    var barChart = new Chart(barChartCanvas);
    var barChartData = jsonChartData;
    barChartData.datasets[0].fillColor = "#00a65a";
    barChartData.datasets[0].strokeColor = "#00a65a";
    barChartData.datasets[0].pointColor = "#00a65a";
    var barChartOptions = {
      //Boolean - Whether the scale should start at zero, or an order of magnitude down from the lowest value
      scaleBeginAtZero: true,
      //Boolean - Whether grid lines are shown across the chart
      scaleShowGridLines: true,
      //String - Colour of the grid lines
      scaleGridLineColor: "rgba(0,0,0,.05)",
      //Number - Width of the grid lines
      scaleGridLineWidth: 1,
      //Boolean - Whether to show horizontal lines (except X axis)
      scaleShowHorizontalLines: true,
      //Boolean - Whether to show vertical lines (except Y axis)
      scaleShowVerticalLines: true,
      //Boolean - If there is a stroke on each bar
      barShowStroke: true,
      //Number - Pixel width of the bar stroke
      barStrokeWidth: 2,
      //Number - Spacing between each of the X value sets
      barValueSpacing: 5,
      //Number - Spacing between data sets within X values
      barDatasetSpacing: 1,
      //String - A legend template
      legendTemplate: "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<datasets.length; i++){%><li><span style=\"background-color:<%=datasets[i].fillColor%>\"></span><%if(datasets[i].label){%><%=datasets[i].label%><%}%></li><%}%></ul>", 
      //Boolean - whether to make the chart responsive
      responsive: true,
      maintainAspectRatio: true
    };

    barChartOptions.datasetFill = false;
    barChart.Bar(barChartData, barChartOptions);
}

