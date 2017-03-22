<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	href="../assets/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="../assets/css/style.css">

<!-- CSS Header and Footer -->
<link rel="stylesheet" href="../assets/css/headers/header-default.css">

<!-- CSS Implementing Plugins -->
<link rel="stylesheet" href="../assets/plugins/animate.css">
<link rel="stylesheet" href="../assets/plugins/line-icons/line-icons.css">
<link rel="stylesheet"
	href="../assets/plugins/font-awesome/css/font-awesome.min.css">

<!-- CSS Page Style -->
<link rel="stylesheet" href="../assets/css/pages/page_log_reg_v2.css">

<!-- CSS Customization -->
<link rel="stylesheet" href="../assets/css/custom.css">

<script>
	if(${result}==1){
		alert("회원가입에 성공했습니다.");
	}
		
	
	else{
		alert("회원가입에 실패했습니다.");
		response.sendRedirect("/common/registration.do");
	}	
	
	function checkLogin()
	{
		var id = document.loginForm.id.value;
		var password = document.loginForm.password.value;
		
		if(id == "" || password == "")
		{
			alert("아이디와 패스워드를 입력하세요.");
			return false;	
		}
		document.loginForm.submit();
	}
</script>

</head>

<body onload="document.loginForm.userId.focus()">
	<jsp:include page="../common/header.jsp" flush="false" />

	<!--=== Content Part ===-->
	<div class="container">
		<!--Reg Block-->
		<div class="reg-block">
			<div class="reg-block-header">
				<h2>로그인</h2>
			</div>
			
			<form name="loginForm" action="login.do" method="post">
				<div class="input-group margin-bottom-20">
					<span class="input-group-addon"><i class="icon-user"></i></span>
					<input type="text" name="id" class="form-control" placeholder="ID">
				</div>
				<div class="input-group margin-bottom-30">
					<span class="input-group-addon"><i class="fa fa-key"></i></span>
					<input type="text" name="password" class="form-control" placeholder="패스워드">
				</div>
				<div class="checkbox">
					<label> <input type="checkbox">
						<p>로그인 유지</p>
					</label>
				</div>
				<span class="input-group-addon">
					<a class="color-green" href="registration.do">회원가입</a>
				</span>
				<span class="input-group-addon">
					<a class="color-green" href="findIdPw.do">아이디 / 패스워드 찾기</a>
				</span>
	
				<hr>
				<div class="row">
					<div class="col-md-10 col-md-offset-1">
						<button type="button" class="btn-u btn-block" onclick="checkLogin()">로그인</button>										
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
      "../assets/img/bg/16.jpg",
      "../assets/img/bg/25.jpg",
      ], {
        fade: 1000,
        duration: 3000
    });
</script>
	<!--[if lt IE 9]>
    <script src="assets/plugins/respond.js"></script>
    <script src="assets/plugins/html5shiv.js"></script>
    <script src="assets/plugins/placeholder-IE-fixes.js"></script>
<![endif]-->

</body>
</html>
