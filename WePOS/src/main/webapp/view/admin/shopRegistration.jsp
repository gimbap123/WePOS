<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
<link rel="stylesheet" href="../assets/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="../assets/css/style.css">

<!-- CSS Header and Footer -->
<link rel="stylesheet" href="../assets/css/headers/header-default.css">

<!-- CSS Implementing Plugins -->
<link rel="stylesheet" href="../assets/plugins/animate.css">
<link rel="stylesheet" href="../assets/plugins/line-icons/line-icons.css">
<link rel="stylesheet" href="../assets/plugins/font-awesome/css/font-awesome.min.css">

<!-- CSS Page Style -->
<link rel="stylesheet" href="../assets/css/pages/page_log_reg_v2.css">

<script language="JavaScript" src="../js/admin/shopRegistrationJs.js"></script>

</head>

<body>
	<jsp:include page="../common/header.jsp" flush="false" />

	<!--=== Content Part ===-->
	<div class="container">
		<!--Reg Block-->
		<div class="reg-block">
			<div class="reg-block-header">
				<h2>매장 추가</h2>				
			</div>			
			<form name="shopRegForm" action="shopRegistration.do" method="post">
				<div class="input-group margin-bottom-10">
					<span class="input-group-addon"><i class="icon-user-follow"></i></span>
					<input type="text" id="shopName" name="shopName" class="form-control" placeholder="매장 이름">
				</div>
				<div class="input-group margin-bottom-10">
					<span class="input-group-addon"><i class="icon-star"></i></span>					
					<select class="form-control" id="shopTypeCode" name="shopTypeCode">
						<option value="0">매장 종류를 선택하세요.</option>
						<c:forEach items="${shopTypeList}" var="shopType">
							<option value="${shopType.shopTypeCode}">${shopType.shopTypeName}</option>						
						</c:forEach>
					</select>
				</div>	
				<div class="input-group margin-bottom-10">
					<span class="input-group-addon"><i class="icon-star"></i></span>					
					<select class="form-control" id="cityCode" name="cityCode" onchange="searchLocal()">
						<option value="0">지역을 선택하세요.</option>
						<c:forEach items="${cityList}" var="city">
							<option value="${city.cityCode}">${city.cityName}</option>
						</c:forEach>
					</select>
					<select class="form-control" id="localCode" name="localCode" >
						<option value="0">시, 군을 선택하세요.</option>
					</select>
				</div>	
				<div class="input-group margin-bottom-10">
					<span class="input-group-addon"><i class="icon-star"></i></span>					
					<input 	type="text" id="shopAddress" name="shopAddress" class="form-control" placeholder="나머지 주소" >
				</div>
				<div class="input-group margin-bottom-10">
					<span class="input-group-addon"><i class="icon-star"></i></span>					
					<input 	type="text" id="shopDesc" name="shopDesc" class="form-control" placeholder="매장 설명" >
				</div>			
				<hr>
				<div class="row">
					<div class="col-md-10 col-md-offset-1">
						<input type="button" id="ok" class="btn-u btn-block"  value="추가하기" onclick="checkShopRegistration()">
					</div>
				</div>
			</form>
		</div>
		<!--End Reg Block-->
	</div>
	<!--/container-->
	<!--=== End Content Part ===-->

	<!-- JS Global Compulsory -->
	<script type="text/javascript"
		src="../assets/plugins/jquery/jquery.min.js"></script>
	<script type="text/javascript"
		src="../assets/plugins/jquery/jquery-migrate.min.js"></script>
	<script type="text/javascript"
		src="../assets/plugins/bootstrap/js/bootstrap.min.js"></script>
	<!-- JS Implementing Plugins -->
	<script type="text/javascript" src="../assets/plugins/back-to-top.js"></script>
	<script type="text/javascript"
		src="../assets/plugins/backstretch/jquery.backstretch.min.js"></script>	
	<!-- JS Page Level -->
	<script type="text/javascript" src="../assets/js/app.js"></script>
	<script type="text/javascript">
    jQuery(document).ready(function() {
        App.init();
        });
</script>
	<script type="text/javascript">
    $.backstretch([
      "../assets/img/bg/9.jpg",
      "../assets/img/bg/11.jpg",
      ], {
        fade: 1000,
        duration: 5000
    });
</script>

</body>
</html>