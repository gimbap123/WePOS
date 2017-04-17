<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="table-search-v1 panel panel-u margin-bottom-30" style="margin-top: 20px;'">
	<div class="panel-heading">
		<h3 class="panel-title"><i class="icon-note"></i> 자유 게시판 (총 ${shopBoardCount}개의 게시물이 있습니다.)</h3>	
	</div>	
	<input type="hidden" name="menuType" value="${menuType}">
	
	<div class="table-responsive">
		<table id="resultTable" class="table table-bordered table-striped table-hover tablesorter">
			<thead>
				<tr>
					<th width="10%">글번호</th>
					<th width="50%">제목</th>
					<th width="15%">작성자</th>
					<th width="15%">등록일</th>
					<th width="10%">조회수</th>
				</tr>
			</thead>
			
			<c:if test="${shopBoardCount == 0}">
				<tr>
					<td colspan="5" style="text-align:center">등록된 게시물이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${shopBoardCount != 0}">
				<c:forEach items="${shopBoardList}" var="shopBoard">
					<tr>
						<td>${shopBoard.boardNumber}</td>
						<td><a href="../common/shopBoardDetail.do?boardNumber=${shopBoard.boardNumber}&menuType=${menuType}">${shopBoard.boardTitle}</a></td>
						<td>${shopBoard.totalId}</td>
						<td>${shopBoard.boardDate}</td>
						<td>${shopBoard.boardReadCnt}</td>
					</tr>
				</c:forEach>
			</c:if>			
		</table>		
	</div>		
	
	${pagingHtml}
	
	<div class="row" style="margin-top: 5px; margin-bottom: 10px;">
		<div class="col-md-2 col-md-offset-4">			
			<select class="form-control" name="searchBoardType" id="searchBoardType">
				<c:forEach items="${searchBoardTypeList}" var="data">
					<c:if test="${searchBoardType eq data.key}">
						<option value="${data.key}" selected="selected">${data.value}</option>					
					</c:if>	
					<c:if test="${searchBoardType ne data.key}">
						<option value="${data.key}">${data.value}</option>					
					</c:if>				
				</c:forEach>				
			</select>
		</div>
		<div class="col-md-3">
			<div class="input-group">
				<input type="text" class="form-control" name="searchBoardText" id="searchBoardText" value="${searchBoardText}">
				<span class="input-group-btn">
					<button class="btn-u" type="button" style="height: 34px" onclick="searchShopBoard()">							
						<i class="fa fa-search"></i>
					</button>
				</span>	
			</div>
		</div>
		<c:if test="${sessionScope.id != null}">
			<div class="col-md-3">
				<button class="btn-u" type="button" onclick="location.href='../common/shopBoardWrite.do?shopCode=${shopCode}&menuType=${menuType}'"><i class="icon-pencil"></i> 글쓰기</button>				
			</div>			
		</c:if>
	</div>	
	
</div>