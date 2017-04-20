<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- Modal -->
<div class="modal fade" id="joinTableModal" tabindex="-1" role="dialog" aria-labelledby="tableMoveModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        <h3 class="modal-title">
          테이블 합석<small id="joinTableName text-danger"></small>
        </h3>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col-sm-7">
            <c:forEach var="table" items="${tables}" varStatus="tableStatus">
              <c:set var="flag" value="false" />
              <c:forEach var="i" items="${movableTableCode}" varStatus="iStatus">
                <c:if test="${flag eq 'false'}">
                <c:choose>
                  <c:when test="${table.tableCode eq i}">
                    <c:set var="break" value="true"/>
                  </c:when>
                  <c:otherwise>
                    <c:if test="${iStatus.last eq true}">
                      ${table.tableCode} / ${i} <br>
                      <div class="panel panel-success pos-join-table" data-code="${table.tableCode}" data-name="${table.tableName}">
                        <div class="panel-heading">
                          <h3 class="panel-title" id="panel-title">
                            <a role="button" class="anchorjs-link" href="#panel-title"> <span class="anchorjs-icon">${table.tableName}</span>
                            </a> <span class="badge pull-right" style="margin-top: 4px">${table.tableMax}인</span>
                          </h3>
                        </div>
                      </div>
                    </c:if>
                  </c:otherwise>
                </c:choose>
                </c:if>
              </c:forEach>
            </c:forEach>

          </div>
          <div class="col-sm-5">
            <form id="joinTableForm" action="moveTable.do" method="get">
              <div class="panel panel-primary" id="joinTablePanel">
                <div class="panel-heading">이동 전 테이블</div>
                <div class="panel-body form-inline">
                  <div class="input-group">
                    <div class="input-group-addon">
                      <span class="glyphicon glyphicon-log-out" aria-hidden="true"></span>
                    </div>
                    <input type="text" class="form-control input-lg" id="joinFromTable" readonly>
                    <input type="hidden" id="joinFromTableCode" name="joinFromTableCode" value="">
                  </div>
                </div>

                <div class="panel-heading">합석 할 테이블</div>
                <div class="panel-body form-inline paymentMoney">
                  <div class="input-group">
                    <div class="input-group-addon">
                      <span class="glyphicon glyphicon-log-in"></span>
                    </div>
                    <input type="text" class="form-control input-lg" id="joinToTable" readonly>
                    <input type="hidden" id="joinToTableCode" name="joinToTableCode" value="">
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
        <button type="button" id="joinCancelButton" class="btn btn-default" data-dismiss="modal">취소</button>
        <button type="button" id="joinSubmitButton" class="btn btn-primary">이동</button>
      </div>
    </div>
    <!-- End Modal content -->
  </div>
</div>
<!-- /.modal -->