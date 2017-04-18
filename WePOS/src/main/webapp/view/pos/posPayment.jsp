<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- Modal -->
<div class="modal fade" id="paymentModal" tabindex="-1" role="dialog" aria-labelledby="orderModalLabel" aria-hidden="true">
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
                  <td class="totalPaymentPrice warning"> </td>
                </tr>
              </tfoot>
            </table>
          </div>
          <div class="col-sm-4">
            <div class="panel panel-primary" id="paymentPanel">
              <div class="panel-heading">받은 금액</div>
              <div class="panel-body form-inline receivedMoney">
                <div class="input-group">
                  <div class="input-group-addon">￦</div>
                  <input type="number" min="0" step="100" class="form-control input-lg" id="totalReceivedMoney" placeholder="금액 입력">
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
              <!-- End button group -->
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
                  <input type="number" min="0" step="100" class="form-control input-lg" id="totalPaymentPrice" placeholder="금액 입력" readonly>
                </div>
              </div>
              <!-- End paymentMoney -->

              <div class="panel-heading">거스름돈</div>
              <div class="panel-body form-inline changeMoney">
                <div class="input-group">
                  <div class="input-group-addon">￦</div>
                  <input type="number" min="0" step="100" class="form-control input-lg" id="changePrice" placeholder="금액 입력" readonly>
                </div>
              </div>
              <!-- End change -->
            </div>
            <!-- End payment Panel -->
          </div>
        </div>
        <!-- End row -->
      </div>
      <br>
      <div class="modal-footer">
        <button type="button" id="paymentCancelButton" class="btn btn-default" data-dismiss="modal">취소</button>
        <button type="button" id="paymentSubmitButton" class="btn btn-primary">결제</button>
      </div>
    </div>
  </div>
</div>
<!-- /.modal -->
