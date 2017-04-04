<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%> --%>

<html>
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
	<!--=== Header v7 Left ===-->
	<div class="header-v7 header-left-v7">
		<nav class="navbar navbar-default mCustomScrollbar" role="navigation"
			data-mcs-theme="minimal-dark"> <!-- Brand and toggle get grouped for better mobile display -->
		<div class="menu-container">
			<!-- Toggle get grouped for better mobile display -->
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-responsive-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<!-- End Toggle -->
			<!-- Logo -->
			<%-- <div class="test">
            shopInfo = ${shop} <br>
            showName = ${shop.shopName} <br>
            tables = ${tables}<br>
          </div> --%>
			<div class="logo">
				<a href="../common/main.do"> <img id="logo-header"
					src="<c:url value="/image/common/logo.png"/>" alt="Logo" />
				</a>
			</div>
			<!-- End Logo -->
		</div>
		<a class="btn btn-success btn-lg btn-block" href="#">${shop.shopName}</a>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse navbar-responsive-collapse">
			<div class="menu-container">
				<ul class="nav navbar-nav">
					<!-- Home -->
					<li><a href="<c:url value="/pos/getShopInfo.do?mgrId=${sessionScope.id}"/>">포스 메인</a>
					<li class="dropdown"><a href="javascript:void(0);"
						class="dropdown-toggle" data-toggle="dropdown">매장관리</a>
						<ul class="dropdown-menu">
							<li><a href="#">메뉴 관리</a></li>
							<li><a href="#">테이블 관리</a></li>
							<li><a href="salesLog.do">매출 통계</a></li>
						</ul></li>
					<!-- End Home -->
					<!-- About Pages -->
					<li class="dropdown"><a href="javascript:void(0);"
						class="dropdown-toggle" data-toggle="dropdown">매장페이지 관리</a>
						<ul class="dropdown-menu">
							<li><a href="#">매장정보</a></li>
							<li><a href="#">찾아오시는 길</a></li>
							<li><a href="#">자유게시판</a></li>
						</ul></li>
					<!-- End About Pages -->
					<!-- Blog -->
				</ul>
								
				<!-- <p class="copyright-text">&copy; 2017 WEPOS. All Rights
					Reserved.</p> -->
			</div>
			<div class="footer-v1" style="bottom:0;position:fixed">
				<ul class="list-inline header-socials">
					<li><a href="#"><i class="fa fa-facebook"></i></a></li>
					<li><a href="#"><i class="fa fa-instagram"></i></a></li>
					<li><a href="#"><i class="fa fa-twitter"></i></a></li>
				</ul>
				&copy; 2017 WEPOS. All Rights	Reserved.
			</div>
		</div>
		<!-- End Navbar Collapse --> </nav>
		
	</div>
<%-- 	<script type="text/javascript"
		src="../assets/plugins/jquery/jquery.min.js"></script>
	<script type="text/javascript"
		src="../assets/plugins/jquery/jquery-migrate.min.js"></script>
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
	</script> --%>
</body>
</html>