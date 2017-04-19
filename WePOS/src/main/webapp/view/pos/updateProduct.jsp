<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	href="<c:url value="/assets/css/custom.css?ver=123" /> ">
<link href="<c:url value="/assets/css/headers/header-v7.css"/>"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" href='<c:url value="/assets/css/pages/pricing/pricing_v1.css"/>'>
<script language="JavaScript" src="../js/pos/updateProduct.js?v=1"></script>
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
				
					<div class="breadcrumbs-v3 img-v1" style="background:url(../image/common/updateMenu.jpg);background-size: cover;
		  																				background-position: center;height:30px">
						<div class="container text-center" style="width:100%">
							<h1>메뉴 관리</h1>
						</div>
						<!--/end container-->
					</div>
					<hr>
					<span style="float: right; margin-right: 20px">
						<button class="btn btn-success" type="button" onclick="createProduct()">메뉴 추가</button>	
						<button class="btn btn-success" type="button" onclick="location.href='updateCategoryView.do?mgrId=${sessionScope.id}'">상품분류 관리</button>
					</span>
					<div class="row margin-bottom-40 pricing-table-v1" style="padding-top:20px">
						<c:if test="${fn:length(productList)>0}">
							<c:forEach var="i" begin="0" end="${fn:length(productList)-1}">
								<div class="col-md-3 col-sm-6">
					                <div class="pricing-v1 pricing-v1-blue">
					                	<c:if test="${fn:length(countOrder)>0}">
					                		<c:if test="${countOrder[i].countOrder!=null}">
							                    <div class="pricing-head" 
							                    		onclick="productInfo('${productList[i].productCode}','${productList[i].productName}','${productList[i].productPrice}','${productList[i].productStock}','${productList[i].productDesc}','${productList[i].categoryCode}','${countOrder[i].countOrder}', '${productList[i].productFile}')">
							                        <h3 class="text-center"><label style="color:#5cb85c">${productList[i].productName}</label></h3>
							                    </div>
						                    </c:if>
						                    <c:if test="${countOrder[i].countOrder==null}">
							                    <div class="pricing-head" 
							                    		onclick="productInfo('${productList[i].productCode}','${productList[i].productName}','${productList[i].productPrice}','${productList[i].productStock}','${productList[i].productDesc}','${productList[i].categoryCode}','0', '${productList[i].productFile}')">
							                        <h3 class="text-center"><label style="color:#5cb85c">${productList[i].productName}</label></h3>
							                    </div>
						                    </c:if>
					                    </c:if>
					                    <c:if test="${fn:length(countOrder)==0}">
						                    <div class="pricing-head" 
						                    		onclick="productInfo('${productList[i].productCode}','${productList[i].productName}','${productList[i].productPrice}','${productList[i].productStock}','${productList[i].productDesc}','${productList[i].categoryCode}','0', '${productList[i].productFile}')">
						                        <h3 class="text-center"><label style="color:#5cb85c">${productList[i].productName}</label></h3>
						                    </div>
					                    </c:if>
				                	</div>
					            </div>
							</c:forEach>
						</c:if>
						<c:if test="${fn:length(productList)==0}">
							<h1 align="center">등록된 메뉴가 없습니다.</h1>
						</c:if>	
					</div>
				</nav>
			</div>
		</div>
		
		<div class="pos-right" style="margin-top:62px;padding-top:0">
			<div class="pos-status">
				<div class="panel panel-default panel-warning">
					<!-- Default panel contents -->
					<!-- Table -->
					<div class="panel-heading" align="center"><h3 id="productInfoTag">메뉴 정보</h3></div>					
					<form id="updateProductForm" name="updateProductForm" action="updateProduct.do?mgrId=${sessionScope.id}" enctype="multipart/form-data" method="post" >
						<table class="table table-striped table-bordered">
							<tbody>
								<tr>
									<th style="text-align:center;vertical-align:middle;width:90px;height:41px">날짜</th>
									<td style="text-align:center;vertical-align:middle"><span id="realTime"></span></td>
								</tr>
								<tr>
									<th style="text-align:center;vertical-align:middle;width:90px;height:41px">매장 번호</th>
									<th>
										<input type="text" id="shopCode" name="shopCode" value="${shop.shopCode}" size="15px" style="text-align:center;border:0" readonly>
									</th>
								</tr>
								<tr>
									<th style="text-align:center;vertical-align:middle;width:90px;height:41px">상품 번호</th>
									<th>
										<input type="text" id="productCode" name="productCode" value="" size="15px" style="border:0" readonly>
									</th>
								</tr>
								<tr>
									<th style="text-align:center;vertical-align:middle;width:90px;height:41px">상품 분류</th>
									<th>
										<select class="form-control" id="categoryCode" name="categoryCode">
											<option value="999">선택하세요</option>
											<c:if test="${fn:length(categoryList)>0}">
												<c:forEach var="j" begin="0" end="${fn:length(categoryList)-1}">
													<option value="${categoryList[j].categoryCode}">
														<%-- ${categoryList[j].categoryCode==productList[j].categoryCode?'selected':''}> --%>
														${categoryList[j].categoryName}</option>
												</c:forEach>
											</c:if>	
									</select>
									</th>
								</tr>
								<tr>
									<th style="text-align:center;vertical-align:middle;width:90px">상품명</th>
									<td>
										<input type="text" id="productName" name="productName" value="" size="15px" style="text-align:center" 
											onchange="checkProductName()" disabled>
									</td>
								</tr>
								<tr>
									<th colspan=2 style="text-align:center;vertical-align:middle;width:90px;height:30px">
										<div id="checkNameTh"></div>
									</th>
								</tr>
								<tr>
									<th style="text-align:center;vertical-align:middle;width:90px">가 격</th>
									<td>
										<input type="text" id="productPrice" name="productPrice" value="" size="15px" style="text-align:center">
									</td>
								</tr>
								<tr>
									<th style="text-align:center;vertical-align:middle;width:90px">재 고</th>
									<td>
										<input type="text" id="productStock" name="productStock" value="" size="15px" style="text-align:center">
									</td>
								</tr>
								<tr>
									<th style="text-align:center;vertical-align:middle;width:90px">상품 설명</th>
									<td>
										<input type="text" id="productDesc" name="productDesc" value="" size="15px" style="text-align:center">
									</td>
								</tr>
								<tr>
									<th style="text-align:center;vertical-align:middle;width:90px">현재 주문량</th>
									<td>
										<input type="text" id="countOrder" name="countOrder" value="" size="15px" style="text-align:center;border:0" readonly>
									</td>
								</tr>
								<tr id="productFileTr" style="display: none;">
									<th style="text-align:center;vertical-align:middle;width:90px">첨부 파일</th>
									<td>
										<input type="text" id="productFile" name="productFile" value="" size="15px" style="text-align:center;border:0" readonly>										
									</td>
								</tr>
								<tr id="uploadTr" style="display: none;">				
									<td colspan="2">
										<input type="file" class="form-control" name="upload" >										
									</td>
								</tr>
							</tbody>
						</table>						
					</form>	
				</div>
				<br>
				<div role="group" aria-label="..."
					class="btn-group btn-group-justified">					
					<div class="btn-group" role="group" >
						<button type="button" class="btn btn-lg btn-danger" id="deleteButton"
									onclick="deleteProduct('${sessionScope.id}')" disabled>삭제</button>
					</div>
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-lg btn-primary" id="okButton" onclick="checkNull()" disabled>완료</button>
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