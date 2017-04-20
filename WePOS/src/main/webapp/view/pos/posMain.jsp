<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
  response.setHeader( "pragma", "No-cache" );
  response.setHeader( "Cache-Control", "no-cache" );
  response.addHeader( "Cache-Control", "No-store" );
  response.setDateHeader( "Expires", 0 );
%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html>
<!--<![endif]-->
<head>
<title>${shop.shopName}[${shopCode}]</title>
<!-- Meta -->
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<!-- Favicon -->
<link rel="shortcut icon" href="favicon.ico">
<!-- Web Fonts -->
<link rel="stylesheet" href="//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin">
<!-- CSS Global Compulsory -->
<link rel="stylesheet" href="<c:url value="/assets/plugins/bootstrap/css/bootstrap.min.css" />">
<link rel="stylesheet" href="<c:url value="/assets/css/style.css" /> ">
<!-- CSS Header and Footer -->
<link rel="stylesheet" href="<c:url value="/assets/css/headers/header-v7.css" /> ">
<link rel="stylesheet" href="<c:url value="/assets/css/footers/footer-v1.css" /> ">
<!-- CSS Implementing Plugins -->
<link rel="stylesheet" href="<c:url value="/assets/plugins/animate.css" /> ">
<link rel="stylesheet" href="<c:url value="/assets/plugins/line-icons/line-icons.css" /> ">
<link rel="stylesheet" href="<c:url value="/assets/plugins/font-awesome/css/font-awesome.min.css" /> ">
<link rel="stylesheet" href="<c:url value="/assets/plugins/scrollbar/css/jquery.mCustomScrollbar.css" /> ">
<link rel="stylesheet" href="<c:url value="/assets/plugins/owl-carousel/owl-carousel/owl.carousel.css" /> ">
<link rel="stylesheet" href="<c:url value="/assets/plugins/fancybox/source/jquery.fancybox.css" />">
<!-- CSS Customization -->
<link rel="stylesheet" href="<c:url value="/assets/css/custom.css?ver=10" /> ">

<link rel="stylesheet" href="<c:url value="/css/posMain.css" /> ">

<link href="<c:url value="/assets/css/headers/header-v7.css"/>" rel="stylesheet" type="text/css">
</head>

<body>
  <div class="wrapper">
    <!--=== Header v7 Left ===-->
    <jsp:include page="../pos/leftBar.jsp" flush="false" />

    <div class="content-side-right pos-main">
      <div class="row">
        <c:if test="${tableCount < 1}">
          <h1 align="center">
            등록된 테이블이 없습니다. <a class="btn btn-success" href="updateTableView.do?mgrId=${sessionScope.id}">테이블 설정</a>
          </h1>
        </c:if>

        <c:if test="${tableCount >= 1}">
          <c:forEach var="i" begin="0" end="${tableCount-1}">
            <div id="${tables[i].tableCode}" class="panel panel-success pos-table" data-code="${tables[i].tableCode}" data-name="${tables[i].tableName}">
              <div class="panel-heading">
                <h3 class="panel-title" id="panel-title">
                  <a role="button"><span class="anchorjs-icon tableName">${tables[i].tableName}</span><span class="badge pull-right customerCount" style="margin-top: 4px"> ${tables[i].tableMax}인</span></a>
                  <input type="hidden" value="${tables[i].tableCode}">
                </h3>
              </div>
              <div class="panel-body tableOrderList">
                <ul>
                  <c:forEach var="ordersDetail" items="${ordersDetailList}">
                    <c:if test="${tables[i].tableCode == ordersDetail.tableCode}">
                      <li class="list-unstyled productName">${ordersDetail.productName}<span class="badge pull-right">${ordersDetail.sumOrderAmount}</span> <input type="hidden" class="productPrice" value="${ordersDetail.sumOrderPrice}" />
                      </li>
                    </c:if>
                  </c:forEach>
                </ul>
              </div>
              <div class="panel-footer">
                <c:set var="tableOrderPrice" value="0" />
                <c:forEach var="od" items="${ordersDetailList}">
                  <c:if test="${tables[i].tableCode == od.tableCode}">
                    <c:set var="tableOrderPrice" value="${tableOrderPrice+od.sumOrderPrice}" />
                  </c:if>
                </c:forEach>
                <p class="text-right totalOrderPrice">${tableOrderPrice}
              </div>
            </div>
          </c:forEach>
        </c:if>
      </div>
    </div>
    <div class="pos-right">
      <div class="pos-status">
        <div class="panel panel-default panel-warning">
          <!-- Default panel contents -->
          <!-- Table -->
          <div class="panel-heading">매장 현황</div>
          <table class="table table-striped table-bordered">
            <tbody>
              <tr>
                <td>시간</td>
                <td>
                  <span id="realTime"></span>
                </td>
              </tr>
              <tr>
                <td>테이블</td>
                <td id="useTableCount">${tableCount}</td>
              </tr>
              <tr>
                <td>인원</td>
                <td id="totalCustomer"></td>
              </tr>
              <tr>
                <td>금액</td>
                <td id="totalPrice"></td>
              </tr>
            </tbody>
          </table>
        </div>
        <div class="panel panel-success">
          <div class="panel-heading" id="selectedTable" data-code="" data-name="">
            <h4 class="text-success">테이블 선택</h4>
          </div>
          <!--         <div role="group" aria-label="..." class="btn-group btn-group-justified">
          <div class="btn-group" role="group">
            <button type="button" class="btn btn-lg btn-success" data-toggle="tooltip">예약</button>
          </div>
          <div class="btn-group" role="group">
            <button type="button" class="btn btn-lg btn-success">계산서출력</button>
          </div>
        </div>
 -->
          <div role="group" aria-label="..." class="btn-group btn-group-justified">
            <div class="btn-group" role="group">
              <button type="button" class="btn btn-lg btn-success" id="moveButton">이동</button>
            </div>
            <div class="btn-group" role="group">
              <button type="button" class="btn btn-lg btn-success" id="joinButton">합석</button>
            </div>
          </div>
          <div role="group" aria-label="..." class="btn-group btn-group-justified">
            <div class="btn-group" role="group">
              <button type="button" class="btn btn-lg btn-danger" id="orderButton">주문</button>
            </div>
          </div>
          <div role="group" aria-label="..." class="btn-group btn-group-justified">
            <div class="btn-group" role="group">
              <button type="button" id="cashPaymentButton" class="btn btn-lg btn-info">현금결제</button>
            </div>
            <div class="btn-group" role="group">
              <button type="button" id="cardPaymentButton" class="btn btn-lg btn-primary">카드결제</button>
            </div>
          </div>
        </div>
      </div>
      <!-- End Owl Clients v1 -->
    </div>

    <!-- include files for Modal HTML source code -->
    <jsp:include page="./posOrder.jsp" flush="false" />
    <jsp:include page="./posPayment.jsp" flush="false" />
    <jsp:include page="./posMove.jsp" flush="false" />
    <jsp:include page="./posJoin.jsp" flush="false" />


  </div>



  <script type="text/javascript" src="<c:url value="/assets/plugins/jquery/jquery-migrate.min.js"/>"></script>
  <!--/wrapper-->
  <!-- JS Global Compulsory -->
  <script type="text/javascript" src="<c:url value="/assets/plugins/jquery/jquery.min.js"/>"></script>
  <script type="text/javascript" src="<c:url value="/assets/plugins/bootstrap/js/bootstrap.min.js"/>"></script>
  <!-- JS Implementing Plugins -->
  <script type="text/javascript" src="<c:url value="/assets/plugins/back-to-top.js"/>"></script>
  <script type="text/javascript" src="<c:url value="/assets/plugins/jquery-appear.js"/>"></script>
  <script type="text/javascript" src="<c:url value="/assets/plugins/smoothScroll.js"/>"></script>
  <script type="text/javascript" src="<c:url value="/assets/plugins/jquery.parallax.js"/>"></script>
  <script type="text/javascript" src="<c:url value="/assets/plugins/counter/waypoints.min.js"/>"></script>
  <script type="text/javascript" src="<c:url value="/assets/plugins/counter/jquery.counterup.min.js"/>"></script>
  <script type="text/javascript" src="<c:url value="/assets/plugins/fancybox/source/jquery.fancybox.pack.js"/>"></script>
  <script type="text/javascript" src="<c:url value="/assets/plugins/owl-carousel/owl-carousel/owl.carousel.js"/>"></script>
  <script type="text/javascript" src="<c:url value="/assets/plugins/scrollbar/js/jquery.mCustomScrollbar.concat.min.js"/>"></script>
  <!-- JS Customization -->
  <script type="text/javascript" src="<c:url value="/assets/js/custom.js"/>"></script>

  <!-- JS Page Level -->
  <script type="text/javascript" src="<c:url value="/assets/js/app.js"/>"></script>
  <script type="text/javascript" src="<c:url value="/assets/js/plugins/fancy-box.js"/>"></script>
  <script type="text/javascript" src="<c:url value="/assets/js/plugins/progress-bar.js"/>"></script>
  <script type="text/javascript" src="<c:url value="/assets/js/plugins/owl-carousel.js"/>"></script>

  <!-- JS user custom -->
  <script type="text/javascript" src="<c:url value="../js/pos/posMoveTable.js"/>"></script>
  <script type="text/javascript" src="<c:url value="../js/pos/posJoinTable.js"/>"></script>
  <script type="text/javascript" src="<c:url value="../js/pos/posOrder.js"/>"></script>
  <script type="text/javascript" src="<c:url value="../js/pos/posPayment.js?ver=1"/>"></script>

  <!--[if lt IE 9]>
    <script src="<c:url value="/assets/plugins/respond.js"/>"></script>
    <script src="<c:url value="/assets/plugins/html5shiv.js"/>"></script>
    <script src="<c:url value="/assets/plugins/placeholder-IE-fixes.js"/>"></script>
<![endif]-->
</body>
</html>