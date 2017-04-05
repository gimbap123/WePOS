<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


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
<link href="<c:url value="/assets/css/headers/header-v7.css"/>"
	rel="stylesheet" type="text/css">

<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<script type="text/javascript" src="../assets/plugins/smoothScroll.js"></script>
<script language="JavaScript" src="../js/pos/salesLog.js?ver=1"></script>

<script>
	$(function() {
		$("#calendarBegin").datepicker(
				{
					showMonthAfterYear : true,
					maxDate : '-0',
					yearSuffix : '년',
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ],
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					onClose: function( selectedDate ) {
					   $( "#calendarEnd" ).datepicker( "option", "minDate", selectedDate );
					}
				});
		//옵션  : 매개변수값 2번째가 옵션의 타입이며 3번째 항목은 옵션에 대한 설정 값
		$("#calendarBegin").datepicker("option", "dateFormat", "yy-mm-dd"); //데이터 포맷으로 날짜의 반환 타입을 지정
		$("#calendarBegin").datepicker("option", "showAnim", "slideDown"); //달력의 표시 형태

		$("#calendarEnd").datepicker(
				{
					showMonthAfterYear : true,
					maxDate : '-0',
					yearSuffix : '년',
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ],
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					onClose: function( selectedDate ) {
						$( "#calendarBegin" ).datepicker( "option", "maxDate", selectedDate );
					}
				});
		$("#calendarEnd").datepicker("option", "dateFormat", "yy-mm-dd");
		$("#calendarEnd").datepicker("option", "showAnim", "slideDown");

	});
</script>

<!-- <script type="text/javascript" src="../assets/plugins/jquery/jquery.min.js"></script> -->
</head>
<body>
	<div class="wrapper">
		<jsp:include page="../pos/leftBar.jsp" flush="false" />
		<div class="content-side-right">
			<div class="content-wrapper"
				style="margin-right: 270px; padding: 20px">
				<nav class="navbar mCustomScrollbar" role="navigation"
					data-mcs-theme="minimal-dark"> <!-- Content Header (Page header) -->
					<section class="content-header">
					<h2 align="right">검색 조건을 설정해 주세요 ▶▶</h2>
					</section> <!-- Main content --> 
					
					<section class="content">
						<div class="panel panel-yellow margin-bottom-40">
							<table class="table table-hover">
								<div class="panel-heading">
									<h2 class="panel-title">매출 통계</h2>
								</div>
								<thead>
									<tr style="background: #999; color: white; text-align: center">
										<th style="text-align: center">일시</th>
										<th style="text-align: center">테이블 번호</th>
										<th style="text-align: center">메뉴</th>
										<th style="text-align: center">단가</th>
										<th style="text-align: center">수량</th>
										<th style="text-align: center; color: blue">매출</th>
									</tr>
								</thead>
								
								<tbody>
									<c:set var="total" value="0" />
									<c:forEach var="resultLog" items="${resultLog}">
										<tr>
											<td style="text-align: center">${resultLog.orderDate}</td>
											<td style="text-align: center">${resultLog.tableCode}</td>
											<td style="text-align: center">${resultLog.productName}</td>
											<td style="text-align: center">
												<fmt:formatNumber value="${resultLog.productPrice}" type="number" /> 원
											</td>
											<td style="text-align: center">${resultLog.orderAmount}</td>
											<td style="text-align: center">
												<fmt:formatNumber value="${resultLog.orderPrice}" type="number" /> 원
											</td>
										</tr>
										<c:set var="total" value="${total + resultLog.orderPrice}" />
									</c:forEach>
		
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
					</div>
					<form id="searchForm" name="searchForm" 
						action="searchLog.do?mgrId=${sessionScope.id}"
						method="post">
						<table class="table table-striped table-bordered">
							<tbody>
								<tr>
									<td style="text-align: center;vertical-align: middle;">시작일</td>
									<td style="text-align: center">
										<input type="text" id="calendarBegin" name="calendarBegin" placeholder="클릭하여 선택">
									</td>
								</tr>
								<tr>
									<td style="text-align: center;vertical-align: middle;">종료일</td>
									<td style="text-align: center;vertical-align: middle;">
										<input type="text" id="calendarEnd" name="calendarEnd" placeholder="클릭하여 선택">
									</td>
								</tr>
								<tr>
									<td style="text-align: center;vertical-align: middle;">메뉴</td>
									<td style="text-align: center">
										<select class="form-control" id="shopTypeCode" name="shopTypeCode">
											<option value="0">모든 메뉴</option>
											<c:forEach items="${product}" var="product">
												<option value="${product.productCode}">${product.productName}</option>
											</c:forEach>
										</select>
									</td>
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