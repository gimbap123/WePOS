<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
              <c:if test="${fn:length(category) <= 0}">
                <br>
                <h1 align="center">
                  등록된 상품분류가 없습니다 <a class="btn btn-success" href="updateCategoryView.do?mgrId=${sessionScope.id}">상품분류 설정</a>
                </h1>
              </c:if>
              <c:if test="${fn:length(category) > 0}">
                <ul class="nav nav-pills" role="tablist">
                  <li role="presentation" class="active"><a href="#all" aria-controls="all" role="tab" data-toggle="tab">전체</a></li>

                  <c:forEach var="c" items="${category}">
                    <li role="presentation"><a href="#category${c.categoryCode}" aria-controls="category${c.categoryCode}" role="tab" data-toggle="tab">${c.categoryName}</a></li>
                  </c:forEach>
                </ul>
              </c:if>
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
                              <span class="label label-primary">${productList[i].productPrice}원</span>
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
                                  <span class="label label-primary">${productList[i].productPrice}원</span>
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