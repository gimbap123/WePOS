<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="modal-dialog">
	<div class="modal-content">
		<div class="modal-header">
                <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                <h4 id="myModalLabel1" class="modal-title">지난 <font color="#72c02c">예약내역</font> 조회</h4>
        </div>
	
        <div class="modal-body">
        	<div class="table-search-v1 panel panel-u margin-bottom-30" style="margin-top: 5px; margin-bottom: 5px;'">
	        	<div class="panel-heading">
					<h3 class="panel-title"><i class="icon-note"></i> 총 ${selectPastResCount}건의 내역이 있습니다.</h3>	
				</div>
	        	<div class="table-responsive">	
	        		<table class="table table-bordered table-striped table-hover tablesorter">
	        			<thead>
							<tr>
								<th width="15%">매장코드</th>
								<th width="35%">예약날짜</th>
								<th width="35%">주문내역</th>
								<th width="15%">예약상태</th>							
							</tr>
						</thead>
						
						<c:if test="${reservationControlOneList == null || reservationControlTwoList == null}">
							<tr>
								<td colspan="4" style="text-align: center;">예약내역이 존재하지 않습니다</td>
							</tr>
						</c:if>		
						<c:if test="${reservationControlOneList != null || reservationControlTwoList != null}">
							<c:forEach items="${reservationControlAllList}" var="reservationContAll">
								<tr>
									<td>${reservationContAll.shopCode}</td>
									<td>${reservationContAll.resDate}</td>
									<td>${reservationContAll.resDesc}</td>
									<c:if test="${reservationContAll.resState == 1}">
										<td>예약완료</td>		
									</c:if>		
									<c:if test="${reservationContAll.resState == 2}">
										<td>예약취소</td>		
									</c:if>			
								</tr>
							</c:forEach>							
						</c:if>										    			
	        		</table>
	        	</div>        	
        	</div>
        	${pagingHtml}
        </div>
        
        <div class="row" style="margin-top: 5px; margin-bottom: 20px;">
			<div class="col-md-4 col-md-offset-3">			
				<select class="form-control" name="searchBoardType" id="searchBoardType">
					<option value="0" selected="selected">예약완료</option>					
					<option value="1">예약취소</option>					
				</select>
			</div>
			<div class="col-md-4">
				<button class="btn-u" type="button"><i class="icon-search"></i>조회하기</button>
				<%-- <button class="btn-u" type="button" onclick="location.href='../common/shopBoardWrite.do?shopCode=${shopCode}&menuType=${menuType}'"><i class="icon-search"></i>조회하기</button> --%>				
			</div>			
		</div>
        
	</div>
</div>
