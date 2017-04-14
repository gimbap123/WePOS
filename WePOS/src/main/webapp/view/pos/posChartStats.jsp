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
				
				<div class="margin-bottom-60"></div>
				<input type="hidden" id="chartTitle" value="${chartTitle}">
				
				<section class="content" style="padding-top: 0px;">					
					<div class="col-md-12" id="chartDiv">						
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
									<c:forEach items="${chartTypeList}" var="data">
										<c:if test="${data.key ==  chartType}">
											<option value="${data.key}" selected="selected">${data.value}</option>
										</c:if>
										<c:if test="${data.key !=  chartType}">
											<option value="${data.key}">${data.value}</option>
										</c:if>
									</c:forEach>							
								</select>				
							</div>						
							<div class="input-group margin-bottom-10">									
								<span class="input-group-addon">월별</span>																						
								<section>
									<c:if test="${start == null}">
										<input type="text" class="form-control" name="start" id="start" placeholder="클릭하여 시작일을 선택">
									</c:if>
									<c:if test="${start != null}">
										<input type="text" class="form-control" name="start" id="start" placeholder="클릭하여 시작일을 선택" value="${start}">
									</c:if>									                                   
                                </section>													
								<section>    
									<c:if test="${finish == null}">
										<input type="text" class="form-control" name="finish" id="finish" placeholder="클릭하여 시작일을 선택">
									</c:if>
									<c:if test="${finish != null}">
										<input type="text" class="form-control" name="finish" id="finish" placeholder="클릭하여 시작일을 선택" value="${finish}">
									</c:if>                              	                                                              
                                </section>                                                            						
							</div>
							<div class="input-group" style="width: 100%">
								<button type="button" class="btn btn-lg btn-primary" style="width: 50%;" onclick="checkPosChartStats()">조회</button>
								<button type="button" class="btn btn-lg btn-danger" style="width: 50%;" onclick="resetChartStatsOption()" >초기화</button>
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
		chartTypeSelect(${jsonChartData});
	});
</script>
</body>
</html>