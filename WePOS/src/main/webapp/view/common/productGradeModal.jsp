<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="modal-dialog">
	<input type="hidden" id="productCode" value="${productCode}">
	<input type="hidden" id="productName" value="${productName}">
	<div class="modal-content">
		<div class="modal-header">
                <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                <h4 id="myModalLabel1" class="modal-title"><font color="#72c02c">${productName}</font> 평점 보기</h4>
        </div>
        <div class="modal-body">
        	<div class="table-search-v1 panel panel-u margin-bottom-30" style="margin-top: 10px; margin-bottom: 10px;'">
	        	<div class="panel-heading">
					<h3 class="panel-title"><i class="icon-note"></i> ${productGradeCount}개의 상품평이 있습니다.</h3>	
				</div>
	        	<div class="table-responsive">
	        		<table class="table table-bordered table-striped table-hover tablesorter">
	        			<thead>
							<tr>
								<th width="15%">작성자</th>
								<th width="50%">상품평</th>
								<th width="15%">평점</th>
								<th width="20%">등록일</th>							
							</tr>
						</thead>
						<c:if test="${productGradeCount == 0}">
							<tr>
								<td colspan="4" style="text-align: center;">등록된 상품평이 없습니다.</td>
							</tr>
						</c:if>	
						<c:if test="${productGradeCount != 0}">
							<c:forEach items="${productGradeModalList}" var="productGrade">
								<tr>
									<td>${productGrade.userId}</td>
									<td>${productGrade.gradeComment}</td>
									<td>${productGrade.grade}</td>
									<td>${productGrade.gradeDate}</td>									
								</tr>
							</c:forEach>							
						</c:if>										    		
	        		</table>
	        	</div>        	
        	</div>
        	${pagingHtml}
        </div>
	</div>
</div>
