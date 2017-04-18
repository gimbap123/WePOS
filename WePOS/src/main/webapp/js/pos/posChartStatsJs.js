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
	else if($("#start").val() == 0)
	{
		alert("시작일을 선택하세요.");
		return false;
	}
	else if($("#finish").val() == 0)
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
		$("#chartDiv").html('<h1 align="center">차트를 검색하세요.</h1>');
	}
	else
	{
		if(jsonChartData == null)
		{
			$("#chartDiv").html('<h1 align="center">조회한 기간에 해당하는 정보가 없습니다.</h1>');
		}
		else
		{
			if($("#chartType").val() == 1 || $("#chartType").val() == 2)
			{
				$("#chartDiv").html('<div class="box box-success"><div class="box-header with-border">' 
						+ '<h3 class="box-title">' + chartTitle + '</h3></div><div class="box-body"> <div class="chart">' 
						+ '<canvas id="barChart" style="height:300px"></canvas></div></div></div>');
				barChartStats(jsonChartData);
			}
			else if($("#chartType").val() == 3 || $("#chartType").val() == 4)
			{
				$("#chartDiv").html('<div class="box box-success"><div class="box-header with-border">'
						+  '<h3 class="box-title">' + chartTitle + '</h3></div><div class="box-body">'
						+ '<canvas id="pieChart" style="height:450px"></canvas></div></div>');
				pieChartStats(jsonChartData);
			}
		}
	}	
}

function barChartStats(jsonChartData)
{		
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

function pieChartStats(jsonChartData)
{
	var pieChartCanvas = $("#pieChart").get(0).getContext("2d");
    var pieChart = new Chart(pieChartCanvas);
    
    var pieOptions = {
      //Boolean - Whether we should show a stroke on each segment
      segmentShowStroke: true,
      //String - The colour of each segment stroke
      segmentStrokeColor: "#fff",
      //Number - The width of each segment stroke
      segmentStrokeWidth: 2,
      //Number - The percentage of the chart that we cut out of the middle
      percentageInnerCutout: 50, // This is 0 for Pie charts
      //Number - Amount of animation steps
      animationSteps: 100,
      //String - Animation easing effect
      animationEasing: "easeOutBounce",
      //Boolean - Whether we animate the rotation of the Doughnut
      animateRotate: true,
      //Boolean - Whether we animate scaling the Doughnut from the centre
      animateScale: false,
      //Boolean - whether to make the chart responsive to window resizing
      responsive: true,
      // Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
      maintainAspectRatio: true,
      //String - A legend template
      legendTemplate: "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<segments.length; i++){%><li><span style=\"background-color:<%=segments[i].fillColor%>\"></span><%if(segments[i].label){%><%=segments[i].label%><%}%></li><%}%></ul>"
    };
    //Create pie or douhnut chart
    // You can switch between pie and douhnut using the method below.
    
    pieChart.Doughnut(jsonChartData, pieOptions);
}

function resetChartStatsOption()
{
	$("#start").val(null);
	$("#finish").val(null);
	$("#chartType").val("0");
}


