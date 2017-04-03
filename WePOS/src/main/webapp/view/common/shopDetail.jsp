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

<script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyB3MH-LfB9ijazDzhwbfkceUzZAO0LiYsk"></script>

<style type="text/css">
	#map_ma
	{
		width = 100%;
		height : 400px;
		clear : both;
		border : solid 1px red;
	}
</style>

<title>We POS</title>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="header.jsp" flush="false" />
		
		<div id=map_ma"></div>
		
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
<script type="text/javascript">
    jQuery(document).ready(function() {
        App.init();
        
        /* var myLatlng = new google.maps.LatLng(35.837143, 128.558612);	
		var Y_point = 35.837143;
		var X_point = 128.558612;
		var zoomLevel = 18;
		var markerTitle = "대구광역시";
		var markerMaxWidth = 300;
		
		var contentString = "<div><h2>대구 남구</h2><p>구글 지도입니다.</p></div>";
		
		var myLatlng = new google.maps.LatLng(Y_point, X_point);
		var mapOptions = { zoom : zoomLevel, center : myLatlng, mapTypeId : google.maps.MapTypeId.ROADMAP}
		var map = new google.maps.Map(document.getElementById("map_ma"), mapOptions);
		var marker = new google.maps.Marker({
			position : myLatlng,
			map : map,
			title : markerTitle
		})
		
		var infowindow = new google.maps.Infowindow({
			content : contentString,
			maxWizzzdth : markerMaxWidth
		})
		
		google.maps.event.addListener(marker, "click", function(){
			infowindow.open(map. marker);
		}) */
        
        });
</script>	
</body>
</html>