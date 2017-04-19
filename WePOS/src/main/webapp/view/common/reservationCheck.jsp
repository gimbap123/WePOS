<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet" href="../assets/css/footers/footer-v1.css">

<!-- CSS Implementing Plugins -->
<link rel="stylesheet" href="../assets/plugins/animate.css">
<link rel="stylesheet" href="../assets/plugins/line-icons/line-icons.css">
<link rel="stylesheet" href="../assets/plugins/font-awesome/css/font-awesome.min.css">

<!-- CSS Page Style -->
<link rel="stylesheet" href="../assets/css/pages/page_log_reg_v2.css">

<!-- 달력 추가 -->
<link rel="stylesheet" href="../assets/plugins/sky-forms-pro/skyforms/css/sky-forms.css">
<link rel="stylesheet" href="../assets/plugins/sky-forms-pro/skyforms/custom/custom-sky-forms.css">

<script language="JavaScript" src="../js/common/reservation.js?ver=3"></script>

</head>

<body>
	<jsp:include page="header.jsp" flush="false" />

	<!--=== Content Part ===-->
	<div class="container">
		<!--Reg Block-->
		<div class="reg-block">
			<div class="reg-block-header">
				<h2>예약내역 확인</h2>	
			</div>
			
			 <form id="updateResForm" name="updateResForm" action="reservationCheck.do" method="post">
			  <%-- <input type="hidden" id="userId" name="userId" value="${sessionScope.id }"> --%>
			  <input type="hidden" id="reseNumber" name="reseNumber" value="${reservationCheckDto.reseNumber}">
              <input type="hidden" id="shopCode" name="shopCode" value="${reservationCheckDto.shopCode}">
				<div class="input-group margin-bottom-10">
					<span class="input-group-addon">예약자명</span>
					<input type="text" id="userId" name="userId" class="form-control" value="${sessionScope.id }" readOnly>
				</div>
				<div class="input-group margin-bottom-10">
					<span class="input-group-addon">매장코드</span>					
					<input type="text" id="shopCodes"  name="shopCodes" class="form-control" value="${ShopNameDto.shopName}" readOnly >
				</div>
				<div class="input-group margin-bottom-10">
					<span class="input-group-addon">예약인원</span>
													<select class="form-control" id="resPersons" name="resPersons" >
														<%-- <option value="" disabled selected hidden>${reservationCheckDto.resPersons }명</option> --%>
	                                                	<c:forEach var="i" begin="1" end="30" step="1">
	                                                		<c:if test="${reservationCheckDto.resPersons != i}">
															<option value="${i}">${i}명</option>
															</c:if>
															<c:if test="${reservationCheckDto.resPersons == i}">
															<option value="${i}" selected="selected">${i }명</option>													
															</c:if>
														</c:forEach>
													</select>
				</div>
				<div class="input-group margin-bottom-10">
					<span class="input-group-addon">예약날짜</span>
					<input type="text" id="start" name="resDate" class="form-control" value="${reservationCheckDto.resDate }">
				</div>
				<div class="input-group margin-bottom-10">
					<span class="input-group-addon">예약시간</span>
													<select class="form-control" id="startHourType" name="startHourType">
														<c:if test="${HoursType eq 'am'}">
															<option value="am" selected="selected">AM</option>
															<option value="pm">PM</option>
														</c:if>
														<c:if test="${HoursType eq 'pm'}">
															<option value="am">AM</option>
															<option value="pm" selected="selected">PM</option>
														</c:if>
													</select>
													<select class="form-control" id="startHour" name="startHour">	
														<%-- <option value="" disabled selected hidden>${HoursType }</option> --%>							
		                                            	<%-- <option value="0">${Hours }시</option> --%>
														<c:forEach var="i" begin="1" end="12" step="1">
															<c:if test="${i < 10}">
																<c:set var="i" value="0${i}" />
															</c:if>
															<c:if test="${Hours == i}">
																<option value="${i}" selected="selected">${i }시</option>													
															</c:if>						
															<c:if test="${Hours != i}">
																<option value="${i}">${i}시</option>	
															</c:if>
														</c:forEach>		
													</select>
													<select class="form-control" id="startMinute" name="startMinute">
														<%-- <option value="" disabled selected hidden>${Minute }분</option>	 --%>	
		                                            	<%-- <option value="0">${Minute }분</option> --%>
														<c:forEach var="i" begin="0" end="59" step="1">
															<c:if test="${i < 10}">
																<c:set var="i" value="0${i}" />
															</c:if>
															<c:if test="${Minute == i}">
																<option value="${i}" selected="selected">${i }분</option>													
															</c:if>	
															<c:if test="${Minute != i}">						
																<option value="${i}">${i}분</option>	
															</c:if>
														</c:forEach>					
													</select>
				</div>
				<div class="input-group margin-bottom-10">
					<span class="input-group-addon">주문내역</span>
					<input type="text" id="resDesc" name="resDesc" class="form-control" value="${reservationCheckDto.resDesc}">
				</div>
				<div class="input-group margin-bottom-10">
					<span class="input-group-addon">예약상태</span>
					<input type="text" id="resState" name="resState" class="form-control" value="${resState}" readonly>
				</div>
				<hr>
		
				<div class="row">
					<span class="col-md-4 col-md-offset-0">
						<input type="button" id="cancel" class="btn-u btn-block" onclick="history.back()" value="취 소" float="left">
					</span>
					<span class="col-md-4 col-md-offset-0">
						<input type="button" id="cancel" class="btn-u btn-block" onclick="deleteRes()" value="삭 제" >
					</span>
					<span class="col-md-4 col-md-offset-0">
						<input type="button" id="ok" class="btn-u btn-block" onclick="updateRes()" value="수 정" float="right">
					</span>
				</div>
			</form>
		</div>
		<!--End Reg Block-->
	</div>
	<!--/container-->
	<!--=== End Content Part ===-->

	<!-- JS Global Compulsory -->
	<script type="text/javascript" src="../assets/plugins/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="../assets/plugins/jquery/jquery-migrate.min.js"></script>
	<script type="text/javascript" src="../assets/plugins/bootstrap/js/bootstrap.min.js"></script> 
	<!-- JS Implementing Plugins -->
	<script type="text/javascript" src="../assets/plugins/back-to-top.js"></script>
	<script type="text/javascript" src="../assets/plugins/backstretch/jquery.backstretch.min.js"></script>
	<script type="text/javascript" src="../assets/plugins/smoothScroll.js"></script>
	<!-- 추가  -->
	<script src="../assets/plugins/sky-forms-pro/skyforms/js/jquery.maskedinput.min.js"></script>
	<script src="../assets/plugins/sky-forms-pro/skyforms/js/jquery-ui.min.js"></script>
	<script src="../assets/plugins/sky-forms-pro/skyforms/js/jquery.validate.min.js"></script>
	<!-- JS Customization -->
	<script type="text/javascript" src="../assets/js/custom.js"></script>
	<!-- JS Page Level -->
	<script type="text/javascript" src="../assets/js/app.js"></script>
	<script type="text/javascript" src="../assets/js/plugins/datepicker.js"></script>
	<script type="text/javascript">
    jQuery(document).ready(function() {
        App.init();
        Datepicker.initDatepicker();
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