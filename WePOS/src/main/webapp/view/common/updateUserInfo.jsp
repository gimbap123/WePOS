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

<script language="JavaScript" src="../js/common/updateUserInfoJs.js?v=1"></script>


</head>

<body>
	<jsp:include page="header.jsp" flush="false" />

	<!--=== Content Part ===-->
	<div class="container">
		<!--Reg Block-->
		<div class="reg-block">
			<div class="reg-block-header">
				<h2>회원정보 수정</h2>	
			</div>
			
			<form name="updateForm" action="updateUserInfo.do" method="post">
				<div class="input-group margin-bottom-10">
					<span class="input-group-addon"><i class="icon-user-follow"></i></span>
					<input type="text" id="userName" name="userName" class="form-control" value="${userInfo.userName}" readOnly>
				</div>
				<div class="input-group margin-bottom-10">
					<span class="input-group-addon"><i class="icon-star"></i></span>					
					<input 	type="text" id="userId"  name="userId" class="form-control" value="${userInfo.userId}" readOnly >
				</div>
				<div align="center">
					<span id="idCheck"></span>
				</div>
				<div class="input-group margin-bottom-10">
					<span class="input-group-addon"><i class="fa fa-lock"></i></span>
					<input type="password" id="userPassword" name="userPassword" class="form-control" placeholder="패스워드 (영문+숫자  8~12자리)" >
				</div>
				<div class="input-group margin-bottom-10">
					<span class="input-group-addon"><i class="fa fa-key"></i></span>
					<input type="password" id="userPassword1" name="userPassword1" class="form-control" placeholder="패스워드 확인">
				</div>
				<div class="input-group margin-bottom-10">
					<span class="input-group-addon"><i class="icon-screen-smartphone"></i></span>
					<input type="text" id="userPhone" name="userPhone" class="form-control" placeholder="연락처 (- 생략)" value="${userInfo.userPhone}">
				</div>
				<div class="input-group margin-bottom-10">
					<span class="input-group-addon"><i class="icon-envelope-open"></i></span>
					<input type="text" id="userEmail" name="userEmail" class="form-control" placeholder="이메일" value="${userInfo.userEmail}">
				</div>
				<hr>
				<div align="center">
				WePOS를 더 이상 사용하지 않는다면 &nbsp;&nbsp;
				<a href="memberLeave.do?userId=${sessionScope.id}">회원탈퇴</a>
				</div>
				<br>
		
				<div class="row">
					<span class="col-md-5 col-md-offset-1">
						<input type="button" id="cancel" class="btn-u btn-block" onclick="'" value="취 소" float="left">
					</span>
					<span class="col-md-5 col-md-offset-0">
						<input type="button" id="ok" class="btn-u btn-block" onclick="" value="수정하기" float="right">
					</span>
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