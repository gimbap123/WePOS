<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- Favicon -->
<link rel="shortcut icon" href="favicon.ico">

<!-- Web Fonts -->
<link rel='stylesheet' type='text/css'
	href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin'>

<!-- CSS Global Compulsory -->
<link rel="stylesheet"
	href="../assets/plugins/bootstrap/css/bootstrap.min.css?ver=1">
<link rel="stylesheet" href="../assets/css/style.css">

<!-- CSS Header and Footer -->
<link rel="stylesheet" href="../assets/css/headers/header-default.css">

<!-- CSS Implementing Plugins -->
<link rel="stylesheet" href="../assets/plugins/animate.css">
<link rel="stylesheet" href="../assets/plugins/line-icons/line-icons.css">
<link rel="stylesheet"
	href="../assets/plugins/font-awesome/css/font-awesome.min.css">

<!-- CSS Page Style -->
<link rel="stylesheet" href="../assets/css/pages/page_log_reg_v2.css?ver=11">

<script>
	function check(){
		if($('#agreement').is(":checked")==false)
		{
			alert("이용약관에 동의해 주세요");
			return false;
		}else{
			$('#deleteForm').submit();
		}
	}
</script>

</head>

<body>
	
	<!--=== Content Part ===-->
	<div class="container">
		
		<!--Reg Block-->
		<div class="reg-block-cus2">
			<div align="center">
				<a class="logo" href="../common/main.do"> <img src="../image/common/logo.png"
				alt="Logo">
				</a>
			</div>
			<hr>
			<div class="reg-block-header">
				<h2>개인 가입 약관 동의</h2>
				<p>
					서비스 약관 및 개인정보 수집, 이용에 <font color="blue">동의</font>해 주세요.
				</p>
			</div>
			<h3 style="margin-left:20px">Wepos 서비스 약관 동의</h3>
			<div class="terms">			
				<jsp:include page="termsContent.jsp" flush="false" />
				</p>
			</div>
			<h3 style="margin-left:20px">Wepos 개인정보 수집 및 동의</h3>
			<div class="terms">			
				<jsp:include page="termsContent1.jsp" flush="false" />
				</p>
			</div>
			<hr>
			<div class="checkbox" align="center">
					<label> <input type="checkbox" id="agreement"> 
						안내 사항을 모두 확인하였으며, 이에 동의합니다.
					</label>
				</div>
			<div class="row">
			<form id="deleteForm" action="registration.do" method="get">
				<span class="input-group-addon"style="border:0px;position:relative">
					<a class="color-green" href="../common/main.do">이전으로</a>
				</span>
				<span class="input-group-addon" style="border:0px;position:relative">
					<button type="button" class="btn-u btn-large btn-u-blue" onclick="check()">동의하기</button>
				</span>
			</form>	
			</div>
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
	<!-- JS Customization -->
	<script type="text/javascript" src="../assets/js/custom.js"></script>
	<!-- JS Page Level -->
	<script type="text/javascript" src="../assets/js/app.js"></script>
	<script type="text/javascript">
    jQuery(document).ready(function() {
        App.init();
        });
</script>
	<script type="text/javascript">
    $.backstretch([
      "../assets/img/bg/16.jpg",
      "../assets/img/bg/25.jpg",
      ], {
        fade: 1000,
        duration: 3000
    });    
  
</script>

</body>
</html>
