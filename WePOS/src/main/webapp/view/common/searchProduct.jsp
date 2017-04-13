<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

<script language="JavaScript" src="../js/common/searchShopJs.js"></script>

<title>We POS</title>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="header.jsp" flush="false" />
	
		<!--=== Search Block Version 2 ===-->
		<div class="search-block" style="background: url('../image/common/searchHeaderImg.png');">
			<div class="container">	
				<form id="searchProductForm" action="#" name="searchProductForm" method="get">
					<div class="col-md-6 col-md-offset-3" style="margin-bottom: 10px">
						<h2>매장 검색</h2>
						<div class="row">
							<div class="col-md-4">
								<select class="form-control" id="shopTypeCode" name="shopTypeCode">
									<option value="0">매장 종류</option>									
									<c:forEach items="${shopTypeList}" var="shopType">
										<c:if test="${shopTypeCode == shopType.shopTypeCode}">
											<option value="${shopType.shopTypeCode}" selected="selected">${shopType.shopTypeName}</option>
										</c:if>
										<c:if test="${shopTypeCode != shopType.shopTypeCode}">
											<option value="${shopType.shopTypeCode}">${shopType.shopTypeName}</option>		
										</c:if>
									</c:forEach>
								</select>	
							</div>
							<div class="col-md-4">
								<select class="form-control" id="cityCode" name="cityCode" onchange="searchLocal()">
									<option value="0">지역</option>	
									<c:forEach items="${cityList}" var="city">
										<c:if test="${cityCode == city.cityCode}">
											<option value="${city.cityCode}" selected="selected">${city.cityName}</option>
										</c:if>
										<c:if test="${cityCode != city.cityCode}">
											<option value="${city.cityCode}">${city.cityName}</option>
										</c:if>										
									</c:forEach>
								</select>
							</div>
							<div class="col-md-4">
								<select class="form-control" id="localCode" name="localCode">
									<option value="0">시, 군</option>
									<c:if test="${localList != null}">
										<c:forEach items="${localList}" var="local">
											<c:if test="${localCode == local.localCode}">
												<option value="${local.localCode}" selected="selected">${local.localName}</option>
											</c:if>
											<c:if test="${localCode != local.localCode}">
												<option value="${local.localCode}">${local.localName}</option>
											</c:if>
										</c:forEach>
									</c:if>	
								</select>																				
							</div>											
						</div>
					</div>									
									
					<div class="col-md-6 col-md-offset-3">							
						<div class="input-group">	
							<input type="text" name="productName" class="form-control"	placeholder="찾고자 하는 상품을 입력하세요" value="${productName}">
							<span class="input-group-btn">
								<button class="btn-u" type="button" style="height: 34px" onclick="submit()">								
									<i class="fa fa-search"></i>
								</button>
							</span>								
						</div>			
					</div>
				</form>											
			</div>		
		</div>
		<!--=== End Search Block Version 2 ===-->		
	
		<br>
		
		<!--=== Cube-Portfdlio ===-->
		<div class="cube-portfolio container margin-bottom-30">		
			<div id="grid-container" class="cbp-l-grid-agency">
				<c:forEach items="${productList}" var="product">
					<div class="cbp-item">
						<div class="cbp-caption margin-bottom-20">
							<div class="cbp-caption-defaultWrap">
                        		<img src="${product.productFile}" alt="" style="height: 170px;">
                    		</div>
                    		<div class="cbp-caption-activeWrap">
		                        <div class="cbp-l-caption-alignCenter">
		                            <div class="cbp-l-caption-body">
		                                <ul class="link-captions no-bottom-space">
		                                    <li><a href="../common/shopDetail.do?shopCode=${product.shopCode}"><i class="rounded-x fa fa-link"></i></a></li>
		                                    <li><a href="${product.productFile}" class="cbp-lightbox" data-title="${product.productName}"><i class="rounded-x fa fa-search"></i></a></li>
		                                </ul>
		                            </div>
		                        </div>
		                    </div>
						</div>
						<div class="cbp-title-dark">
		                    <div class="cbp-l-grid-agency-title">${product.productName}</div>
		                    <div class="cbp-l-grid-agency-desc"><i class="fa fa-krw"></i> <fmt:formatNumber value="${product.productPrice}" type="number" />원</div>
		                </div>
					</div>
				</c:forEach>
			</div>
			<div class="margin-bottom-30"></div>
    		${pagingHtml}    		
		</div>
		<!--=== End Cube-Portfdlio ===-->	
		
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
<script type="text/javascript" src="../assets/js/plugins/cube-portfolio/cube-portfolio-4.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function() {
        App.init();
        });
</script>
</body>
</html>