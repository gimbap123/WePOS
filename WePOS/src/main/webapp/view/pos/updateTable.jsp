<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
	response.setHeader("pragma","No-cache");
	response.setHeader("Cache-Control","no-cache");
	response.addHeader("Cache-Control","No-store");
	response.setDateHeader("Expires",0);
%>

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
<script language="JavaScript" src="../js/pos/updateTable.js?ver=3"></script>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
</head>

<body>
	<div class="wrapper">
		<!--=== Header v7 Left ===-->
		<jsp:include page="../pos/leftBar.jsp" flush="false" />

		<div class="content-side-right">
			<div class="content-wrapper" style="margin-right: 270px; padding: 20px;padding-top:0">
				<nav class="navbar mCustomScrollbar" role="navigation"
						data-mcs-theme="minimal-dark">
					<div class="breadcrumbs-v3 img-v1" style="background:url(../image/common/updateTable.jpg);background-size: cover;
		  																				background-position: center;height:30px">
						<div class="container text-center" style="width:100%">
							<h1>테이블 관리</h1>
						</div>
					</div>
					<hr>
					<section class="content" style="padding-top:0">
						<span style="float:right;margin-right:20px">
							<button class="btn btn-success" type="button" onclick="create()">테이블 추가</button>
						</span>
						<c:if test="${tableCount>0}">
							<button class="btn btn-primary" type="button">
								총 테이블 <span class="badge">${tableCount}</span>
							</button>
						</c:if>
						<c:if test="${tableCount==0}">
							<button class="btn btn-primary" type="button">
								총 테이블 <span class="badge">0</span>
							</button>
						</c:if>
						<br>
						<c:if test="${tableCount>0}">
							<c:forEach var="i" begin="0" end="${tableCount-1}">
								<div class="panel panel-success pos-table" data-toggle="modal"
									data-target="#orderModal">
									<div class="panel-heading">
										<h3 class="panel-title" id="panel-title">
											<a role="button" class="anchorjs-link" href="#panel-title">
												<span class="anchorjs-icon">${tables[i].tableName}
													<c:if test="${tables[i].tableState eq '1'.charAt(0)}">
														- 사용중
													</c:if>
												</span>												
											</a>
												<span class="badge pull-right" style="margin-top:4px">${tables[i].tableMax}인</span>
										</h3>
									</div>
									<div class="panel-body panel-updateTable" align="center">
										<span style="float:right">
											<input type="button" class="btn btn-success" value="수정"
												onclick="tableInfo('${tables[i].tableCode}','${tables[i].tableName}','${tables[i].tableDesc}','${tables[i].tableMax}')">						
											<input type="button" class="btn btn-danger" value="삭제"
												onclick="deleteTable('${tables[i].tableCode}','${tables[i].tableState}','${sessionScope.id}')">
										</span>
									</div>
								</div>				
							</c:forEach>
						</c:if>
						<c:if test="${tableCount==0}">
							<h1 align="center">등록된 테이블이 없습니다.</h1>
						</c:if>	
					</section>
				</nav>
		</div>
		<div class="pos-right" style="margin-top:62px">
			<div class="pos-status">
				<div class="panel panel-default panel-warning">
					<!-- Default panel contents -->
					<!-- Table -->
					<div class="panel-heading" align="center"><h3 id="tableInfoTag">테이블 정보</h3></div>					
					<form id="updateTableForm" name="updateTableForm" action="updateTable.do?mgrId=${sessionScope.id}" method="post">
						<input type="hidden" id="tableCode" name="tableCode" value="">
						<table class="table table-striped table-bordered">
							<tbody>
								<tr>
									<th style="text-align:center;vertical-align:middle;width:90px;height:41px">날짜</th>
									<td style="text-align:center;vertical-align:middle"><span id="realTime"></span></td>
								</tr>								
								<!-- <tr>
									<th style="text-align:center;vertical-align:middle;width:90px;height:41px">고유번호</th>
									<th>
										<input type="text" id="tableCode" name="tableCode" value="" size="15px" style="border:0" readonly>
									</th>
								</tr> -->
								<tr>
									<th style="text-align:center;vertical-align:middle;width:90px">테이블 이름</th>
									<td>
										<input type="text" id="tableName" name="tableName" value="" size="15px" style="text-align:center">
									</td>
								</tr>
								<tr>
									<th style="text-align:center;vertical-align:middle;width:90px">테이블 설명</th>
									<td>
										<input type="text" id="tableDesc" name="tableDesc" value="" size="15px" style="text-align:center">
									</td>
								</tr>
								<tr>
									<th style="text-align:center;vertical-align:middle;width:90px">정원</th>
									<td>
										<input type="text" id="tableMax" name="tableMax" value="" size="15px" style="text-align:center">
									</td>
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
						<button type="button" class="btn btn-lg btn-primary" 
									onclick="location.href='updateTableView.do?mgrId=${sessionScope.id}'">취소</button>
					</div>
				</div>
			</div>
			<!-- End Owl Clients v1 -->
		</div>
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