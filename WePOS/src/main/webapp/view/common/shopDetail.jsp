<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<script language="JavaScript" src="../js/common/shopDetailJs.js?v=1"></script>

<title>We POS</title>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="header.jsp" flush="false" />	
		
		<!--=== Breadcrumbs ===-->
  		<div class="breadcrumbs">
      		<div class="container">      		
          		<h1 class="pull-left">${shop.shopName}</h1>          		
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
                	<hr>                	
                	<h3>매장 설명</h3>
                	<input type="hidden" id="shopCode" value="${shop.shopCode}">
	                <ul class="list-unstyled who">
	                    <li><i class="fa fa-home"></i>${shop.shopAddress}</li>	                    
	                    <li><i class="fa fa-phone"></i>${shop.shopPhone}</li>	                    
	                    <li><i class="fa fa-calendar"></i>${shop.shopStartTime} ~ ${shop.shopEndTime}</li>
	                </ul>	                
	            </div>
	        </div>
	        
	        <div class="margin-bottom-50"></div>
	                    
            <div class="headline"><h2>매장 정보</h2></div>
            <!-- Tab v1 -->                
            <div class="tab-v1">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#board" data-toggle="tab" onclick="tabClick('boardTab')">공지사항</a></li>
                    <li><a href="#productList" data-toggle="tab" onclick="tabClick('productListTab')">상품 리스트</a></li>
                    <li><a href="#shopTableInfo" data-toggle="tab" onclick="tabClick('shopTableInfoTab')">테이블현황</a></li>
                    <li><a href="#settings" data-toggle="tab" onclick="tabClick('tab2')">게시판</a></li>
                </ul>                
                <div class="tab-content">
                    <div class="tab-pane fade in active" id="board">
                        <div class="row">                            
                            <div class="col-md-12">
                                <h4>Heading Sample 1</h4>
                                <p>Vivamus imperdiet condimentum diam, eget placerat felis consectetur id. Donec eget orci metus, ac adipiscing nunc. Pellentesque fermentum <strong>ivamus imperdiet</strong> condimentum diam, eget placerat felis consectetur id. Donec eget orci metus, ac adipiscing nunc. Pellentesque <strong>fermentum vivamus</strong> imperdiet condimentum diam, eget placerat felis consectetur id. Donec eget orci metus, ac adipiscing nunc. Pellentesque fermentum, ante ac felis consectetur id. Donec eget orci metusvivamus imperdiet.</p>                        
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade in" id="productList">
                    </div>
                    <div class="tab-pane fade in" id="shopTableInfo">                                                                 
                    </div>
                    <div class="tab-pane fade in" id="settings">
                        <h4>Heading Sample 4</h4>
                        <p>Vivamus imperdiet condimentum diam, eget placerat felis consectetur id. Donec eget orci metus, Vivamus imperdiet condimentum diam, eget placerat felis consectetur id. Donec eget orci metus, ac adipiscing nunc. Pellentesque fermentum, ante ac interdum ullamcorper. Donec eget orci metus, ac adipiscing nunc. Pellentesque fermentum, consectetur id. Donec eget orci metus, ac adipiscing nunc. <strong>Pellentesque fermentum</strong>, ante ac interdum ullamcorper. Donec eget orci metus, ac adipiscing nunc. Pellentesque fermentum, ante ac interdum ullamcorper.</p>
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
<!-- JS Page Level -->
<script type="text/javascript" src="../assets/js/app.js"></script>

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
    });
</script>	
</body>
</html>
