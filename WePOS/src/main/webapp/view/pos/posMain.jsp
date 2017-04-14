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
<meta charset="utf-8">
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
<link rel="stylesheet" href="<c:url value="/assets/css/custom.css?ver=4" /> ">
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
          <br>
          <div class="alert alert-danger noTables" role="alert">
            <p>테이블이 존재 하지 않습니다.</p>
            <a href="updateTableView.do?mgrId=${sessionScope.id}" class="alert-link">테이블 설정</a> 하기
          </div>
        </c:if>

        <c:if test="${tableCount >= 1}">
          <c:forEach var="i" begin="0" end="${tableCount-1}">
            <div id="${tables[i].tableCode}" class="panel panel-success pos-table">
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
        <div role="group" aria-label="..." class="btn-group btn-group-justified">
          <div class="btn-group" role="group">
            <button type="button" class="btn btn-lg btn-success" data-toggle="tooltip">예약</button>
          </div>
          <div class="btn-group" role="group">
            <button type="button" class="btn btn-lg btn-success">반품</button>
          </div>
        </div>
        <div role="group" aria-label="..." class="btn-group btn-group-justified">
          <div class="btn-group" role="group">
            <button type="button" class="btn btn-lg btn-success">이동</button>
          </div>
          <div class="btn-group" role="group">
            <button type="button" class="btn btn-lg btn-success">합석</button>
          </div>
        </div>
        <div role="group" aria-label="..." class="btn-group btn-group-justified">
          <div class="btn-group" role="group">
            <button type="button" class="btn btn-lg btn-success">계산서출력</button>
          </div>
          <div class="btn-group" role="group">
            <button type="button" class="btn btn-lg btn-success">테이블 상세</button>
          </div>
        </div>
        <br>
        <div role="group" aria-label="..." class="btn-group btn-group-justified">
          <div class="btn-group" role="group">
            <button type="button" class="btn btn-lg btn-danger">주문</button>
          </div>
          <div class="btn-group" role="group">
            <button type="button" class="btn btn-lg btn-primary">계산</button>
          </div>
        </div>
      </div>
      <!-- End Owl Clients v1 -->
    </div>

    <!-- Modal -->
    <div class="modal fade" id="orderModal" tabindex="-1" role="dialog" aria-labelledby="orderModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
            <h3 class="modal-title" id="orderModalLabel">
              메뉴 선택 <small id="selectTableName"></small>
            </h3>
          </div>
          <div class="modal-body">
            <div class="row">
              <div class="col-sm-8">
                <div role="tabpanel">

                  <!-- Nav tabs -->
                  <ul class="nav nav-pills" role="tablist">
                    <li role="presentation" class="active"><a href="#all" aria-controls="all" role="tab" data-toggle="tab">전체</a></li>
                    <c:if test="${fn:length(category) > 0}">
                    <c:forEach var="c" items="${category}">
                      <li role="presentation"><a href="#category${c.categoryCode}" aria-controls="category${c.categoryCode}" role="tab" data-toggle="tab">${c.categoryName}</a></li>
                    </c:forEach>
                    </c:if>
                  </ul>
                  <!-- Tab panes -->
                  <div class="tab-content">
                    <!-- 모든 카테고리 출력 -->
                    <div role="tabpanel" class="tab-pane active" id="all">
                      <div class="row">
                        <c:if test="${fn:length(productList) > 0}">
                          <c:forEach var="i" begin="0" end="${fn:length(productList)-1}">
                            <div class="col-sm-4">
                              <!-- 메뉴 패널 -->
                              <div class="panel panel-primary">
                                <c:set var="price" value="${productList[i].productPrice}" />
                                <c:set var="stock" value="${productList[i].productStock}" />
                                <div class="panel-body orderList" onclick="javascript:orderMenu(${i}, ${price}, ${stock})">
                                  <h3 id="${productList[i].productCode}" class="menuName">${productList[i].productName}</h3>
                                  <span class="label label-primary">${productList[i].productPrice}원</span> <span class="badge">${productList[i].productStock}</span>
                                </div>
                              </div>
                              <!-- 메뉴 패널 종료 -->
                            </div>
                          </c:forEach>
                        </c:if>
                      </div>
                    </div>
                    <!-- 매장의 카테고리 메뉴별 출력 -->
                    <c:if test="${fn:length(productList) > 0}">
                    <c:forEach var="c" items="${category}">
                      <div role="tabpanel" class="tab-pane" id="category${c.categoryCode}">
                        <div class="row">
                          <c:forEach var="i" begin="0" end="${fn:length(productList)-1}">
                            <!-- 카테고리 코드1  (식사) -->
                            <c:if test="${productList[i].categoryCode == c.categoryCode}">
                              <div class="col-sm-4">
                                <!-- 메뉴 패널 -->
                                <div class="panel panel-primary">
                                  <c:set var="price" value="${productList[i].productPrice}" />
                                  <c:set var="stock" value="${productList[i].productStock}" />
                                  <div class="panel-body" onclick="javascript:orderMenu(${i}, ${price}, ${stock})">
                                    <h3 id="${productList[i].productCode}" class="menuName">${productList[i].productName}</h3>
                                    <span class="label label-primary">${productList[i].productPrice}원</span> <span class="badge">${productList[i].productStock}</span>
                                  </div>
                                </div>
                                <!-- 메뉴 패널 종료 -->
                              </div>
                            </c:if>
                          </c:forEach>
                        </div>
                      </div>
                    </c:forEach>
                    </c:if>
                    <!-- 매장의 카테고리 메뉴별 출력 종료 -->
                  </div>
                  <!-- End tab content-->
                </div>
              </div>
              <div class="col-sm-4">
                <!-- 주문 선택내역 -->
                <div class="panel panel-primary">
                  <!-- Default panel contents -->
                  <div class="panel-heading">기존 주문 내역</div>
                  <!-- List group -->
                  <table class="table table-condensed" id="prevOrderList">
                    <thead>
                      <tr>
                        <th>이름</th>
                        <th>수량</th>
                        <th>가격</th>
                      </tr>
                    </thead>
                    <tbody>
                    </tbody>
                    <tfoot>
                      <tr class="info">
                        <td colspan="2">합계</td>
                        <td id="totalPrevOrderPrice"></td>
                      </tr>
                    </tfoot>
                  </table>
                </div>

                <form id="orderForm" action="insertOrder.do?mgrId=${sessionScope.id}" method="post">
                  <div class="panel panel-primary">
                    <!-- Default panel contents -->
                    <div class="panel-heading">주문 선택 내역</div>
                    <!-- List group -->
                    <table class="table table-condensed" id="newOrderList">
                      <thead>
                        <tr>
                          <th>이름</th>
                          <th>수량</th>
                          <th>가격</th>
                        </tr>
                      </thead>
                      <tbody>
                      </tbody>
                      <tfoot>
                        <tr class="info">
                          <td colspan="2">합계</td>
                          <td id="totalNewOrderPrice"></td>
                        </tr>
                      </tfoot>
                    </table>
                  </div>

                  <div class="panel panel-danger">
                    <!-- Default panel contents -->
                    <div class="panel-heading">주문 취소 내역</div>
                    <!-- List group -->
                    <table class="table table-condensed" id="cancelOrderList">
                      <thead>
                        <tr>
                          <th>이름</th>
                          <th>수량</th>
                          <th>가격</th>
                        </tr>
                      </thead>
                      <tbody>
                      </tbody>
                      <tfoot>
                        <tr class="danger">
                          <td colspan="2">합계</td>
                          <td id="totalCancelOrderPrice"></td>
                        </tr>
                      </tfoot>
                    </table>
                  </div>
                  <input type="hidden" name="orders" value="" />
                  <input type="hidden" name="insertOrdersDetail" value="" />
                  <input type="hidden" name="deleteOrdersDetail" value="" />
                </form>

              </div>
            </div>
            <!-- End row -->
          </div>
          <br>
          <div class="modal-footer">
            <button type="button" id="orderCancelButton" class="btn btn-default" data-dismiss="modal">취소</button>
            <button type="button" id="orderSubmitButton" class="btn btn-primary">주문</button>
          </div>
        </div>
      </div>
    </div>
    <!-- /.modal -->

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
  <jsp:include page="./orderjs.jsp" flush="false" />
  <!--[if lt IE 9]>
    <script src="<c:url value="/assets/plugins/respond.js"/>"></script>
    <script src="<c:url value="/assets/plugins/html5shiv.js"/>"></script>
    <script src="<c:url value="/assets/plugins/placeholder-IE-fixes.js"/>"></script>
<![endif]-->
</body>
</html>