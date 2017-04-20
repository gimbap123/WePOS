<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- Modal -->
<div class="modal fade" id="moveTableModal" tabindex="-1" role="dialog" aria-labelledby="tableMoveModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        <h3 class="modal-title">
          테이블 이동 <small id="moveTableName text-danger">[이동 가능한 테이블만 표시됩니다.]</small>
        </h3>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col-sm-7">
            <c:forEach var="table" items="${tables}" varStatus="status">
              <c:forEach var="i" items="${movableTableCode}">
                <c:if test="${table.tableCode eq i}">
                  <div class="panel panel-success pos-move-table" data-code="${table.tableCode}" data-name="${table.tableName}">
                    <div class="panel-heading">
                      <h3 class="panel-title" id="panel-title">
                        <a role="button" class="anchorjs-link" href="#panel-title"> <span class="anchorjs-icon">${table.tableName}</span>
                        </a> <span class="badge pull-right" style="margin-top: 4px">${table.tableMax}인</span>
                      </h3>
                    </div>
                  </div>
                </c:if>
              </c:forEach>
            </c:forEach>

          </div>
          <div class="col-sm-5">
            <form id="moveTableForm" action="moveTable.do" method="get">
              <div class="panel panel-primary" id="moveTablePanel">
                <div class="panel-heading">이동 전 테이블</div>
                <div class="panel-body form-inline">
                  <div class="input-group">
                    <div class="input-group-addon">
                      <span class="glyphicon glyphicon-log-out" aria-hidden="true"></span>
                    </div>
                    <input type="text" class="form-control input-lg" id="fromTable" readonly>
                    <input type="hidden" id="fromTableCode" name="fromTableCode" value="">
                  </div>
                </div>

                <div class="panel-heading">이동 할 테이블</div>
                <div class="panel-body form-inline paymentMoney">
                  <div class="input-group">
                    <div class="input-group-addon">
                      <span class="glyphicon glyphicon-log-in"></span>
                    </div>
                    <input type="text" class="form-control input-lg" id="toTable" readonly>
                    <input type="hidden" id="toTableCode" name="toTableCode" value="">
                    <input type="hidden" id="shopCode" name="shopCode" value="">
                  </div>
                </div>
              </div>
            </form>
          </div>
          <!-- End col-sm-4 -->
        </div>
        <!-- End row -->
      </div>
      <!-- End modal-body -->
      <div class="modal-footer">
        <button type="button" id="moveCancelButton" class="btn btn-default" data-dismiss="modal">취소</button>
        <button type="button" id="moveSubmitButton" class="btn btn-primary">이동</button>
      </div>
    </div>
    <!-- End Modal content -->
  </div>
</div>
<!-- /.modal -->