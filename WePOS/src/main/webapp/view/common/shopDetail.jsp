<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Favicon -->
<link rel="shortcut icon" href="favicon.ico">
    
<!-- Web Fonts -->
<link rel='stylesheet' type='text/css' href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin'>

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

<!-- 달력 추가 -->
<link rel="stylesheet" href="../assets/plugins/sky-forms-pro/skyforms/css/sky-forms.css">
<link rel="stylesheet" href="../assets/plugins/sky-forms-pro/skyforms/custom/custom-sky-forms.css">

<script language="JavaScript" src="../js/common/shopDetailJs.js?v=3"></script>

<title>We POS</title>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="header.jsp" flush="false" />	
		
		<!--=== Breadcrumbs ===-->
  		<div class="breadcrumbs" style="background: url('../image/common/searchHeaderImg.png') repeat;">
      		<div class="container">
          		<h1 class="pull-left" style="color: white; font-weight: bold;">${shop.shopName}</h1>          		
      		</div>
  		</div><!--/breadcrumbs-->
  		<!--=== End Breadcrumbs ===-->
  		
	    <!-- About Me Block -->
	    <div class="container content-sm">
	        <div class="row about-me">
	            <div class="col-sm-5 shadow-wrapper md-margin-bottom-40">
	                <div class="box-shadow shadow-effect-2">
	                    <img class="img-responsive img-bordered full-width" src="${shop.shopFile}" alt="" style="height: 305px;">
	                </div>
	            </div>	
	            <div class="col-sm-7">	            
	            	<h3>${shop.shopName }</h3>
                	<p>${shop.shopDesc}</p>
                	<hr style="margin: 20px 0 20px 0">                 	
                	<h3>매장 설명</h3>
                	<input type="hidden" id="shopCode" value="${shop.shopCode}">
	                <ul class="list-unstyled who">
	                    <li><i class="fa fa-home"></i>${shop.shopAddress}</li>	                    
	                    <li><i class="fa fa-phone"></i>${shop.shopPhone}</li>	                    
	                    <li><i class="fa fa-calendar"></i>${shop.shopStartTime} ~ ${shop.shopEndTime}</li>
	                </ul>	                
	                <hr style="margin: 20px 0 20px 0"> 
	                <div class="col-md-3 btn-buy animated fadeInRight">
	                    <c:if test="${sessionScope.id!=null}">
	                    <button class="btn-u btn-u-lg" type="button" data-toggle="modal"  data-target="#responsive">
							<i class="fa fa-clock-o"></i> RESERVATION</button>
						</c:if>
						<c:if test="${sessionScope.id==null}">
	                    <button class="btn-u btn-u-lg" type="button" data-target="#responsive" onClick="location.href='login.do'">
							<h6 style="color: white;font-weight: bold;"><i class="fa fa-clock-o"></i>예약을 하시려면 로그인이 필요합니다</h6></button>
						</c:if>
	                </div>	
	                <jsp:include page="reservationModal.jsp" flush="false" />	
	            </div>
	        </div>
	        
	        <div class="margin-bottom-50"></div>
	                    
            <div class="headline"><h2>매장 정보</h2></div>
            <!-- Tab v1 -->                
            <div class="tab-v1">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#shopNoticeTab" data-toggle="tab" onclick="tabClick('shopNoticeTab')">공지사항</a></li>
                    <li><a href="#productListTab" data-toggle="tab" onclick="tabClick('productListTab')">상품 리스트</a></li>
                    <li><a href="#shopTableInfoTab" data-toggle="tab" onclick="tabClick('shopTableInfoTab')">테이블현황</a></li>
                    <li><a href="#shopBoardTab" data-toggle="tab" onclick="tabClick('shopBoardTab')">자유 게시판</a></li>
                </ul>                
                <div class="tab-content">
                    <div class="tab-pane fade in active" id="shopNoticeTab">                  
                    </div>
                    <div class="tab-pane fade in" id="productListTab">
                    </div>
                    <div class="tab-pane fade in" id="shopTableInfoTab">                                                 
                    </div>
                    <div class="tab-pane fade in" id="shopBoardTab">                      
                    </div>
                </div>
            </div>
            <!-- End Tab v1 -->
            
            <div class="headline"><h2>매장 위치</h2></div> 
	        <div class="col-md-12 mb-margin-bottom-30">
                <!-- Google Map -->
                <div id="map" class="map margin-bottom-50">
                </div>
                <!-- End Google Map -->
            </div>       
      
  		</div>
  		<!-- End About Me Block -->  	
		
		<jsp:include page="footer.jsp" flush="false" />		
	</div>
<!-- JS Global Compulsory -->
<script type="text/javascript" src="../assets/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript" src="../assets/plugins/jquery/jquery-migrate.min.js"></script>
<script type="text/javascript" src="../assets/plugins/bootstrap/js/bootstrap.min.js"></script> 
<!-- JS Implementing Plugins -->           
<script type="text/javascript" src="../assets/plugins/back-to-top.js"></script>
<script type="text/javascript" src="../assets/plugins/smoothScroll.js"></script>
<!-- 추가  -->
<script src="../assets/plugins/sky-forms-pro/skyforms/js/jquery.maskedinput.min.js"></script>
<script src="../assets/plugins/sky-forms-pro/skyforms/js/jquery-ui.min.js"></script>
<script src="../assets/plugins/sky-forms-pro/skyforms/js/jquery.validate.min.js"></script>
<!-- JS Page Level -->
<script type="text/javascript" src="../assets/js/app.js"></script>
<script type="text/javascript" src="../assets/js/plugins/datepicker.js"></script>

<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB3MH-LfB9ijazDzhwbfkceUzZAO0LiYsk&callback=initMap">
</script>
<script type="text/javascript">
	var map;
	var x = ${coordinateMap.x};
	var y = ${coordinateMap.y};
	function initMap() {
	  	map = new google.maps.Map(document.getElementById('map'), {
	    center: {lat: x, lng: y},
	    zoom: 18
	  });
	  	
	var contentString = "<div><h2>${shop.shopName}</h2><p>${shop.shopAddress}</p></div>";  	
	  
  	var infowindow = new google.maps.InfoWindow({
  	    content: contentString
  	});	
	  	
	  marker = new google.maps.Marker({
		    map: map,
		    draggable: true,
		    animation: google.maps.Animation.DROP,
		    position: {lat: x, lng: y}
		  });
	  marker.addListener('click', toggleBounce);
	  
	  marker.addListener('click', function() {
		    infowindow.open(map, marker);
		  });
	}
	
	function toggleBounce() {
		  if (marker.getAnimation() !== null) {
		    marker.setAnimation(null);
		  } else {
		    marker.setAnimation(google.maps.Animation.BOUNCE);
		  }
	}	
	
    jQuery(document).ready(function() {
    	App.init();    	
    	tabClick('shopNoticeTab')
    	Datepicker.initDatepicker();
    });
</script>	
</body>
</html>
