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

<script language="JavaScript" src="../js/common/findIdJs.js"></script>

</head>

<body>
	<jsp:include page="header.jsp" flush="false" />

	<!--=== Content Part ===-->
	<div class="container">
		<!--Reg Block-->
		<div class="reg-block">
			<div class="reg-block-header">
				<h2>아이디 / 패스워드 찾기</h2>				
			</div>
			<div>
				<form action="findId.do" method="post" name="findIdForm">
				<h3>아이디 찾기</h3>
				<div class="input-group margin-bottom-10">
					<span class="input-group-addon"><i class="icon-users"></i></span>
					<input type="text" class="form-control" name="userName" placeholder="이름">
				</div>
				<div class="input-group margin-bottom-20">
					<span class="input-group-addon"><i class="icon-envelope-open"></i></span>
					<input type="text" class="form-control" name="userEmail" placeholder="이메일 주소">					
				</div>
				<c:if test="${userId != null}">
					<div>
						ID 검색 결과 : ${userId}
					</div>
				</c:if>
				<div class="row">
					<div class="col-md-10 col-md-offset-1">
						<button type="submit" class="btn-u btn-block" onclick="checkFindId()">아이디 찾기</button>
					</div>
				</div>
				</form>	
			</div>
			<p>
			<div>
				<form action="findPw.do" method="post" name="findPwForm">
					<h3>패스워드 찾기</h3>
					<div class="input-group margin-bottom-10">
						<span class="input-group-addon"><i class="icon-users"></i></span>
						<input type="text" class="form-control" name="userId" placeholder="ID">
					</div>
					<div class="input-group margin-bottom-20">
						<span class="input-group-addon"><i class="icon-envelope-open"></i></span>
						<input type="text" class="form-control" name="userEmail" placeholder="이메일 주소">
					</div>
					<div class="row">
						<div class="col-md-10 col-md-offset-1">
							<button type="submit" class="btn-u btn-block" onclick="checkFindPw()">패스워드 찾기</button>
						</div>
					</div>
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
