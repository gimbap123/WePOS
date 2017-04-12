<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.*, com.wepos.common.*, com.wepos.common.dto.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>We POS</title>



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
<link rel="stylesheet"
	href="<c:url value="/assets/plugins/bootstrap/css/bootstrap.min.css" />">
<link rel="stylesheet" href="<c:url value="/assets/css/style.css" />">

<!-- CSS Header and Footer -->
<link rel="stylesheet"
	href="<c:url value="/assets/css/headers/header-default.css" />">
<link rel="stylesheet"
	href="<c:url value="/assets/css/footers/footer-v1.css" />">

<!-- CSS Implementing Plugins -->
<link rel="stylesheet"
	href="<c:url value="/assets/plugins/animate.css" />">
<link rel="stylesheet"
	href="<c:url value="/assets/plugins/line-icons/line-icons.css" />">
<link rel="stylesheet"
	href="<c:url value="/assets/plugins/font-awesome/css/font-awesome.min.css" />">

<!-- CSS Page Style -->
<link rel="stylesheet"
	href="<c:url value="/assets/css/pages/page_search_inner_tables.css" />">

<!-- CSS Customization -->
<link rel="stylesheet" href="<c:url value="/assets/css/custom.css" />">

<!-- table Sorter CSS ( devdra9 added ) -->
<link rel="stylesheet"
	href="<c:url value="/assets/js/table_sorter/blue/style.css" />"
	type="text/css">



</head>

<body>    

<div class="wrapper">
    <!--=== Header ===-->    
    
    <jsp:include page="../common/header.jsp" flush="false" />

    <!--=== Breadcrumbs v3 ===-->
    <div class="breadcrumbs-v3 img-v3 text-center" style="background: url(../image/common/Introduce.png) no-repeat;">
        <div class="container">
            <h1><b>WePOS</b> is a clean and fully responsive</h1>
            <p>Discover more about us</p>
        </div><!--/end container-->
    </div>
    <!--=== End Breadcrumbs v3 ===-->

    <!--=== Container Part ===-->
    <div class="container content-sm">
        <div class="headline-center margin-bottom-60">
            <h2>WE ARE WEPOS</h2>
            <p>우리 WEPOS SYSTEM에 오신 여러분을 진심으로 환영합니다. <br>
           매장은 운영하는 <strong>관리자</strong> 뿐만 아니라, 일반 <strong>고객분들</strong> 에게도 아주 유용한 정보를 제공하고 있습니다 </p>                
        </div>

        <div class="row">
            <div class="col-md-6 md-margin-bottom-50">
                <img class="img-responsive" src="../image/common/posfinal.png" alt="">
            </div>
            <div class="col-md-6">
                <p>저희 WEPOS SYSTEM이 여러분에게 드리는 다양한 정보</p><br>
                <div class="row">
                    <ul class="col-xs-6 list-unstyled lists-v1">
                        <li><i class="fa fa-angle-right"></i>매장 오픈 여부 실시간 확인</li>
                        <li><i class="fa fa-angle-right"></i>일/월/년 으로 구성된 매출 정보</li>
                        <li><i class="fa fa-angle-right"></i>매장의 위치, 정보, 메뉴, 가격</li>
                        <li><i class="fa fa-angle-right"></i>매장의 평점과 다양한 게시글</li>
                    </ul>
                    <ul class="col-xs-6 list-unstyled lists-v1">
                        <li><i class="fa fa-angle-right"></i>잔여 좌석 실시간 확인 가능!</li>
                        <li><i class="fa fa-angle-right"></i>회원 가입시 주는 등급별 혜택</li>
                        <li><i class="fa fa-angle-right"></i>제일 잘 나가는 메뉴는?</li>
                        <li><i class="fa fa-angle-right"></i>나에게 가까운 매장은 어디?</li>
                    </ul>
                </div>
            </div>
        </div><!--/end row-->
    </div>
    <!--=== End Container Part ===-->

    <!--=== Service Block v5 ===-->
    <div class="service-block-v5">
        <div class="container">
            <div class="row equal-height-columns">
                <div class="col-md-4 service-inner equal-height-column">
                    <i class="icon-custom icon-md rounded-x icon-bg-u icon-diamond"></i>
                    <span style="font-weight: bold;">등급별 혜택 제도</span>
                    <p>회원가입을 통해 다양한 활동을 하시면 등급에 따른 할인혜택이 마구 쏟아집니다! 당신의 등급은 무엇인가요? 위 버튼을 눌러 등급을 확인해보세요!</p>
                </div>
                <div class="col-md-4 service-inner equal-height-column service-border">
                    <i class="icon-custom icon-md rounded-x icon-bg-u icon-rocket"></i>
                    <span style="font-weight: bold;">정확한 매장 위치</span>
                    <p>저희 WEPOS는 구글 맵과의 연동을 통해 보다 정확한 매장의 위치와 정보를 여러분에게 제공하고 있습니다. 원하시는 매장을 지금 바로 찾아보세요!</p>
                </div>
                <div class="col-md-4 service-inner equal-height-column">
                    <i class="icon-custom icon-md rounded-x icon-bg-u icon-support"></i>
                    <span style="font-weight: bold;">실시간 매장 확인</span>
                    <p>관리자 분들에게는 온라인으로도 영업관리 관련 다양한 정보를, 고객 분들에게는 실시간으로 매장의 필요하신 정보를 제공해 드리고 있습니다. </p>
                </div>
            </div><!--/end row-->
        </div><!--/end container-->
    </div>
    <!--=== End Service Block v5 ===-->

   

    <!--=== Container Part ===-->
    <div class="container content-sm">
        <div class="container content-sm">
            <div class="headline-center margin-bottom-60">
                <h2>WHY WEPOS?</h2>
                <p>저희 WEPOS를 이용하고 계신 매장, 고객분들의 정보를 숨깅없이 제공합니다<br>
               회원 분들의 <strong>홈페이지 이용 평점</strong>, 관리자 분들의 <strong>운영 시스템 평점</strong> 등 다양한 정보를 알려드립니다 </p>                
            </div>

            <div class="row">
                <div class="col-md-3 md-margin-bottom-50"> </div>

                <!-- Smallest Progress Bar -->
                <div class="col-md-6 progress-box">
                    <h3 class="heading-xs">고객 평점(남)<span class="pull-right">8.8</span></h3>
                    <div class="progress progress-u progress-xxs">
                        <div class="progress-bar progress-bar-u" role="progressbar" data-width="88">
                        </div>
                    </div>

                    <h3 class="heading-xs">고객 평점(여) <span class="pull-right">9.2</span></h3>
                    <div class="progress progress-u progress-xxs">
                        <div class="progress-bar progress-bar-u" role="progressbar" data-width="76">
                        </div>
                    </div>

                    <h3 class="heading-xs">관리자 평점(남)<span class="pull-right">9.7</span></h3>
                    <div class="progress progress-u progress-xxs">
                        <div class="progress-bar progress-bar-u" role="progressbar" data-width="97">
                        </div>
                    </div>

                    <h3 class="heading-xs">관리자 평점(여)<span class="pull-right">8.4</span></h3>
                    <div class="progress progress-u progress-xxs">
                        <div class="progress-bar progress-bar-u" role="progressbar" data-width="69">
                        </div>
                    </div>
                </div>
                <!-- End Smallest Progress Bar -->
            </div><!--/end row-->
        </div><!--/end container-->
    </div>
    <!--=== End Container Part ===-->

    <!--=== Team v4 ===-->
    <div class="bg-color-light">
        <div class="headline-center margin-bottom-60">
            <h2>MEET WEPOS TEAM</h2>
            <p>WEPOS를 운영하고 있는 개발자들을 소개합니다<br>
	        </div>

        <div class="row team-v4">
            <div class="col-md-3 col-sm-6 md-margin-bottom-50">
                <img class="img-responsive" src="assets/img/team/img1-md.jpg" alt="">
                <span>Lee Dea Han</span>
                <small>- Technica Director -</small>
                <p>Lorem ipsum dolor sit amet, consect etur adipiscing elit, sed a nulla non</p>
                <ul class="list-inline team-social-v4">
                    <li><a href="#"><i class="rounded-x fa fa-facebook"></i></a></li>
                    <li><a href="#"><i class="rounded-x fa fa-twitter"></i></a></li>
                    <li><a href="#"><i class="rounded-x fa fa-linkedin"></i></a></li>
                </ul>
            </div>
            <div class="col-md-3 col-sm-6 md-margin-bottom-50">
                <img class="img-responsive" src="assets/img/team/img5-md.jpg" alt="">
                <span>Sim Dong Kyu</span>
                <small>- UI Designer -</small>
                <p>Lorem ipsum dolor sit amet, consect etur adipiscing elit, sed a nulla non</p>
                <ul class="list-inline team-social-v4">
                    <li><a href="#"><i class="rounded-x fa fa-facebook"></i></a></li>
                    <li><a href="#"><i class="rounded-x fa fa-twitter"></i></a></li>
                    <li><a href="#"><i class="rounded-x fa fa-linkedin"></i></a></li>
                </ul>
            </div>
            <div class="col-md-3 col-sm-6 sm-margin-bottom-50">
                <img class="img-responsive" src="assets/img/team/img3-md.jpg" alt="">
                <span>Kang Kynug Wan</span>
                <small>- Backend Developer -</small>
                <p>Lorem ipsum dolor sit amet, consect etur adipiscing elit, sed a nulla non</p>
                <ul class="list-inline team-social-v4">
                    <li><a href="#"><i class="rounded-x fa fa-facebook"></i></a></li>
                    <li><a href="#"><i class="rounded-x fa fa-twitter"></i></a></li>
                    <li><a href="#"><i class="rounded-x fa fa-linkedin"></i></a></li>
                </ul>
            </div>
            <div class="col-md-3 col-sm-6">
                <img class="img-responsive" src="assets/img/team/img2-md.jpg" alt="">
                <span>Jang Su Yong</span>
                <small>- Customer Support -</small>
                <p>Lorem ipsum dolor sit amet, consect etur adipiscing elit, sed a nulla non</p>
                <ul class="list-inline team-social-v4">
                    <li><a href="#"><i class="rounded-x fa fa-facebook"></i></a></li>
                    <li><a href="#"><i class="rounded-x fa fa-twitter"></i></a></li>
                    <li><a href="#"><i class="rounded-x fa fa-linkedin"></i></a></li>
                </ul>
            </div>
        </div><!--/end row-->
    </div>
    <!--=== End Team v4 ===-->

    <!--=== Testimonials v4 ===-->
    <div class="container content-sm">
        <div class="container content-sm">
            <div class="headline-center margin-bottom-60">
                <h2>WHAT PEOPLE SAY</h2>
                <p>이번달에 선정된 고객 여러분의 후기를 소개합니다<br>
            </div>

            <div class="row">
                <div class="col-sm-6">
                    <!-- Testimonials v4 -->
                    <div class="testimonials-v4 md-margin-bottom-50">
                        <div class="testimonials-v4-in">
                            <p>The best programs are written so that computing machines can perform them quickly and so that human beings can understand them clearly. A programmer is ideally an essayist who works with traditional aesthetic and literary forms as well as mathematical concepts.</p>
                        </div>
                        <img class="rounded-x" src="assets/img/testimonials/img5.jpg" alt="thumb">
                        <span class="testimonials-author">
                            Jeremy Asigner<br>
                            <em>Web Developer, <a href="#">Google Inc.</a></em>
                        </span>
                    </div>
                    <!-- End Testimonials v4 -->
                </div>
                <div class="col-sm-6">
                    <!-- Testimonials v4 -->
                    <div class="testimonials-v4">
                        <div class="testimonials-v4-in">
                            <p>We see a lot of feature-driven product design in which the cost of features is not properly accounted. Features can have a negative value to customers because they make the products more difficult to understand and use. We are finding that people like products that just work.</p>
                        </div>
                        <img class="rounded-x" src="assets/img/testimonials/img4.jpg" alt="thumb">
                        <span class="testimonials-author">
                            John Davenport<br>
                            <em>UX/UI Designer, <a href="#">Apple Inc.</a></em>
                        </span>
                    </div>
                    <!-- End Testimonials v4 -->
                </div>
            </div><!--/end row-->
        </div><!--/end container-->
    </div>
    <!--=== End Testimonials v4 ===-->

    <!-- Owl Clients v1 -->
    <div class="container content-sm">
        <div class="owl-clients-v1">
            <div class="item">
                <img src="assets/img/clients4/1.png" alt="">
            </div>
            <div class="item">
                <img src="assets/img/clients4/2.png" alt="">
            </div>
            <div class="item">
                <img src="assets/img/clients4/3.png" alt="">
            </div>
            <div class="item">
                <img src="assets/img/clients4/4.png" alt="">
            </div>
            <div class="item">
                <img src="assets/img/clients4/5.png" alt="">
            </div>
            <div class="item">
                <img src="assets/img/clients4/6.png" alt="">
            </div>
            <div class="item">
                <img src="assets/img/clients4/7.png" alt="">
            </div>
            <div class="item">
                <img src="assets/img/clients4/8.png" alt="">
            </div>
            <div class="item">
                <img src="assets/img/clients4/9.png" alt="">
            </div>
        </div>
    </div>    
    <!-- End Owl Clients v1 -->

    <jsp:include page="../common/footer.jsp" flush="false" />
    <!--=== End Footer Version 1 ===-->
</div><!--/wrapper-->

<!-- JS Global Compulsory -->			
<script type="text/javascript" src="assets/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript" src="assets/plugins/jquery/jquery-migrate.min.js"></script>
<script type="text/javascript" src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- JS Implementing Plugins -->
<script type="text/javascript" src="assets/plugins/back-to-top.js"></script>
<script type="text/javascript" src="assets/plugins/smoothScroll.js"></script>
<script type="text/javascript" src="assets/plugins/jquery-appear.js"></script>
<script type="text/javascript" src="assets/plugins/fancybox/source/jquery.fancybox.pack.js"></script>
<script type="text/javascript" src="assets/plugins/owl-carousel/owl-carousel/owl.carousel.js"></script>
<!-- JS Customization -->
<script type="text/javascript" src="assets/js/custom.js"></script>
<!-- JS Page Level -->           
<script type="text/javascript" src="assets/js/app.js"></script>
<script type="text/javascript" src="assets/js/plugins/fancy-box.js"></script>
<script type="text/javascript" src="assets/js/plugins/progress-bar.js"></script>
<script type="text/javascript" src="assets/js/plugins/owl-carousel.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function() {
	    App.init();
	    FancyBox.initFancybox();
	    OwlCarousel.initOwlCarousel();
	    ProgressBar.initProgressBarHorizontal();
	});
</script>
<!--[if lt IE 9]>
    <script src="assets/plugins/respond.js"></script>
    <script src="assets/plugins/html5shiv.js"></script>
    <script src="assets/plugins/placeholder-IE-fixes.js"></script>
<![endif]-->

</body>
</html>