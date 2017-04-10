<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="table-search-v1 panel panel-u margin-bottom-30" style="margin-top: 20px;'">
	<div class="panel-heading">
		<h3 class="panel-title"><i class="icon-note"></i>공지사항</h3>	
	</div>	
	
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
			
			<c:if test="${shopNoticeCount == 0}">
				<tr>
					<td colspan="5" style="text-align:center">등록된 공지사항이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${shopNoticeCount != 0}">
				<c:forEach items="${shopNoticeList}" var="shopNotice">
					<tr>
						<td>${shopNotice.noticeNumber}</td>
						<td><a href="#">${shopNotice.noticeTitle}</a></td>
						<td>${shopNotice.mgrId}</td>
						<td>${shopNotice.noticeDate}</td>
						<td>${shopNotice.noticeReadCnt}</td>
					</tr>
				</c:forEach>
			</c:if>			
		</table>		
	</div>		
	
	${pagingHtml}
	
	<div class="row" style="margin-top: 5px; margin-bottom: 10px;">
		<div class="col-md-2 col-md-offset-4">			
			<select class="form-control" name="searchType" id="searchType">
				<c:forEach items="${searchTypeList}" var="data">
					<c:if test="${searchType eq data.key}">
						<option value="${data.key}" selected="selected">${data.value}</option>					
					</c:if>	
					<c:if test="${searchType ne data.key}">
						<option value="${data.key}">${data.value}</option>					
					</c:if>				
				</c:forEach>				
			</select>
		</div>
		<div class="col-md-3">
			<div class="input-group">
				<input type="text" class="form-control" name="searchText" id="searchText" value="${searchText}">
				<span class="input-group-btn">
					<button class="btn-u" type="button" style="height: 34px" onclick="searchShopNotice()">							
						<i class="fa fa-search"></i>
					</button>
				</span>	
			</div>
		</div>
	</div>	
	
</div>