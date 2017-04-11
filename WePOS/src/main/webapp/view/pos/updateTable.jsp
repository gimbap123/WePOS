<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html>
<!--<![endif]-->
<head>
<title>WePos</title>
<!-- Meta -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<!-- Favicon -->
<link rel="shortcut icon" href="favicon.ico">
<!-- Web Fonts -->
<link rel="stylesheet"
	href="//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin">
<!-- CSS Global Compulsory -->
<link rel="stylesheet"
	href="<c:url value="/assets/plugins/bootstrap/css/bootstrap.min.css" />">
<link rel="stylesheet" href="<c:url value="/assets/css/style.css" /> ">
<!-- CSS Header and Footer -->
<link rel="stylesheet"
	href="<c:url value="/assets/css/headers/header-v7.css" /> ">
<link rel="stylesheet"
	href="<c:url value="/assets/css/footers/footer-v1.css" /> ">
<!-- CSS Implementing Plugins -->
<link rel="stylesheet"
	href="<c:url value="/assets/plugins/animate.css" /> ">
<link rel="stylesheet"
	href="<c:url value="/assets/plugins/line-icons/line-icons.css" /> ">
<link rel="stylesheet"
	href="<c:url value="/assets/plugins/font-awesome/css/font-awesome.min.css" /> ">
<link rel="stylesheet"
	href="<c:url value="/assets/plugins/scrollbar/css/jquery.mCustomScrollbar.css" /> ">
<link rel="stylesheet"
	href="<c:url value="/assets/plugins/owl-carousel/owl-carousel/owl.carousel.css" /> ">
<link rel="stylesheet"
	href="<c:url value="/assets/plugins/fancybox/source/jquery.fancybox.css" />">
<!-- CSS Customization -->
<link rel="stylesheet"
	href="<c:url value="/assets/css/custom.css?ver=1" /> ">
<link href="<c:url value="/assets/css/headers/header-v7.css"/>"
	rel="stylesheet" type="text/css">
<script language="JavaScript" src="../js/pos/updateTable.js?ver=1"></script>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
</head>

<body>
	<div class="wrapper">
		<!--=== Header v7 Left ===-->
		<jsp:include page="../pos/leftBar.jsp" flush="false" />

		<div class="content-side-right pos-main">
			<div class="breadcrumbs-v3 img-v1" style="background:url(../image/common/updateTable.jpg);background-size: cover;
  																				background-position: center center;margin-right:20px;height:30px">
				<div class="container text-center" style="width:100%">
					<h1>테이블 관리</h1>
				</div>
				<!--/end container-->
			</div>
			<hr>
			<span style="float:right;margin-right:20px">
				<button class="btn btn-success" type="button" onclick="create()">테이블 추가</button>
			</span>
			<button class="btn btn-primary" type="button">
				총 테이블 <span class="badge">${tableCount}</span>
			</button>
			<br>
			<c:forEach var="i" begin="0" end="${tableCount-1}">
				<div class="panel panel-success pos-table" data-toggle="modal"
					data-target="#orderModal">
					<div class="panel-heading">
						<h3 class="panel-title" id="panel-title">
							<a role="button" class="anchorjs-link" href="#panel-title"><span
								class="anchorjs-icon">${tables[i].tableName}</span></a> <span
								class="badge">${tables[i].tableMax}인</span>
						</h3>
					</div>
					<div class="panel-body" align="center">
						<span style="width:30px">
							<a class="color-green"	href="#"
								onclick="tableInfo('${tables[i].tableCode}','${tables[i].tableName}','${tables[i].tableDesc}','${tables[i].tableMax}')">수정</a>
						</span>
						<span>
						<a class="color-green" href="">삭제</a>
						</span>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="pos-right">
			<div class="pos-status">
				<div class="panel panel-default panel-warning">
					<!-- Default panel contents -->
					<!-- Table -->
					<div class="panel-heading" align="center"><h3>테이블 정보</h3></div>					
					<form id="updateTableForm" name="updateTableForm" action="updateTable.do?mgrId=${sessionScope.id}" method="post">
						<table class="table table-striped table-bordered">
							<tbody>
								<tr>
									<th style="text-align:center;vertical-align:middle;width:90px;height:41px">날짜</th>
									<th style="text-align:center;vertical-align:middle"><span id="realTime"></span></th>
								</tr>
								<tr>
									<th style="text-align:center;vertical-align:middle;width:90px;height:41px">테이블 번호</th>
									<th>
										<input type="text" id="tableCode" name="tableCode" value="" size="15px" 
												style="text-align:center;color:blue;border:0;" readonly>
									</th>
								</tr>
								<tr>
									<th style="text-align:center;vertical-align:middle;width:90px">테이블 이름</th>
									<th>
										<input type="text" id="tableName" name="tableName" value="" size="15px" style="text-align:center">
									</th>
								</tr>
								<tr>
									<th style="text-align:center;vertical-align:middle;width:90px">테이블 설명</th>
									<th>
										<input type="text" id="tableDesc" name="tableDesc" value="" size="15px" style="text-align:center">
									</th>
								</tr>
								<tr>
									<th style="text-align:center;vertical-align:middle;width:90px">정원</th>
									<th>
										<input type="text" id="tableMax" name="tableMax" value="" size="15px" style="text-align:center">
									</th>
								</tr>
							</tbody>
						</table>
					</form>	
				</div>
										
				<br>
				<div role="group" aria-label="..."
					class="btn-group btn-group-justified">
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-lg btn-danger" onclick="checkNull()">완료</button>
					</div>
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-lg btn-primary">취소</button>
					</div>
				</div>
			</div>
			<!-- End Owl Clients v1 -->
		</div>
	</div>
	
	<script type="text/javascript"
		src="../assets/plugins/jquery/jquery-migrate.min.js"></script>
	<!--/wrapper-->
	<!-- JS Global Compulsory -->
	<script type="text/javascript"
		src="<c:url value="/assets/plugins/jquery/jquery.min.js"/>"></script>
	<script type="text/javascript"
		src="<c:url value="/assets/plugins/bootstrap/js/bootstrap.min.js"/>"></script>
	<!-- JS Implementing Plugins -->
	<script type="text/javascript"
		src="<c:url value="/assets/plugins/back-to-top.js"/>"></script>
	<script type="text/javascript"
		src="<c:url value="/assets/plugins/jquery-appear.js"/>"></script>
	<script type="text/javascript"
		src="<c:url value="/assets/plugins/smoothScroll.js"/>"></script>
	<script type="text/javascript"
		src="<c:url value="/assets/plugins/jquery.parallax.js"/>"></script>
	<script type="text/javascript"
		src="<c:url value="/assets/plugins/counter/waypoints.min.js"/>"></script>
	<script type="text/javascript"
		src="<c:url value="/assets/plugins/counter/jquery.counterup.min.js"/>"></script>
	<script type="text/javascript"
		src="<c:url value="/assets/plugins/fancybox/source/jquery.fancybox.pack.js"/>"></script>
	<script type="text/javascript"
		src="<c:url value="/assets/plugins/owl-carousel/owl-carousel/owl.carousel.js"/>"></script>
	<script type="text/javascript"
		src="<c:url value="/assets/plugins/scrollbar/js/jquery.mCustomScrollbar.concat.min.js"/>"></script>
	<!-- JS Customization -->
	<script type="text/javascript"
		src="<c:url value="/assets/js/custom.js"/>"></script>
	<!-- JS Page Level -->
	<script type="text/javascript" src="<c:url value="/assets/js/app.js"/>"></script>
	<script type="text/javascript"
		src="<c:url value="/assets/js/plugins/fancy-box.js"/>"></script>
	<script type="text/javascript"
		src="<c:url value="/assets/js/plugins/progress-bar.js"/>"></script>
	<script type="text/javascript"
		src="<c:url value="/assets/js/plugins/owl-carousel.js"/>"></script>
		
	<script type="text/javascript">
	    jQuery(document).ready(function() {
		App.init();
		App.initCounter();
		App.initParallaxBg();
		App.initScrollBar();
		FancyBox.initFancybox();
		App.initAnimateDropdown();
		OwlCarousel.initOwlCarousel();
		ProgressBar.initProgressBarHorizontal();
	    });    
	
	    setInterval("realTime()", 1000);
	    function realTime() {
		var now = new Date();
		hours = now.getHours();
		minutes = now.getMinutes();
		seconds = now.getSeconds();

		if (hours > 12) {
		    hours -= 12;
		    ampm = "오후 ";
		} else {
		    ampm = "오전 ";
		}
		if (hours < 10) {
		    hours = "0" + hours;
		}
		if (minutes < 10) {
		    minutes = "0" + minutes;
		}
		if (seconds < 10) {
		    seconds = "0" + seconds;
		}

		document.getElementById("realTime").innerHTML = ampm + hours
			+ ":" + minutes + ":" + seconds;
	    }
	</script>
	<!--[if lt IE 9]>
    <script src="<c:url value="/assets/plugins/respond.js"/>"></script>
    <script src="<c:url value="/assets/plugins/html5shiv.js"/>"></script>
    <script src="<c:url value="/assets/plugins/placeholder-IE-fixes.js"/>"></script>
<![endif]-->
</body>
</html>