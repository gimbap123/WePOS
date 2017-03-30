<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
<link rel="stylesheet" href="../assets/plugins/cube-portfolio/cubeportfolio/css/cubeportfolio.min.css">    
<link rel="stylesheet" href="../assets/plugins/cube-portfolio/cubeportfolio/custom/custom-cubeportfolio.css">

<!-- CSS Page Style -->
<link rel="stylesheet" href="../assets/css/pages/page_search_inner_tables.css">

<!-- CSS Customization -->
<link rel="stylesheet" href="../assets/css/custom.css">

<title>We POS</title>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="header.jsp" flush="false" />
	
		<!--=== Search Block Version 2 ===-->
		<div class="search-block">
			<div class="container">	
				
					<div class="col-md-6 col-md-offset-3" style="margin-bottom: 10px">
						<h2>매장 검색</h2>
						<div class="row">
							<div class="col-md-4">
								<select class="form-control" id="shopTypeCode" name="shopTypeCode">
									<option value="0">매장 종류</option>		
								</select>	
							</div>
							<div class="col-md-4">
								<select class="form-control" id="shopTypeCode" name="shopTypeCode">
									<option value="0">지역</option>		
								</select>	
							</div>
							<div class="col-md-4">
								<select class="form-control" id="shopTypeCode" name="shopTypeCode">
									<option value="0">시, 군</option>		
								</select>																						
							</div>											
						</div>
					</div>
									
					<div class="col-md-6 col-md-offset-3">
						<!-- <h2>매장 검색</h2> -->
						<div class="input-group">		
							<form id="searchShop" action="#" name="searchShop" method="get">																											
							<input type="text" name="shopName" class="form-control"	placeholder="찾고자 하는 매장의 정보를 입력하세요">
							<span class="input-group-btn">
								<button class="btn-u" type="button" style="height: 100%;" onclick="submit()">
									<i class="fa fa-search"></i>
								</button>
							</span>
							</form>								
						</div>			
					</div>							
			</div>		
		</div>
		<!--=== End Search Block Version 2 ===-->		
	
		<br>
		<!--=== Cube-Portfdlio ===-->
   	 	<div class="cube-portfolio container margin-bottom-60">
   	 		<div id="grid-container" class="cbp-l-grid-agency">   	  	 			 	 		 		
   	 			<c:forEach items="${shopList}" var="shop">
   	 				<div class="cbp-item">
   	 					<div class="cbp-caption margin-bottom-20">
   	 						<div class="cbp-caption-defaultWrap">
                        		<img src="${shop.shopFile}" alt="">
                    		</div>
                    		<div class="cbp-caption-activeWrap">
                    			<div class="cbp-l-caption-alignCenter">
                    				<div class="cbp-l-caption-body">
                    					<ul class="link-captions no-bottom-space">
                    						<li><a href="#"><i class="rounded-x fa fa-link"></i></a></li>
                                    		<li><a href="${shop.shopFile}" class="cbp-lightbox" data-title="Design Object"><i class="rounded-x fa fa-search"></i></a></li>
                    					</ul>
                    				</div>
                    			</div>
                    		</div>
                    	</div>
                    	<div class="cbp-title-dark">
                    		<div class="cbp-l-grid-agency-title">${shop.shopName}</div>
                    		<div class="cbp-l-grid-agency-desc">${shop.shopAddress}</div>
                		</div>
   	 				</div>
   	 			</c:forEach>
   	 		</div>
   	 		<div class="margin-bottom-30"></div>
    		${pagingHtml}    		
    	</div>
    	
    		
		
	<%-- 	<!--=== Content Part ===-->
		<div class="container content">
			<div class="row">
				<div class="col-md-9">	
					<c:forEach items="${shopList}" var="shop">
						
					
					
					</c:forEach>
								
					<!-- <div class="row clients-page">
						<div class="col-md-2">
                        	<img src="../image/common/sliderBg.png" class="img-responsive hover-effect" alt="" height="100px"/>                    	
                    	</div>
                    	<div class="col-md-10">
                        	<h3>Cisco Systems, Inc</h3>
                        	<ul class="list-inline">
                            	<li><i class="fa fa-map-marker color-green"></i> USA</li>
                            	<li><i class="fa fa-globe color-green"></i> <a class="linked" href="#">http://www.example.com</a></li>
                            	<li><i class="fa fa-briefcase color-green"></i> Web Design &amp; Development</li>
                        	</ul>
                        	<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati</p>
                        	<p>Olerano ipsum dolor sit amet, consectetur adipiscing elit. Ut non libero magna edetquam lacus. Fusce condimentum eleifend enim a sint occaecati feugiat..</p>
                    	</div>
					</div> -->
					
					
					
				</div>
			</div>
		</div> --%>
		<!--=== End Content Part ===-->
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
<script type="text/javascript" src="../assets/plugins/cube-portfolio/cubeportfolio/js/jquery.cubeportfolio.min.js"></script>
<!-- JS Page Level -->
<script type="text/javascript" src="../assets/js/app.js"></script>
<script type="text/javascript" src="../assets/js/plugins/cube-portfolio/cube-portfolio-2.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function() {
        App.init();
        });
</script>
</body>
</html>