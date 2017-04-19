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
	<title>예약 관리</title>
	
	
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
	<script language="JavaScript" src="../js/pos/posReservation.js?ver=3"></script>

</head>
<body>
	<div class="wrapper">
		<jsp:include page="../pos/leftBar.jsp" flush="false" />
		<div class="content-side-right">
			<div class="content-wrapper" style="margin-right: 270px; padding: 20px;padding-top:0">
				<nav class="navbar mCustomScrollbar" role="navigation"
					data-mcs-theme="minimal-dark">
				<div class="breadcrumbs-v3 img-v1" style="background: url(../image/common/updateTable.jpg); 
																					background-size: cover; background-position: center;height: 30px">
					<div class="container text-center" style="width: 100%">
						<h1>예약 관리</h1>
					</div>
					<!--/end container-->
				</div>
				<hr>
				<section class="content" style="padding-top:0">
						<div class="panel panel-yellow margin-bottom-40">
						
							<table class="table table-hover">
								<div class="panel-heading">
									<h2 class="panel-title" style="margin-left:20px;font-size:20px">예약 관리</h2>
								</div>
								<thead>
									<tr style="background: #999; color: white; text-align: center">
										<th style="text-align: center">예약번호</th>
										<th style="text-align: center">예약자명</th>
										<th style="text-align: center">예약인원</th>
										<th style="text-align: center">예약일시</th>
										<th style="text-align: center">주문내역</th>
										<th style="text-align: center; color: blue">예약상태</th>
									</tr>
								</thead>
								
								<tbody>
									<c:if test="${countPosRes>0}">
										<c:set var="cnt" value="1" />
										<c:forEach var="posRes" items="${resList}">
											<tr height="40px" name="selectThisTr${cnt}" id="selectThisTr${cnt}"
												onclick="reservationInfo('${posRes.reseNumber}', '${posRes.userId}', '${posRes.resPersons}', '${posRes.resDate}', '${posRes.resState}')">
												<th style="text-align: center;padding:0;vertical-align:middle">${posRes.reseNumber}</th>
												<th style="text-align: center;padding:0;vertical-align:middle">${posRes.userId}</th>
												<th style="text-align: center;padding:0;vertical-align:middle">${posRes.resPersons}명</th>
												<th style="text-align: center;padding:0;vertical-align:middle">${posRes.resDate}</th>
												<th style="text-align: center;padding:0;vertical-align:middle">${posRes.resDesc}</th>
												<c:if test="${posRes.resState==0}">
												<th style="text-align: center;padding:0;vertical-align:middle">예약대기</th>
												</c:if>
												<c:if test="${posRes.resState==1}">
												<th style="text-align: center;padding:0;vertical-align:middle">예약완료</th>
												</c:if>
												<c:if test="${posRes.resState==2}">
												<th style="text-align: center;padding:0;vertical-align:middle">예약취소</th>
												</c:if>
											</tr>
											<c:set var="cnt" value="${cnt +1 }" />
										</c:forEach>
									</c:if>
									
									<c:if test="${countPosRes==0}">
										<tr>
											<th colspan="6" style="text-align: center;">
												<h3>검색된 예약 데이터가 없습니다.</h3>
											</th>
										</tr>
									</c:if>	
		
									<tr>
										<th colspan="6" style="text-align: center;">
											<h3>
												대기중인 예약 수 &nbsp;&nbsp;:&nbsp;&nbsp;
												<fmt:formatNumber value="${countStateZero}" type="number" /> 건
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
		

		<!-- 우측 메뉴  -->
		<div class="pos-right" style="margin-top:62px;padding-top:0">
			<div class="pos-status">
				<div class="panel panel-default panel-warning">
					<!-- Default panel contents -->
					<!-- Table -->
					<div class="panel-heading" align="center"><h3>예약 정보</h3></div>					
					<!-- ★ -->
					<form id="updateStateForm" name="updateStateForm" action="updateProduct.do?mgrId=${sessionScope.id}" method="post">
						<table class="table table-striped table-bordered">
							<tbody>
								<tr>
									<th style="text-align:center;vertical-align:middle;width:90px;height:41px">예약번호</th>
									<th>
										<input type="text" id="reseNumber" name="reseNumber" value="" size="15px" style="text-align:center;border:0" readonly>
									</th>
								</tr>
								<tr>
									<th style="text-align:center;vertical-align:middle;width:90px;height:41px">예약자명</th>
									<th>
										<input type="text" id="userId" name="userId" value="" size="15px" style="text-align:center;border:0" readonly>
									</th>
								</tr>
								<tr>
									<th style="text-align:center;vertical-align:middle;width:90px;height:41px">예약인원</th>
									<th>
										<input type="text" id="resPersons" name="resPersons" value="" size="15px" style="text-align:center;border:0" readonly>
									</th>
								</tr>
								<tr>
									<th style="text-align:center;vertical-align:middle;width:90px;height:41px">예약일시</th>
									<th>
										<input type="text" id="resDate" name="resDate" value="" size="15px" style="text-align:center;border:0" readonly>
									</th>
								</tr>
								<tr>
									<th style="text-align:center;vertical-align:middle;width:90px;height:41px">예약상태</th>
									<th>
										<select class="form-control" id="resState" name="resState">
										</select>
									</th>
								</tr>
							</tbody>
						</table>						
					</form>	
				</div>
				<br>
				<div role="group" aria-label="..." class="btn-group btn-group-justified">					
					<div class="btn-group" role="group" style="">
						<input type="hidden" name="shopCode" id="shopCode" value="${sessionScope.shopCode}">
						<input type="hidden" name="mgrId" id="mgrId" value="${sessionScope.id }">
						<button type="button" style="margin-top: -30px" class="btn btn-lg btn-primary" id="okButton" onclick="updateResState()" disabled>예약상태 수정</button>
					</div>
				</div>
				
				
				<hr> 


						<div class="panel panel-default panel-warning">
						<!-- Table -->
						<div class="panel-heading" align="center" >
							<h4>예약 상태 검색</h4>
						</div>
						<form id="searchForm" name="searchForm" action="searchLog.do?mgrId=${sessionScope.id}" method="post">
							<table class="table table-striped table-bordered">
								<tbody>
									<tr>
										<th rowspan=2 style="text-align: center;vertical-align: middle;width: 80px; height: 41px">예약상태</th>
										<th>
										<select class="form-control" id="resStateFind" name="resStateFind">
											<option value="0">예약대기</option>
											<option value="1">예약완료</option>
											<option value="2">예약취소</option>
										</select>
									</th>
									</tr>
									<tr id="groupChild">
									</tr>
									<tr>
										<th style="text-align: center;vertical-align: middle;width: 80px; height: 41px">시작일</th>
										<td style="text-align: center">
											<input type="text" id="calendarBegin" name="calendarBegin" placeholder="클릭하여 선택" style="text-align:center">
										</td>
									</tr>	
									<tr>
										<th style="text-align: center;vertical-align: middle;width: 80px; height: 41px">종료일</th>
										<td style="text-align: center">
											<input type="text" id="calendarEnd" name="calendarEnd" placeholder="클릭하여 선택" style="text-align:center">
										</td>
								</tbody>
							</table>
							<div role="group" class="btn-group btn-group-justified">
								<div class="btn-group" role="group">
									<button type="button" class="btn btn-lg btn-primary" onclick="checkStateForm()">조회</button>
								</div>
								<div class="btn-group" role="group">
									<button type="button" class="btn btn-lg btn-danger" 
										onclick="location.href='posReservation.do?mgrId=${sessionScope.id}&shopCode=${sessionScope.shopCode}'">초기화</button>
								</div>
							</div>
						</form>
						</div>
		
				
			</div>
			<!-- End Owl Clients v1 -->
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