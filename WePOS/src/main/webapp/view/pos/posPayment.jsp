<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- Modal -->
<div class="modal fade" id="paymentModal" tabindex="-1" role="dialog" aria-labelledby="paymentModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        <h3 class="modal-title">
          결제 <small id="paymentTableName"></small>
        </h3>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col-sm-8">
            <table id="paymentTable" class="table table-striped table-hover table-responsive">
              <thead>
                <tr class="info">
                  <th>#</th>
                  <th>이름</th>
                  <th>단가</th>
                  <th>수량</th>
                  <th>가격</th>
                </tr>
              </thead>

              <tbody>
              </tbody>

              <tfoot>
                <tr>
                  <td colspan=4 class="success">결제 할 금액</td>
                  <td class="totalPaymentPrice warning"></td>
                </tr>
              </tfoot>
            </table>
          </div>
          <div class="col-sm-4">
            <div role="tabpanel">

              <!-- Nav tabs -->
              <ul class="nav nav-pills nav-justified" role="tablist" id="paymentTab">
                <li id="cashNavTab" role="presentation"><a href="#cash" aria-controls="cash" role="tab" data-toggle="pill">현금</a></li>
                <li id="cardNavTab" role="presentation"><a href="#card" aria-controls="card" role="tab" data-toggle="pill">카드</a></li>
              </ul>

              <!-- Tab panes -->
              <div class="tab-content">
                <div role="tabpanel" class="tab-pane active" id="cash">
                  <form id="cashPaymentForm" action="posPayment.do" method="post">
                    <input type="hidden" id="userId" name="userId" value=""/> 
                    <input type="hidden" id="userPaymentPrice" name="userPaymentPrice" value=""/>
                    <input type="hidden" id="shopCode" name="shopCode" value="" />
                    <input type="hidden" id="tableCode" name="tableCode" value="" />
                    <input type="hidden" id="paymentCode" name="paymentCode" value="1" />
                    <div class="panel panel-primary" id="cashPaymentPanel">
                      <div class="panel-heading">받은 금액</div>
                      <div class="panel-body form-inline receivedMoney">
                        <div class="input-group">
                          <div class="input-group-addon">￦</div>
                          <input type="number" min="0" step="100" value="0" class="form-control input-lg" id="totalReceivedMoney" placeholder="금액 입력">
                        </div>
                      </div>
                      <!-- End received Money -->
                      <div role="group" aria-label="..." class="btn-group btn-group-justified">
                        <div class="btn-group" role="group">
                          <button type="button" class="btn btn-info receivedMoneyButton" data-toggle="tooltip">+50000</button>
                        </div>
                        <div class="btn-group" role="group">
                          <button type="button" class="btn btn-info receivedMoneyButton">+10000</button>
                        </div>
                        <div class="btn-group" role="group">
                          <button type="button" class="btn btn-info receivedMoneyButton">+5000</button>
                        </div>
                        <div class="btn-group" role="group">
                          <button type="button" class="btn btn-info receivedMoneyButton">+1000</button>
                        </div>
                      </div>
                      <div role="group" aria-label="..." class="btn-group btn-group-justified">
                        <div class="btn-group" role="group">
                          <button type="button" class="btn btn-info receivedMoneyButton" data-toggle="tooltip">-50000</button>
                        </div>
                        <div class="btn-group" role="group">
                          <button type="button" class="btn btn-info receivedMoneyButton">-10000</button>
                        </div>
                        <div class="btn-group" role="group">
                          <button type="button" class="btn btn-info receivedMoneyButton">-5000</button>
                        </div>
                        <div class="btn-group" role="group">
                          <button type="button" class="btn btn-info receivedMoneyButton">-1000</button>
                        </div>
                      </div>
                      <!-- End button group -->

                      <div class="panel-heading">청구 금액</div>
                      <div class="panel-body form-inline paymentMoney">
                        <div class="input-group">
                          <div class="input-group-addon">￦</div>
                          <input type="number" class="form-control input-lg" id="cashPaymentPrice" name="cashPaymentPrice" readonly>
                        </div>
                      </div>
                      <!-- End paymentMoney -->

                      <div class="panel-heading">거스름돈</div>
                      <div class="panel-body form-inline changeMoney">
                        <div class="input-group">
                          <div class="input-group-addon">￦</div>
                          <input type="number" class="form-control input-lg" id="changePrice" readonly>
                        </div>
                      </div>
                                           
                      <!-- End change -->
                    </div>
                    <!-- End payment Panel -->
                  </form>
                </div>


                <div role="tabpanel" class="tab-pane" id="card">
                  <form id="cardPaymentForm" action="posPayment.do" method="post">
                    <input type="hidden" id="userId" name="userId" value="">
                    <input type="hidden" id="userPaymentPrice" name="userPaymentPrice" value="">
                    <input type="hidden" id="shopCode" name="shopCode" value="" />
                    <input type="hidden" id="tableCode" name="tableCode" value="" />
                    <input type="hidden" id="paymentCode" name="paymentCode" value="2" />
                    <div class="panel panel-primary" id="cardPaymentPanel">
                      <div class="panel-heading">카드 번호</div>
                      <div class="panel-body form-inline cardNumber">
                        <div class="input-group">
                          <div class="input-group-addon">
                            <span class="glyphicon glyphicon-credit-card" aria-hidden="true"></span>
                          </div>
                          <input type="text" class="form-control input-lg" id="cardNumber" placeholder="카드번호">
                        </div>
                      </div>
                      <div role="group" class="btn-group btn-group-justified">
                        <div class="btn-group" role="group">
                          <button type="button" class="btn btn-info" id="cardReadButton" style="height:50px;">카드 읽기</button>
                        </div>
                      </div>
                      <!-- End card Number -->

                      <div class="panel-heading">청구 금액</div>
                      <div class="panel-body form-inline paymentMoney">
                        <div class="input-group">
                          <div class="input-group-addon">￦</div>
                          <input type="number" class="form-control input-lg" id="cardPaymentPrice" name="cardPaymentPrice" readonly>
                        </div>
                      </div>
                      <!-- End paymentMoney -->

                      <div class="panel-heading">처리 결과</div>
                      <div class="panel-body form-inline changeMoney">
                        <div class="input-group">
                          <div class="input-group-addon">
                            <span class="glyphicon glyphicon-ok"></span>
                          </div>
                          <input type="text" class="form-control input-lg" id="cardPaymentResult" placeholder="카드를 읽혀주세요" readonly>
                        </div>
                      </div>
                      <!-- End change -->
                    </div>
                    <!-- End payment Panel -->
                  </form>
                </div>
              </div>

            </div>



          </div>
        </div>
        <!-- End row -->
      </div>
      <br>
      <div class="modal-footer">
        <button type="button" id="paymentCancelButton" class="btn btn-default" data-dismiss="modal">취소</button>
        <button type="button" id="paymentSubmitButton" class="btn btn-primary">결제</button>
        <span style="float:left">
	      	<h3>적립 : 
	      	<input type="text" id="userPhoneNum" class="userPhoneNum" placeholder="연락처 뒤 4자리">
	      	<input type="button" id="searchUserButton" name="searchUserButton" class="btn btn-danger" value="회원검색">
	      	&nbsp;&nbsp;
      		<span id="userName" name="userName"></span>
      		<span id="comment" name="comment"></span><br>      		     		
	      	</h3>
      	</span>
      </div>
    </div>
  </div>
</div>
<!-- /.modal -->
