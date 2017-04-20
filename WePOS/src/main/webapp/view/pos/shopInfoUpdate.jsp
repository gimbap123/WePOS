<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet"	href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<link rel="stylesheet"	href="../assets/plugins/scrollbar/css/jquery.mCustomScrollbar.css">

<!-- Favicon -->
<link rel="shortcut icon" href="favicon.ico">

<!-- Web Fonts -->
<link rel="stylesheet"	href="//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin">

<!-- CSS Global Compulsory -->
<link rel="stylesheet" href="../assets/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="../assets/css/style.css">

<!-- CSS Header and Footer -->
<link rel="stylesheet"	href="../assets/css/headers/header-v7.css">
<link rel="stylesheet"	href="../assets/css/footers/footer-v1.css">

<!-- CSS Implementing Plugins -->
<link rel="stylesheet" href="../assets/plugins/animate.css">
<link rel="stylesheet" href="../assets/plugins/line-icons/line-icons.css">
<link rel="stylesheet" href="../assets/plugins/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="../assets/plugins/scrollbar/css/jquery.mCustomScrollbar.css">

<!-- CSS Page Style -->
<link rel="stylesheet" href="../assets/css/pages/page_log_reg_v2.css">

<!-- CSS Customization -->
<link rel="stylesheet"	href="../assets/css/custom.css">

<script language="JavaScript" src="../js/pos/shopInfoUpdateJs.js"></script>

<title>WePOS</title>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="../pos/leftBar.jsp" flush="false" />
				
		<div class="content-side-right">
			<div class="content" style="padding: 0px 20px; margin-right: 270px;">
				<div class="breadcrumbs-v3 img-v1" style="background: url(../image/common/posLog.jpg); 	background-size: cover; background-position: center center;height: 30px">
					<div class="container text-center" style="width: 100%">
						<h1>매장 정보</h1>
					</div>					
				</div>						
			<section class="content" style="padding-top: 0px;">
				<!--Reg Block-->
				<div class="reg-block" style="width: 80%;">
					<div class="reg-block-header">
						<h2>매장 정보 수정</h2>				
					</div>
					<form name="shopInfoUpdateForm" action="shopInfoUpdate.do" method="post" enctype="multipart/form-data">
						<input type="hidden" name="shopCode" value="${shop.shopCode}">
						<div class="input-group margin-bottom-10">
							<span class="input-group-addon"><i class="icon-user-follow"></i></span>
							<input type="text" id="shopName" name="shopName" class="form-control" value="${shop.shopName}">
						</div>
						<div class="input-group margin-bottom-10">
							<span class="input-group-addon"><i class="icon-star"></i></span>		
							<select class="form-control" id="shopTypeCode" name="shopTypeCode">
								<option value="0">매장 종류를 선택하세요.</option>
								<c:forEach items="${shopTypeList}" var="shopType">
									<c:if test="${shopType.shopTypeCode == shop.shopTypeCode}">
										<option value="${shopType.shopTypeCode}" selected="selected">${shopType.shopTypeName}</option>
									</c:if>
									<c:if test="${shopType.shopTypeCode != shop.shopTypeCode}">
										<option value="${shopType.shopTypeCode}">${shopType.shopTypeName}</option>
									</c:if>															
								</c:forEach>
							</select>
						</div>	
						<div class="input-group margin-bottom-10">
							<span class="input-group-addon"><i class=" icon-pin"></i></span>					
							<select class="form-control" id="cityCode" name="cityCode" onchange="searchLocal()">
								<option value="0">지역을 선택하세요.</option>
								<c:forEach items="${cityList}" var="city">
									<c:if test="${city.cityCode == shop.cityCode}">
										<option value="${city.cityCode}" selected="selected">${city.cityName}</option>
									</c:if>
									<c:if test="${city.cityCode != shop.cityCode}">
										<option value="${city.cityCode}">${city.cityName}</option>
									</c:if>					
								</c:forEach>
							</select>
							<select class="form-control" id="localCode" name="localCode" >
								<option value="0">시, 군을 선택하세요.</option>
								<c:forEach items="${localList}" var="local">
									<c:if test="${local.localCode == shop.localCode}">
										<option value="${local.localCode}" selected="selected">${local.localName}</option>
									</c:if>
									<c:if test="${local.localCode != shop.localCode}">
										<option value="${local.localCode}">${local.localName}</option>
									</c:if>
								</c:forEach>
							</select>
						</div>	
						<div class="input-group margin-bottom-10">
							<span class="input-group-addon"><i class=" icon-pin"></i></span>					
							<input 	type="text" id="shopAddress" name="shopAddress" class="form-control" value="${shop.shopAddress}">
						</div>
						<div class="input-group margin-bottom-10">
							<span class="input-group-addon"><i class="icon-screen-smartphone"></i></span>
							<input type="text" id="shopPhone" name="shopPhone" class="form-control" value="${shop.shopPhone}">
						</div>
						<div class="input-group margin-bottom-10">
							<span class="input-group-addon"><i class="icon-speech"></i></span>									
							<input 	type="text" id="shopDesc" name="shopDesc" class="form-control" value="${shop.shopDesc}" >
						</div>
						<div class="input-group margin-bottom-10">
							<span class="input-group-addon"><i class="icon-clock" ></i></span>
							<div class="row">						
								<div class="col-md-4">
									<select class="form-control" id="startHourType" name="startHourType">
										<c:if test="${businessHours.startHourType eq 'am'}">
											<option value="am" selected="selected">AM</option>
											<option value="pm">PM</option>
										</c:if>
										<c:if test="${businessHours.startHourType eq 'pm'}">
											<option value="am">AM</option>
											<option value="pm" selected="selected">PM</option>
										</c:if>										
									</select>
								</div>
								<div class="col-md-4">
									<select class="form-control" id="startHour" name="startHour">								
										<c:forEach var="i" begin="1" end="12" step="1">
											<c:if test="${i < 10}">
												<c:set var="i" value="0${i}" />
											</c:if>
											
											<c:if test="${businessHours.startHour == i}">
												<option value="${i}" selected="selected">${i}</option>		
											</c:if>	
											<c:if test="${businessHours.startHour != i}">
												<option value="${i}">${i}</option>		
											</c:if>																	
										</c:forEach>		
									</select>
								</div>
								<div class="col-md-4">
									<select class="form-control" id="startMinute" name="startMinute">
										<c:forEach var="i" begin="0" end="59" step="1">
											<c:if test="${i < 10}">
												<c:set var="i" value="0${i}" />
											</c:if>
											
											<c:if test="${businessHours.startMinute == i}">
												<option value="${i}" selected="selected">${i}</option>		
											</c:if>	
											<c:if test="${businessHours.startMinute != i}">
												<option value="${i}">${i}</option>		
											</c:if>																
										</c:forEach>					
									</select>
								</div>				
							</div>
							<div class="row">						
								<div class="col-md-4">
									<select class="form-control" id="endHourType" name="endHourType">
										<c:if test="${businessHours.endHourType eq 'am'}">
											<option value="am" selected="selected">AM</option>
											<option value="pm">PM</option>
										</c:if>
										<c:if test="${businessHours.endHourType eq 'pm'}">
											<option value="am">AM</option>
											<option value="pm" selected="selected">PM</option>
										</c:if>	
									</select>
								</div>
								<div class="col-md-4">
									<select class="form-control" id="endHour" name="endHour">
										<c:forEach var="i" begin="1" end="12" step="1">
											<c:if test="${i < 10}">
												<c:set var="i" value="0${i}" />
											</c:if>
											
											<c:if test="${businessHours.endHour == i}">
												<option value="${i}" selected="selected">${i}</option>		
											</c:if>	
											<c:if test="${businessHours.endHour != i}">
												<option value="${i}">${i}</option>		
											</c:if>						
										</c:forEach>				
									</select>
								</div>
								<div class="col-md-4">
									<select class="form-control" id="endMinute" name="endMinute">
										<c:forEach var="i" begin="0" end="59" step="1">
											<c:if test="${i < 10}">
												<c:set var="i" value="0${i}" />
											</c:if>
											
											<c:if test="${businessHours.endMinute == i}">
												<option value="${i}" selected="selected">${i}</option>		
											</c:if>	
											<c:if test="${businessHours.endMinute != i}">
												<option value="${i}">${i}</option>		
											</c:if>																		
										</c:forEach>				
									</select>
								</div>
							</div>
						</div>
						<div class="input-group margin-bottom-10">
							<span class="input-group-addon"><i class="icon-docs"></i></span>
							<c:if test="${shop.shopFile == null}">
								첨부된 파일이 없습니다.
							</c:if>
							<c:if test="${shop.shopFile != null}">
								<input type="text" class="form-control" id="shopFile" name="shopFile" value="${shop.shopFile}" readonly="readonly">
							</c:if>
						</div>
						<div class="input-group margin-bottom-30">
							<span class="input-group-addon"><i class="icon-docs"></i></span>
							<input type="file" class="form-control" name="upload">
						</div>	
						<div class="row">
							<div class="col-md-10 col-md-offset-1">
								<input type="button" id="ok" class="btn-u btn-block"  value="수정하기" onclick="checkShopInfoUpdate()">
							</div>
						</div>
					</form>
				</div>
				<!--End Reg Block-->
			</section>				
			</div>
		</div>
	
	</div>
	
<!-- JS Global Compulsory -->           
<script type="text/javascript" src="../assets/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript" src="../assets/plugins/jquery/jquery-migrate.min.js"></script>
<script type="text/javascript" src="../assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- JS Implementing Plugins -->
<script type="text/javascript" src="../assets/plugins/back-to-top.js"></script>
<script type="text/javascript" src="../assets/plugins/jquery-appear.js"></script>
<script type="text/javascript" src="../assets/plugins/smoothScroll.js"></script>
<script type="text/javascript" src="../assets/plugins/scrollbar/js/jquery.mCustomScrollbar.concat.min.js"></script>
<!-- JS Page Level -->
<script type="text/javascript" src="../assets/js/app.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function() {
		App.init();
	});
</script>
</body>
</html>