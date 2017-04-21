<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- Meta -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Favicon -->
<link rel="shortcut icon" href="favicon.ico">

<!-- Web Fonts -->
<link rel="stylesheet" href="//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin">

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

<link rel="stylesheet" href="../assets/plugins/parallax-slider/css/parallax-slider.css">


<title>We POS</title>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="header.jsp" flush="false" />
		<!--=== Slider ===-->
	    <div class="slider-inner">
	        <div id="da-slider" class="da-slider">
	            <div class="da-slide">
	                <h2><i>We POS에</i> <br /> <i>오신걸</i> <br /> <i>환영합니다.</i></h2>
	                <p><i>We POS에 가입된 매장들의</i> <br /> <i>정보와 상품을 만나볼 수 있습니다.</i></p>
	                <div class="da-img"><img class="img-responsive" src="../image/common/posfinal.png" alt=""></div>
	            </div>
	            <div class="da-slide">
	                <h2><i>RESPONSIVE VIDEO</i> <br /> <i>SUPPORT AND</i> <br /> <i>MANY MORE</i></h2>
	                <p><i>Lorem ipsum dolor amet</i> <br /> <i>tempor incididunt ut</i></p>	                
	            </div>
	            <div class="da-slide">
	                <h2><i>USING BEST WEB</i> <br /> <i>SOLUTIONS WITH</i> <br /> <i>HTML5/CSS3</i></h2>
	                <p><i>Lorem ipsum dolor amet</i> <br /> <i>tempor incididunt ut</i> <br /> <i>veniam omnis </i></p>
	                <div class="da-img"><img src="../assets/plugins/parallax-slider/img/html5andcss3.png" alt="image01" /></div>
	            </div>
	            <div class="da-arrows">
	                <span class="da-arrows-prev"></span>
	                <span class="da-arrows-next"></span>        
	            </div>
	        </div>
	    </div><!--/slider-->
	    <!--=== End Slider ===-->
	    
	     <!--=== Purchase Block ===-->
	    <div class="purchase">
	        <div class="container">
	            <div class="row">
	            	<c:if test="${sessionScope.id == null}">            	
		                <div class="col-md-9 animated fadeInLeft">
		                    <span>We POS 시스템을 통해 편리한 경험을 느껴보세요.</span>
		                    <p>회원가입하시면 매장 예약, 상품 평점, 게시물 쓰기 등의 다양한 기능을 사용하실 수 있습니다.</p>
		                </div>	                	                          
		                <div class="col-md-3 btn-buy animated fadeInRight">
		                    <a href="registration.do" class="btn-u btn-u-lg"><i class="fa fa-users"></i> 회원가입</a>
		                </div>
	                </c:if>
	                <c:if test="${sessionScope.id != null}">        	
		                <div class="col-md-9 animated fadeInLeft">
		                    <span><font color="#72c02c">${sessionScope.id}</font>님 We POS 오신걸 환영합니다.</span>
		                    <p>매장 정보, 상품 정보, 상품 평점, 테이블 현황 등의 다양한 기능을 사용하실 수 있습니다.</p>
		                </div>	                	                          
		                <div class="col-md-3 btn-buy animated fadeInRight">
		                    <a href="searchShop.do" class="btn-u btn-u-lg"><i class="fa fa-search"></i> 매장 검색</a>
		                </div>
	                </c:if>
	            </div>
	        </div>
	    </div><!--/row-->
	    <!-- End Purchase Block -->			
	
	    <!--=== Content ===-->
    	<div class="content-md">
    		<div class="container">
    			<!-- Service Box -->
	            <div class="row text-center margin-bottom-60">
	                <div class="col-md-4 md-margin-bottom-50">
	                    <img class="image-md margin-bottom-20" src="../assets/img/icons/flat/01.png" alt="">
	                    <h1 class="title-v3-md margin-bottom-10">매장 정보</h1>	                    
	                    <p>We POS를 사용하는 매장의 메뉴, 테이블 정보등을 <br /> 확인할 수 있습니다.</p>
	                </div>
	                <div class="col-md-4 flat-service md-margin-bottom-50">
	                    <img class="image-md margin-bottom-20" src="../assets/img/icons/flat/02.png" alt="">
	                    <h2 class="title-v3-md margin-bottom-10">POS 시스템</h2>
	                    <p>웹을 통한 POS 시스템으로 매장 관리를 도와줍니다.</p>
	                </div>
	                <div class="col-md-4 flat-service">
	                    <img class="image-md margin-bottom-20" src="../assets/img/icons/flat/03.png" alt="">  
	                    <h2 class="title-v3-md margin-bottom-10">통계 기능</h2>
	                    <p>통계 기능을 통해 매출, 인기 메뉴 등의 정보를 <br /> 얻을 수 있습니다.</p>	                    
	                </div>
	            </div>
            	<!-- End Service Box -->
    		</div>
    		<!--/container -->
    	</div>
    	<!-- End Content -->
		<jsp:include page="footer.jsp" flush="false" />
	</div>
	<!--/wrapper-->
	
<!-- JS Global Compulsory -->			
<script type="text/javascript" src="../assets/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript" src="../assets/plugins/jquery/jquery-migrate.min.js"></script>
<script type="text/javascript" src="../assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- JS Implementing Plugins -->
<script type="text/javascript" src="../assets/plugins/back-to-top.js"></script>
<script type="text/javascript" src="../assets/plugins/smoothScroll.js"></script>
<script type="text/javascript" src="../assets/plugins/parallax-slider/js/modernizr.js"></script>
<script type="text/javascript" src="../assets/plugins/parallax-slider/js/jquery.cslider.js"></script>

<!-- JS Page Level -->           
<script type="text/javascript" src="../assets/js/app.js"></script>
<script type="text/javascript" src="../assets/js/plugins/parallax-slider.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function() {
      	App.init();       
        ParallaxSlider.initParallaxSlider();
    });
</script>
</body>
</html>