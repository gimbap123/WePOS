<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<script language="JavaScript" src="../js/common/registration.js"></script>


</head>

<body>
	<jsp:include page="header.jsp" flush="false" />

	<!--=== Content Part ===-->
	<div class="container">
		<!--Reg Block-->
		<div class="reg-block">
			<div class="reg-block-header">
				<h2>회원가입</h2>
				<p>
					이미 계정이 있으신가요? 
					<a class="color-green" href="login.do">로그인</a>
				</p>
			</div>
			
			<form name="regForm" action="registration.do" method="post">
				<div class="input-group margin-bottom-10">
					<span class="input-group-addon"><i class="icon-user-follow"></i></span>
					<input type="text" name="userName" class="form-control" placeholder="이름">
				</div>
				<div class="input-group margin-bottom-10">
					<span class="input-group-addon"><i class="icon-star"></i></span>					
					<input 	type="text" name="userId" class="form-control" placeholder="ID" onblur="checkId()">
				</div>
				<div align="center">
					<span id="idCheck"></span>
				</div>
				<div class="input-group margin-bottom-10">
					<span class="input-group-addon"><i class="fa fa-lock"></i></span>
					<input type="password" name="userPassword" class="form-control" placeholder="패스워드 (8자 이상 / 영문,숫자,특수기호 조합)">
				</div>
				<div class="input-group margin-bottom-10">
					<span class="input-group-addon"><i class="fa fa-key"></i></span>
					<input type="password" name="userPassword1" class="form-control" placeholder="패스워드 확인">
				</div>
				<div class="input-group margin-bottom-10">
					<span class="input-group-addon"><i class="icon-screen-smartphone"></i></span>
					<input type="text" name="userPhone" class="form-control" placeholder="연락처 (- 생략)">
				</div>
				<div class="input-group margin-bottom-10">
					<span class="input-group-addon"><i class="icon-envelope-open"></i></span>
					<input type="text" name="userEmail" class="form-control" placeholder="이메일">
				</div>
				<hr>
	
				<div class="checkbox">
					<label> <input type="checkbox" name="terms"> 
					<a target="_blank" href="page_terms.html">이용약관</a>에 동의합니다.
					</label>
				</div>
	
				<div class="row">
					<div class="col-md-10 col-md-offset-1">
						<input type="button" id="ok" class="btn-u btn-block" onclick="checkBlank()" value="가입하기">
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
      "../assets/img/bg/9.jpg",
      "../assets/img/bg/11.jpg",
      ], {
        fade: 1000,
        duration: 5000
    });
</script>

</body>
</html>