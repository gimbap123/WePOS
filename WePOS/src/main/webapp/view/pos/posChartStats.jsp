<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet"	href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<link rel="stylesheet"	href="../assets/plugins/scrollbar/css/jquery.mCustomScrollbar.css">

<!-- Favicon -->
<link rel="shortcut icon" href="favicon.ico">

<!-- Web Fonts -->
<link rel="stylesheet"	href="//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin">

<!-- CSS Global Compulsory -->
<link rel="stylesheet" href="../assets/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="../assets/css/style.css">

<!-- CSS Header and Footer -->
<link rel="stylesheet"	href="../assets/css/headers/header-v7.css">
<link rel="stylesheet"	href="../assets/css/footers/footer-v1.css">

<!-- CSS Implementing Plugins -->
<link rel="stylesheet" href="../assets/plugins/animate.css">
<link rel="stylesheet" href="../assets/plugins/line-icons/line-icons.css">
<link rel="stylesheet" href="../assets/plugins/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="../assets/plugins/scrollbar/css/jquery.mCustomScrollbar.css">

<!-- CSS Page Style -->
<link rel="stylesheet" href="../assets/css/pages/page_log_reg_v2.css">

<!-- CSS Customization -->
<link rel="stylesheet"	href="../assets/css/custom.css">

<!-- 차트 관련 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<link rel="stylesheet" href="../assets/chart/AdminLTE.min.css">
<link rel="stylesheet" href="../assets/chart/_all-skins.min.css">

<script language="JavaScript" src="../js/pos/posChartStatsJs.js"></script>

<title>WePOS</title>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="../pos/leftBar.jsp" flush="false" />
				
		<div class="content-side-right">
			<div class="content" style="padding: 0px 20px; margin-right: 270px;">							
				<div class="breadcrumbs-v3 img-v1" style="background: url(../image/common/posLog.jpg); 	background-size: cover; background-position: center center;height: 30px">
					<div class="container text-center" style="width: 100%">
						<h1>차트 통계</h1>
					</div>					
				</div>						
			<section class="content" style="padding-top: 0px;">
				
				<div class="col-md-12">
					<div class="box box-success">
						<div class="box-header with-border">
							<h3 class="box-title">Bar Chart</h3>							
						</div>
						<div class="box-body">
							<div class="chart">
				            	<canvas id="barChart" style="height:230px"></canvas>
				            </div>
						</div>						
					</div>
				</div>
				
			</section>				
			</div>
		</div>
		
		<div class="pos-right" style="margin-top:62px">
			<div class="pos-status">
				<div class="panel panel-success">					
					<div class="panel-heading" align="center" style="background:#5cb85c">
						<h2 style="color:white">검색 조건 설정</h2>
					</div>			
					<form name="chartStatsOption" action="posChartStats.do" method="post">
						<input type="hidden" name="shopCode" value="${sessionScope.shopCode}">
						<div class="content" style="padding: 0">							
							<div class="input-group margin-bottom-10">								
								<span class="input-group-addon">차트</span>
								<select class="form-control" id="chartType" name="chartType">
									<option value="0">선택</option>
									<option value="1">월별 매출</option>
								</select>				
							</div>						
							<div class="input-group margin-bottom-10">									
								<span class="input-group-addon">월별</span>																						
								<section>
									<input type="text" class="form-control" name="start" id="start" placeholder="클릭하여 시작일을 선택">                                   
                                </section>													
								<section>                                                              
                                	<input type="text"  class="form-control" name="finish" id="finish" placeholder="클릭하여 종료일을 선택">                                                              
                                </section>                                                            						
							</div>
							<div class="input-group" style="width: 100%">
								<button type="button" class="btn btn-lg btn-primary" style="width: 50%;" onclick="checkPosChartStats()">조회</button>
								<button type="reset" class="btn btn-lg btn-danger" style="width: 50%;" >초기화</button>
							</div>				
						</div>
					</form>		
				</div>				
			</div>			
		</div>	
	</div>
	
<!-- JS Global Compulsory -->           
<script type="text/javascript" src="../assets/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript" src="../assets/plugins/jquery/jquery-migrate.min.js"></script>
<script type="text/javascript" src="../assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- JS Implementing Plugins -->
<script type="text/javascript" src="../assets/plugins/back-to-top.js"></script>
<script type="text/javascript" src="../assets/plugins/jquery-appear.js"></script>
<script type="text/javascript" src="../assets/plugins/smoothScroll.js"></script>
<script type="text/javascript" src="../assets/plugins/scrollbar/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="../assets/plugins/sky-forms-pro/skyforms/js/jquery-ui.min.js"></script>
<!-- JS Page Level -->
<script type="text/javascript" src="../assets/js/app.js"></script>
<script type="text/javascript" src="../assets/js/plugins/datepicker.js?v=1"></script>

<!-- 차트 관련 -->
<script src="../assets/chart/Chart.min.js"></script>


<script type="text/javascript">
	jQuery(document).ready(function() {
		App.init();
		Datepicker.initDatepicker();
		
		
		var areaChartData = {
			      labels: ["January", "February", "March", "April", "May", "June", "July"],
			      datasets: [
			        {
			          label: "Electronics",
			          fillColor: "rgba(210, 214, 222, 1)",
			          strokeColor: "rgba(210, 214, 222, 1)",
			          pointColor: "rgba(210, 214, 222, 1)",
			          pointStrokeColor: "#c1c7d1",
			          pointHighlightFill: "#fff",
			          pointHighlightStroke: "rgba(220,220,220,1)",
			          data: [65, 59, 80, 81, 56, 55, 40]
			        },
			        {
			          label: "Digital Goods",
			          fillColor: "rgba(60,141,188,0.9)",
			          strokeColor: "rgba(60,141,188,0.8)",
			          pointColor: "#3b8bba",
			          pointStrokeColor: "rgba(60,141,188,1)",
			          pointHighlightFill: "#fff",
			          pointHighlightStroke: "rgba(60,141,188,1)",
			          data: [28, 48, 40, 19, 86, 27, 90]
			        }
			      ]
			    };
		
		//-------------
	    //- BAR CHART -
	    //-------------
	    var barChartCanvas = $("#barChart").get(0).getContext("2d");
	    var barChart = new Chart(barChartCanvas);
	    var barChartData = areaChartData;
	    barChartData.datasets[1].fillColor = "#00a65a";
	    barChartData.datasets[1].strokeColor = "#00a65a";
	    barChartData.datasets[1].pointColor = "#00a65a";
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
	      <%-- legendTemplate: "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<datasets.length; i++){%><li><span style=\"background-color:<%=datasets[i].fillColor%>\"></span><%if(datasets[i].label){%><%=datasets[i].label%><%}%></li><%}%></ul>", --%>
	      //Boolean - whether to make the chart responsive
	      responsive: true,
	      maintainAspectRatio: true
	    };

	    barChartOptions.datasetFill = false;
	    barChart.Bar(barChartData, barChartOptions);
		
		
	});
</script>
</body>
</html>