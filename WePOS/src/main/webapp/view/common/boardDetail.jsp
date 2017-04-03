<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.*, com.wepos.common.*, com.wepos.common.dto.*"%>

<%@ page
	import="java.util.*, com.wepos.common.*, com.wepos.common.dto.BoardDto"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>We POS</title>

<!-- Meta -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Favicon -->
<link rel="shortcut icon" href="favicon.ico">

<!-- Web Fonts -->
<link rel='stylesheet' type='text/css'
	href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin'>

<!-- CSS Global Compulsory -->
<link rel="stylesheet"
	href="<c:url value="/assets/plugins/bootstrap/css/bootstrap.min.css" />">
<link rel="stylesheet" href="<c:url value="/assets/css/style.css" />">

<!-- CSS Header and Footer -->
<link rel="stylesheet"
	href="<c:url value="/assets/css/headers/header-default.css" />">
<link rel="stylesheet"
	href="<c:url value="/assets/css/footers/footer-v1.css" />">

<!-- CSS Implementing Plugins -->
<link rel="stylesheet"
	href="<c:url value="/assets/plugins/animate.css" />">
<link rel="stylesheet"
	href="<c:url value="/assets/plugins/line-icons/line-icons.css" />">
<link rel="stylesheet"
	href="<c:url value="/assets/plugins/font-awesome/css/font-awesome.min.css" />">

<!-- CSS Page Style -->
<link rel="stylesheet"
	href="<c:url value="/assets/css/pages/page_search_inner_tables.css" />">

<!-- CSS Customization -->
<link rel="stylesheet" href="<c:url value="/assets/css/custom.css" />">

<!-- table Sorter CSS ( devdra9 added ) -->
<link rel="stylesheet"
	href="<c:url value="/assets/js/table_sorter/blue/style.css" />"
	type="text/css">

<script language="JavaScript" src="../js/common/boardJs.js?v=2"></script>

</head>
<body>

	<%
		BoardDto boardDto = new BoardDto();
	%>

	<div class="wrapper">
		<!--=== Header ===-->
		<jsp:include page="header.jsp" flush="false" />

		<!--=== Search Block Version 2 ===-->
		<div class="search-block99">
			<div class="container">
				<div class="col-md-8 col-md-offset-1">
					<h2 style="text-align: left;">글을 확인하실 수 있습니다.</h2>
				</div>
			</div>
		</div>
		<!--/container-->
		<form name="boardDetail" enctype="multipart/form-data" method="post"
			action="boardDelete.do?boardTypeCode=${boardTypeCode}">

			<input type="hidden" name="boardNumber" value="${boardDto.boardNumber}">

			<div class="container content" style="width: 60%; min-height: 558px">
				<div class="row blog-page">
					<div class="col-md-12">
						<div class="blog margin-bottom-40">
							<h2>${boardDto.boardTitle}</h2>
							<div class="blog-post-tags">
								<ul class="list-unstyled list-inline blog-info">
									<li><i class="fa fa-calendar"></i> ${boardDto.boardDate}</li>
									<li><i class="fa fa-pencil"></i> ${boardDto.totalId}</li>
									<li><i class="fa fa-comments"></i> <a href="#">10개의 댓글</a></li>
								</ul>
								<ul class="list-unstyled list-inline blog-tags">
									<li><i class="fa fa-tags"></i> <a href="#">Technology</a>
										<a href="#">Education</a> <a href="#">Internet</a> <a href="#">Media</a>
									</li>
								</ul>
							</div>
							<hr>
							<div class="blog-img">
								<!-- <img class="img-responsive" src="../assets/img/bg/18.jpg" alt="">
								<img class="img-responsive" src="../assets/img/bg/14.jpg" alt=""> -->
								
								<img class="img-responsive" src="${boardDto.boardFile}" alt="">
								
							</div>
							<p>${boardDto.boardContent}</p>
							<hr>
							<a href="file.do?boardFile=${boardDto.boardFile}">${boardDto.boardFile}</a>
							<p>
								<a class="btn-u btn-u-small" href="blog_item_option1.html"><i
									class="fa fa-plus-sign"></i> Read More</a>
								<c:if test="${sessionScope.id==boardDto.totalId}">
									<input type="button" value="수정하기"
										onClick="location.href='boardRewrite.do?boardNumber=${boardDto.boardNumber}&boardTypeCode=${boardTypeCode}'">
									<input type="button" value="삭제하기" onClick="boardDelete()">
									<input type="button" value="돌아가기"
										onClick="location.href='showBoard.do?boardTypeCode=${boardTypeCode}'">
								</c:if>
								<c:if test="${sessionScope.id==null || sessionScope.id!=boardDto.totalId}">
									<input type="button" value="돌아가기"
										onClick="location.href='showBoard.do?boardTypeCode=${boardTypeCode}'">
								</c:if>
							</p>
						</div>
					</div>
				</div>
			</div>

		</form>
		<!-- End Content -->

		<jsp:include page="footer.jsp" flush="false" />

	</div>
	<!--/wrapper-->

	<!-- JS Global Compulsory -->
	<script type="text/javascript"
		src="../assets/plugins/jquery/jquery.min.js"></script>
	<script type="text/javascript"
		src="../assets/plugins/jquery/jquery-migrate.min.js"></script>
	<script type="text/javascript"
		src="../assets/plugins/bootstrap/js/bootstrap.min.js"></script>
	<!-- JS Implementing Plugins -->
	<script type="text/javascript" src="../assets/plugins/back-to-top.js"></script>
	<script type="text/javascript" src="../assets/plugins/smoothScroll.js"></script>
	<script type="text/javascript"
		src="../assets/plugins/parallax-slider/js/modernizr.js"></script>
	<script type="text/javascript"
		src="../assets/plugins/parallax-slider/js/jquery.cslider.js"></script>

	<!-- JS Page Level -->
	<script type="text/javascript" src="../assets/js/app.js"></script>
	<script type="text/javascript"
		src="../assets/js/plugins/parallax-slider.js"></script>
	<script type="text/javascript">
		jQuery(document).ready(function() {
			App.init();
			ParallaxSlider.initParallaxSlider();
		});
	</script>

</body>

</html>
