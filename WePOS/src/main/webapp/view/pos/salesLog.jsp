<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
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

<script>
		$(function() {
			$("#calendar_begin").datepicker({
					showMonthAfterYear : true,
					yearSuffix : '년',
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ]
			});
			//옵션  : 매개변수값 2번째가 옵션의 타입이며 3번째 항목은 옵션에 대한 설정 값
			$("#calendar_begin").datepicker("option", "dateFormat",
					"yy년 mm월 dd일"); //데이터 포맷으로 날짜의 반환 타입을 지정
			$("#calendar_begin").datepicker("option", "showAnim", "slideDown"); //달력의 표시 형태

			$("#calendar_end").datepicker(
					{
						showMonthAfterYear : true,
						yearSuffix : '년',
						monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월',
								'7월', '8월', '9월', '10월', '11월', '12월' ],
						monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
								'7월', '8월', '9월', '10월', '11월', '12월' ],
						dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ]
					});
			$("#calendar_end")
					.datepicker("option", "dateFormat", "yy년 mm월 dd일");
			$("#calendar_end").datepicker("option", "showAnim", "slideDown");

		});
	</script>	

<!-- <script type="text/javascript" src="../assets/plugins/jquery/jquery.min.js"></script> -->
</head>
<body>
	<div class="wrapper">
		<jsp:include page="../pos/leftBar.jsp" flush="false" />
		<div class="content-side-right">		
			<div class="content-wrapper" style="margin-right:270px;padding:20px">
			<nav class="navbar mCustomScrollbar" role="navigation"
						data-mcs-theme="minimal-dark">
				<!-- Content Header (Page header) -->
				<section class="content-header">
					<h2 align="right">
						조회 조건을 설정해 주세요 ▶▶
					</h2>				
				</section>

				<!-- Main content -->
				<section class="content">
					<div class="panel panel-yellow margin-bottom-40">
						<table class="table table-hover">
							<div class="panel-heading">
                                <h3 class="panel-title">매출 조회</h3>
                            </div>
		                    <thead>
		                        <tr style="background: #999;color:white">
		                            <th>일시</th>
		                            <th>테이블 번호</th>
		                            <th class="hidden-sm">메뉴</th>
		                            <th>단가</th>
		                            <th>수량</th>
		                            <th>금액</th>
		                        </tr>
		                    </thead>
		                    <tbody>
		                        <tr>
		                            <td>1</td>
		                            <td>Mark</td>
		                            <td class="hidden-sm">Otto</td>
		                            <td>@mdo</td>
		                            <td>1</td>
		                            <td><span class="label label-warning">Expiring</span></td>                          
		                        </tr>
		                        <tr>
		                            <td>2</td>
		                            <td>Jacob</td>
		                            <td class="hidden-sm">Thornton</td>
		                            <td>@fat</td>
		                            <td>1</td>
		                            <td><span class="label label-success">Success</span></td>                           
		                        </tr>
		                        <tr>
		                            <td>3</td>
		                            <td>Larry</td>
		                            <td class="hidden-sm">the Bird</td>
		                            <td>@twitter</td>
		                            <td>1</td>
		                            <td><span class="label label-danger">Error!</span></td>                         
		                        </tr>
		                        <tr>
		                            <td>4</td>
		                            <td>htmlstream</td>
		                            <td class="hidden-sm">Web Design</td>
		                            <td>@htmlstream</td>
		                            <td>1</td>
		                            <td><span class="label label-info">Pending..</span></td>                            
		                        </tr>
		                    </tbody>
                		</table>
					</div>
				
				
				<!-- /.row --> </section>
				<!-- /.content -->
			</div>
			</nav>
		</div>
		<div class="pos-right">
						<div class="pos-status">
				<div class="panel panel-success">
					<!-- Default panel contents -->
					<!-- Table -->
					<div class="panel-heading" align="center"><h2>조회 조건 설정</h2></div>
					<table class="table table-striped table-bordered">
						<tbody>
							<tr>
								<td>시작일</td>
								<td><input type="text" id="calendar_begin" placeholder="클릭하여 선택"></td>
							</tr>
							<tr>
								<td>종료일</td>
								<td><input type="text" id="calendar_end" placeholder="클릭하여 선택"></td>
							</tr>
							<tr>
								<td>메뉴</td>
								<td>3명</td>
							</tr>
							<tr>
								<td>금액</td>
								<td>50,000원</td>
							</tr>
						</tbody>
					</table>
				</div>
				<br>
				<div role="group" aria-label="..." class="btn-group btn-group-justified">
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-lg btn-primary">조회</button>
					</div>
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-lg btn-danger">초기화</button>
					</div>
				</div>
			</div>
		</div>
	</div>	

	
<%-- 		<script type="text/javascript"
		src="<c:url value="/assets/plugins/jquery/jquery-migrate.min.js"/>"></script>
	<!--/wrapper-->
	<!-- JS Global Compulsory -->
	<script type="text/javascript"
		src="<c:url value="/assets/plugins/jquery/jquery.min.js"/>"></script> --%>
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