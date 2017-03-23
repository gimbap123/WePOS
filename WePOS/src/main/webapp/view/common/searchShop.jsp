<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>
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
<link rel="stylesheet" href="<c:url value="/assets/plugins/animate.css" />">
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
<link rel="stylesheet" href="<c:url value="/assets/js/table_sorter/blue/style.css" />" type="text/css">
</head>

<body>

  <div class="wrapper">
    <!--=== Header ===-->
    <jsp:include page="header.jsp" flush="false" />
    <!--=== End Header ===-->

    <!--=== Breadcrumbs ===-->
    <!--
    <div class="breadcrumbs breadcrumbs-dark">
        <div class="container">
            <h1 class="pull-left">Search Tables</h1>
            <ul class="pull-right breadcrumb">
                <li><a href="index.html">Home</a></li>
                <li><a href="">Page</a></li>
                <li class="active">Search Tables</li>
            </ul>
        </div>
    </div>
-->
    <!--=== End Breadcrumbs ===-->

    <!--=== Search Block Version 2 ===-->
    <div class="search-block">
      <div class="container">
        <div class="col-md-6 col-md-offset-3">
          <h2>매장 검색</h2>
          <div class="input-group">
            <form id="searchShop" action="searchShopProc.do" name="searchShop" method="get">
              <input type="text" name="shopName" class="form-control"
                placeholder="찾고자 하는 매장의 정보를 입력하세요">
              <span class="input-group-btn">
                <button class="btn-u" type="button" onclick="submit()">
                  <i class="fa fa-search"></i>
                </button>
              </span>
            </form>
          </div>
        </div>
      </div>
    </div>
    <!--/container-->
    <!--=== End Search Block Version 2 ===-->
    <div class="container content-sm">
      <!-- Begin Table Search Panel v1 -->
      <div class="table-search-v1 panel panel-dark margin-bottom-50">
        <div class="panel-heading">
          <h3 class="panel-title">
            <i class="fa fa-globe"></i> 매장 검색 결과 ( 총 ${allShopCount}개의 매장 중 ${resultCount}개의 결과 )
          </h3>
        </div>
        <div class="table-responsive">
          <table id="resultTable" class="table table-bordered table-striped table-hover tablesorter">
            <thead>
              <tr>
                <th>번호</th>
                <th>이름</th>
                <th>분류</th>
                <th>설명</th>
                <th>city</th>
                <th>local</th>
                <th>주소</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="shop" items="${shopList}">
                <tr>
                  <td>${shop.shopCode}</td>
                  <td>${shop.shopName}</td>
                  <td>${shop.shopTypeCode}</td>
                  <td>${shop.shopDesc}</td>
                  <td>${shop.cityCode}</td>
                  <td>${shop.localCode}</td>
                  <td>${shop.shopAddress}</td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
      </div>
      <!-- End Table Search Panel v1 -->
    </div>

    <!--=== Footer Version 1 ===-->
    <div class="footer-v1">
      <div class="footer">
        <div class="container">
          <div class="row">
            <!-- About -->
            <div class="col-md-3 md-margin-bottom-40">
              <a href="index.html"><img id="logo-footer" class="footer-logo"
                  src="<c:url value="/assets/img/logo2-default.png" />" alt=""></a>
              <p>About Unify dolor sit amet, consectetur adipiscing elit.
                Maecenas eget nisl id libero tincidunt sodales.</p>
              <p>Duis eleifend fermentum ante ut aliquam. Cras mi risus,
                dignissim sed adipiscing ut, placerat non arcu.</p>
            </div>
            <!--/col-md-3-->
            <!-- End About -->

            <!-- Latest -->
            <div class="col-md-3 md-margin-bottom-40">
              <div class="posts">
                <div class="headline">
                  <h2>Latest Posts</h2>
                </div>
                <ul class="list-unstyled latest-list">
                  <li><a href="#">Incredible content</a> <small>May
                      8, 2014</small></li>
                  <li><a href="#">Best shoots</a> <small>June 23,
                      2014</small></li>
                  <li><a href="#">New Terms and Conditions</a> <small>September
                      15, 2014</small></li>
                </ul>
              </div>
            </div>
            <!--/col-md-3-->
            <!-- End Latest -->

            <!-- Link List -->
            <div class="col-md-3 md-margin-bottom-40">
              <div class="headline">
                <h2>Useful Links</h2>
              </div>
              <ul class="list-unstyled link-list">
                <li><a href="#">About us</a><i class="fa fa-angle-right"></i></li>
                <li><a href="#">Portfolio</a><i class="fa fa-angle-right"></i></li>
                <li><a href="#">Latest jobs</a><i class="fa fa-angle-right"></i></li>
                <li><a href="#">Community</a><i class="fa fa-angle-right"></i></li>
                <li><a href="#">Contact us</a><i class="fa fa-angle-right"></i></li>
              </ul>
            </div>
            <!--/col-md-3-->
            <!-- End Link List -->

            <!-- Address -->
            <div class="col-md-3 map-img md-margin-bottom-40">
              <div class="headline">
                <h2>Contact Us</h2>
              </div>
              <address class="md-margin-bottom-40">
                25, Lorem Lis Street, Orange
                <br />
                California, US
                <br />
                Phone: 800 123 3456
                <br />
                Fax: 800 123 3456
                <br />
                Email: <a href="mailto:info@anybiz.com" class="">info@anybiz.com</a>
              </address>
            </div>
            <!--/col-md-3-->
            <!-- End Address -->
          </div>
        </div>
      </div>
      <!--/footer-->

      <div class="copyright">
        <div class="container">
          <div class="row">
            <div class="col-md-6">
              <p>
                2015 &copy; All Rights Reserved. <a href="#">Privacy Policy</a>
                | <a href="#">Terms of Service</a>
              </p>
            </div>

            <!-- Social Links -->
            <div class="col-md-6">
              <ul class="footer-socials list-inline">
                <li><a href="#" class="tooltips" data-toggle="tooltip"
                  data-placement="top" title="" data-original-title="Facebook">
                    <i class="fa fa-facebook"></i>
                </a></li>
                <li><a href="#" class="tooltips" data-toggle="tooltip"
                  data-placement="top" title="" data-original-title="Skype">
                    <i class="fa fa-skype"></i>
                </a></li>
                <li><a href="#" class="tooltips" data-toggle="tooltip"
                  data-placement="top" title=""
                  data-original-title="Google Plus"> <i
                    class="fa fa-google-plus"></i>
                </a></li>
                <li><a href="#" class="tooltips" data-toggle="tooltip"
                  data-placement="top" title="" data-original-title="Linkedin">
                    <i class="fa fa-linkedin"></i>
                </a></li>
                <li><a href="#" class="tooltips" data-toggle="tooltip"
                  data-placement="top" title="" data-original-title="Pinterest">
                    <i class="fa fa-pinterest"></i>
                </a></li>
                <li><a href="#" class="tooltips" data-toggle="tooltip"
                  data-placement="top" title="" data-original-title="Twitter">
                    <i class="fa fa-twitter"></i>
                </a></li>
                <li><a href="#" class="tooltips" data-toggle="tooltip"
                  data-placement="top" title="" data-original-title="Dribbble">
                    <i class="fa fa-dribbble"></i>
                </a></li>
              </ul>
            </div>
            <!-- End Social Links -->
          </div>
        </div>
      </div>
      <!--/copyright-->
    </div>
    <!--=== End Footer Version 1 ===-->
  </div>
  <!--/End Wrapepr-->

  <!-- JS Global Compulsory -->
  <script type="text/javascript"
    src="<c:url value="/assets/plugins/jquery/jquery.min.js" />"></script>
  <script type="text/javascript"
    src="<c:url value="/assets/plugins/jquery/jquery-migrate.min.js" />"></script>
  <script type="text/javascript"
    src="<c:url value="/assets/plugins/bootstrap/js/bootstrap.min.js" />"></script>
  <!-- JS Implementing Plugins -->
  <script type="text/javascript"
    src="<c:url value="/assets/plugins/back-to-top.js" />"></script>
  <script type="text/javascript"
    src="<c:url value="/assets/plugins/smoothScroll.js" />"></script>
  <!-- JS Customization -->
  <script type="text/javascript" src="<c:url value="/assets/js/custom.js" />"></script>
  <!-- JS Page Level -->
  <script type="text/javascript" src="<c:url value="/assets/js/app.js" />"></script>
  <!-- TableSorter ( devdra9 added ) --> 
  
  <script type="text/javascript" src="<c:url value="/assets/js/table_sorter/jquery.tablesorter.min.js" />"></script>
  <script type="text/javascript">
	    $(document).ready(function() {
		    $("#resultTable").tablesorter();
	    });
	    jQuery(document).ready(function() {
		App.init();
	    });
	    
	</script>
  <!--[if lt IE 9]>
    <script src="<c:url value="/assets/plugins/respond.js" />"></script>
    <script src="<c:url value="/assets/plugins/html5shiv.js" />"></script>
    <script src="<c:url value="/assets/plugins/placeholder-IE-fixes.js" />"></script>
<![endif]-->

</body>
</html>
