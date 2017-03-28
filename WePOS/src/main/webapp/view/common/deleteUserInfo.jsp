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
<link rel="stylesheet" href="../assets/css/pages/page_log_reg_v2.css?ver=2">

<script>
	function check(){
		if($('#agreement').is(":checked")==false)
		{
			alert("안내사항에 동의해 주세요");
			return false;
		}else{
			$('#deleteForm').submit();
		}
	}
</script>

</head>

<body>
	<jsp:include page="header.jsp" flush="false" />

	<!--=== Content Part ===-->
	<div class="container">
		<!--Reg Block-->
		<div class="reg-block-cus1">
			<div class="reg-block-header">
				<h2>회원탈퇴</h2>
				<p>
					회원탈퇴를 신청하시기 전에 안내사항을 꼭 확인해주세요.
				</p>
			</div>
			<ul>
				<li>사용하고 계신 아이디(${sessionScope.id})는 탈퇴할 경우 재사용 및 복구가 불가능합니다.</li><br>
				<li>탈퇴 후 회원정보 및 서비스 이용기록은 모두 삭제됩니다.</li><br>
				<li>회원 정보는 탈퇴 즉시 삭제되며, 별도의 용도로 사용되지 않습니다.</li><br>
				<li>예약 내역이 있다면 확인해주세요.</li><br>
				<li>탈퇴 후에는 아이디 <font color="red">${sessionScope.id}</font> 로 다시 가입할 수 없으며 아이디와 데이터는 복구할 수 없습니다.</li>
			</ul>
			<%-- <h4 align="center">사용하고 계신 아이디(${sessionScope.id})는 탈퇴할 경우 재사용 및 복구가 불가능합니다.</h4>
			<h4 align="center">탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.</h4> --%>
			<hr>
			<div class="checkbox" align="center">
					<label> <input type="checkbox" id="agreement"> 
						안내 사항을 모두 확인하였으며, 이에 동의합니다.
					</label>
				</div>
			<div class="row">
			<form id="deleteForm" action="deleteUserInfoProcess.do?userId=${sessionScope.id}" method="post">
				<span class="col-md-5 col-md-offset-1">
					<button type="button" class="btn-u btn-block" onclick="history.back()">취소</button>
				</span>
				<span class="col-md-5 col-md-offset-0">
					<button type="button" class="btn-u btn-block" onclick="check()">회원탈퇴</button>
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
