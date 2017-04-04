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
</head>

<body>
	<div class="wrapper">
		<!--=== Header v7 Left ===-->
		<jsp:include page="../pos/leftBar.jsp" flush="false" />

		<div class="content-side-right pos-main">
			<br>
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
					<div class="panel-body">Panel content</div>
				</div>
			</c:forEach>
		</div>
		<div class="pos-right">
			<div class="pos-status">
				<div class="panel panel-default panel-warning">
					<!-- Default panel contents -->
					<!-- Table -->
					<div class="panel-heading">매장 현황</div>
					<table class="table table-striped table-bordered">
						<tbody>
							<tr>
								<td>날짜</td>
								<td><span id="realTime"></span></td>
							</tr>
							<tr>
								<td>테이블</td>
								<td>3</td>
							</tr>
							<tr>
								<td>인원</td>
								<td>3명</td>
							</tr>
							<tr>
								<td>금액</td>
								<td>50,000원</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div role="group" aria-label="..."
					class="btn-group btn-group-justified">
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-lg btn-success"
							data-toggle="tooltip">예약</button>
					</div>
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-lg btn-success">반품</button>
					</div>
				</div>
				<div role="group" aria-label="..."
					class="btn-group btn-group-justified">
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-lg btn-success">이동</button>
					</div>
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-lg btn-success">합석</button>
					</div>
				</div>
				<div role="group" aria-label="..."
					class="btn-group btn-group-justified">
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-lg btn-success">계산서출력</button>
					</div>
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-lg btn-success">테이블
							상세</button>
					</div>
				</div>
				<br>
				<div role="group" aria-label="..."
					class="btn-group btn-group-justified">
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-lg btn-danger">주문</button>
					</div>
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-lg btn-primary">계산</button>
					</div>
				</div>
			</div>
			<!-- End Owl Clients v1 -->
		</div>
		<div class="modal fade" id="orderModal" tabindex="-1" role="dialog"
			aria-labelledby="orderModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="orderModalLabel">메뉴 선택</h4>
					</div>
					<div class="modal-body">
						<div role="tabpanel">

							<!-- Nav tabs -->
							<ul class="nav nav-pills" role="tablist">
								<li role="presentation" class="active"><a href="#all"
									aria-controls="all" role="tab" data-toggle="tab">전체</a></li>
								<li role="presentation"><a href="#food"
									aria-controls="food" role="tab" data-toggle="tab">식사</a></li>
								<li role="presentation"><a href="#snack"
									aria-controls="snack" role="tab" data-toggle="tab">안주</a></li>
								<li role="presentation"><a href="#alcohol"
									aria-controls="alcohol" role="tab" data-toggle="tab">주류</a></li>
							</ul>
							<!-- Tab panes -->
							<div class="tab-content">
								<div role="tabpanel" class="tab-pane active" id="all">
									<div class="container-fluid">
										<div class="row">
											<c:forEach var="product" items="${productList}">
												<div class="col-sm-4">
													<!-- 메뉴 패널 -->
													<div class="panel panel-primary">
														<div class="panel-body">
															<h3>${product.productName}
																<span class="label label-primary">${product.productPrice}원</span>
																<span class="badge">${product.productStock}</span>
															</h3>
														</div>
													</div>
													<!-- 메뉴 패널 종료 -->
												</div>
											</c:forEach>
										</div>
									</div>
								</div>
								<div role="tabpanel" class="tab-pane" id="food">
									<c:forEach var="product" items="${productList}">
										<!-- 카테고리 코드1  (식사) -->
										<c:if test="${product.categoryCode == 1}">
											<div class="col-sm-4">
												<!-- 메뉴 패널 -->
												<div class="panel panel-primary">
													<div class="panel-body">
														<h3>${product.productName}
															<span class="label label-primary">${product.productPrice}원</span>
															<span class="badge">${product.productStock}</span>
														</h3>
													</div>
												</div>
												<!-- 메뉴 패널 종료 -->
											</div>
										</c:if>
									</c:forEach>
								</div>
								<div role="tabpanel" class="tab-pane" id="snack">
									<c:forEach var="product" items="${productList}">
										<!-- 카테고리 코드 2 (안주) -->
										<c:if test="${product.categoryCode == 2}">
											<div class="col-sm-4">
												<!-- 메뉴 패널 -->
												<div class="panel panel-primary">
													<div class="panel-body">
														<h3>${product.productName}
															<span class="label label-primary">${product.productPrice}원</span>
															<span class="badge">${product.productStock}</span>
														</h3>
													</div>
												</div>
												<!-- 메뉴 패널 종료 -->
											</div>
										</c:if>
									</c:forEach>
								</div>
								<div role="tabpanel" class="tab-pane" id="alcohol">
									<c:forEach var="product" items="${productList}">
										<!-- 카테고리 코드 3 (주류)-->
										<c:if test="${product.categoryCode == 3}">
											<div class="col-sm-4">
												<!-- 메뉴 패널 -->
												<div class="panel panel-primary">
													<div class="panel-body">
														<h3>${product.productName}
															<span class="label label-primary">${product.productPrice}원</span>
															<span class="badge">${product.productStock}</span>
														</h3>
													</div>
												</div>
												<!-- 메뉴 패널 종료 -->
											</div>
										</c:if>
									</c:forEach>
								</div>
							</div>

						</div>
					</div>
					<br>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
						<button type="button" class="btn btn-primary">주문</button>
					</div>
				</div>
			</div>
		</div>
		<!-- /.modal -->

	</div>
	
	<script type="text/javascript"
		src="<c:url value="/assets/plugins/jquery/jquery-migrate.min.js"/>"></script>
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