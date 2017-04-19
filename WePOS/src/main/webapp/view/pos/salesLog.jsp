<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>매출 통계</title>
	
	
	<link rel="stylesheet"
		href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
	<link rel="stylesheet"
		href="../assets/plugins/scrollbar/css/jquery.mCustomScrollbar.css">
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
	<link rel="stylesheet" type="text/css"
		href="<c:url value="/assets/css/headers/header-v7.css"/>">
		
	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
	<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
	<script type="text/javascript" src="../assets/plugins/smoothScroll.js"></script>
	<script language="JavaScript" src="../js/pos/salesLog.js?ver=6"></script>

</head>
<body>
	<div class="wrapper">
		<jsp:include page="../pos/leftBar.jsp" flush="false" />
		<div class="content-side-right">
			<div class="content-wrapper" style="margin-right: 270px; padding: 20px;padding-top:0">
				<nav class="navbar mCustomScrollbar" role="navigation"
					data-mcs-theme="minimal-dark">
				<div class="breadcrumbs-v3 img-v1" style="background: url(../image/common/posLog.jpg); 
																					background-size: cover; background-position: center;height: 30px">
					<div class="container text-center" style="width: 100%">
						<h1>매출 통계</h1>
					</div>
					<!--/end container-->
				</div>
				<hr>
				<section class="content" style="padding-top:0">
						<div class="panel panel-yellow margin-bottom-40">
							<table class="table table-hover">
								<div class="panel-heading">
									<c:if test="${posLogDto.searchType==null}">
										<h2 class="panel-title" style="margin-left:20px;font-size:20px">총 매출 통계</h2>
									</c:if>
									<c:if test="${posLogDto.searchType!=null}">
										<span style="float:right;margin-right:20px">
											<c:if test="${posLogDto.searchGroup==1}">
												<h2 class="panel-title" style="font-size:20px">상품분류 - ${posLogDto.categoryName}</h2>
											</c:if>
											<c:if test="${posLogDto.searchGroup==2}">
												<h2 class="panel-title" style="font-size:20px">메뉴 - ${posLogDto.productName}</h2>
											</c:if>
										</span>										
										<h2 class="panel-title" style="margin-left:20px;font-size:20px">
											<c:if test="${posLogDto.searchType==1}">
												상세 통계 ( ${posLogDto.calendarBegin} ~ ${posLogDto.calendarEnd} )
											</c:if>
											<c:if test="${posLogDto.searchType==2}">
												일별 통계 ( ${posLogDto.calendarBegin} ~ ${posLogDto.calendarEnd} )
											</c:if>
											<c:if test="${posLogDto.searchType==3}">
												월별 통계 ( ${posLogDto.monthBegin} ~ ${posLogDto.monthEnd} )
											</c:if>	
										</h2>
									</c:if>
								</div>
								<thead>
									<tr style="background: #999; color: white; text-align: center">
										<th style="text-align: center">일시</th>
										<c:if test="${posLogDto.searchGroup==1}">
											<th style="text-align: center">분류</th>
										</c:if>
										<c:if test="${posLogDto.searchGroup==2}">
											<th style="text-align: center">메뉴</th>
											<th style="text-align: center">단가</th>
										</c:if>										
										<th style="text-align: center">수량</th>
										<th style="text-align: center; color: blue">매출</th>
									</tr>
								</thead>
								
								<tbody>
									<c:if test="${fn:length(resultLog)>0}">
										<c:set var="total" value="0" />
										<c:forEach var="resultLog" items="${resultLog}">
											<tr>
												<td style="text-align: center;padding:0;vertical-align:middle">${resultLog.orderDate}</td>
												<%-- <c:if test="${resultLog.categoryName!=null}">
													<td style="text-align: center">${resultLog.categoryName}</td>
												</c:if> --%>
												<c:if test="${posLogDto.searchGroup==1}">
													<td style="text-align: center">${resultLog.categoryName}</td>
												</c:if>
												<c:if test="${posLogDto.searchGroup==2}">
													<td style="text-align: center">${resultLog.productName}</td>
													<td style="text-align: center">
														<fmt:formatNumber value="${resultLog.productPrice}" type="number" /> 원
													</td>
												</c:if>
												<td style="text-align: center">${resultLog.orderAmount}</td>
												<td style="text-align: center">
													<fmt:formatNumber value="${resultLog.orderPrice}" type="number" /> 원
												</td>
											</tr>
											<c:set var="total" value="${total + resultLog.orderPrice}" />
										</c:forEach>
									</c:if>
									<c:if test="${fn:length(resultLog)==0}">
										<tr>
											<th colspan="6" style="text-align: center;">
												<h3>검색된 데이터가 없습니다.</h3>
											</th>
										</tr>
									</c:if>	
		
									<tr>
										<th colspan="6" style="text-align: center;">
											<h3>
												총 매출 &nbsp;&nbsp;:&nbsp;&nbsp;
												<fmt:formatNumber value="${total}" type="number" /> 원
											</h3>
										</th>
									</tr>		
								</tbody>
							</table>
						</div>
					</section>
				</nav>
			</div>
			
		</div>
		<div class="pos-right" style="margin-top:62px">
			<div class="pos-status">
				<div class="panel panel-success">
					<!-- Default panel contents -->
					<!-- Table -->
					<div class="panel-heading" align="center" style="background:#5cb85c">
						<h2 style="color:white">검색 조건 설정</h2>
						<h4 style="color:white">매장코드 : <span id="shopCode">${shop.shopCode}</span></h4>
					</div>
					<form id="searchForm" name="searchForm" action="searchLog.do?mgrId=${sessionScope.id}" method="post">
						<table class="table table-striped table-bordered">
							<tbody>
								<tr>
									<th rowspan=2 style="text-align: center;vertical-align: middle;width: 56px; height: 41px">분 류</th>
									<td>
										<select class="form-control" id="searchGroup" name="searchGroup">
											<option value="999">-- 선택하세요 --</option>
											<option value="1">상품분류별 통계</option>
											<option value="2">메뉴별 통계</option>
										</select>
									</td>
								</tr>
								<tr id="groupChild">
								</tr>
								<tr>
									<th style="text-align: center;vertical-align: middle;width: 56px; height: 41px">통 계</th>
									<td style="text-align: center">
										<select class="form-control" id="searchType" name="searchType">
											<option value="999">-- 선택하세요 --</option>
											<option value="1">상세 통계</option>
											<option value="2">일별 통계</option>
											<option value="3">월별 통계</option>											
										</select>
									</td>
								</tr>								
								<tr id="newStart">
								</tr>
								<tr id="newEnd">
								</tr>
								<tr id="month">
								</tr>								
							</tbody>
						</table>
						<div role="group" class="btn-group btn-group-justified">
							<div class="btn-group" role="group">
								<button type="button" class="btn btn-lg btn-primary" onclick="checkForm()">조회</button>
							</div>
							<div class="btn-group" role="group">
								<button type="button" class="btn btn-lg btn-danger" 
									onclick="location.href='salesLog.do?mgrId=${sessionScope.id}'">초기화</button>
							</div>
						</div>
					</form>
				</div>				
			</div>			
		</div>
	</div>	
	
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
	</script>

</body>
</html>