<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
<title>WePos</title>
<!-- Meta -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
</head>
<body>
	<!--=== Header v7 Left ===-->
	<div class="header-v7 header-left-v7">
		<nav class="navbar navbar-default mCustomScrollbar" role="navigation"
			data-mcs-theme="minimal-dark" style="padding-top:0"> <!-- Brand and toggle get grouped for better mobile display -->
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
		<a class="btn btn-success btn-lg btn-block" id="shop" data-code="${shopCode}"
				href="<c:url value="/pos/posMain.do?mgrId=${sessionScope.id}"/>">${shop.shopName}</a>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse navbar-responsive-collapse">
			<div class="menu-container">
				<ul class="nav navbar-nav">
					<!-- Home -->
					<li><a href="<c:url value="/pos/posMain.do?mgrId=${sessionScope.id}"/>">매장 영업</a>
					<li class="dropdown"><a href="javascript:void(0);"
						class="dropdown-toggle" data-toggle="dropdown">매장 관리</a>
						<ul class="dropdown-menu">
							<li><a href="updateCategoryView.do?mgrId=${sessionScope.id}">상품분류 관리</a></li>
							<li><a href="updateProductView.do?mgrId=${sessionScope.id}">상품 관리</a></li>
							<li><a href="updateTableView.do?mgrId=${sessionScope.id}">테이블 관리</a></li>
							<li><a href="../pos/posReservation.do?mgrId=${sessionScope.id}&shopCode=${sessionScope.shopCode}">예약 관리</a></li>
						</ul></li>
					
					<li class="dropdown"><a href="javascript:void(0);"
						class="dropdown-toggle" data-toggle="dropdown">매장 통계</a>
						<ul class="dropdown-menu">
							<li><a href="salesLog.do?mgrId=${sessionScope.id}">매출 통계</a></li>
							<li><a href="posChartStats.do?shopCode=${sessionScope.shopCode}">차트 통계</a></li>
						</ul></li>
					<!-- End Home -->
					<!-- About Pages -->
					<li class="dropdown"><a href="javascript:void(0);"
						class="dropdown-toggle" data-toggle="dropdown">매장 페이지 관리</a>
						<ul class="dropdown-menu">
							<li><a href="shopInfoUpdate.do?shopCode=${sessionScope.shopCode}">매장 정보</a></li>
							<li><a href="posShopNotice.do?shopCode=${sessionScope.shopCode}">공지사항</a></li>
							<li><a href="posShopBoard.do?shopCode=${sessionScope.shopCode}">자유게시판</a></li>
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

</body>
</html>