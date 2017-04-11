<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="panel panel-profile">
	<div class="panel-body margin-bottom-30">		
		<c:forEach items="${shopBoardReplyList}" var="shopBoardReply">
			<div class="media media-v2">
				<div class="media-body">
					<h4 class="media-heading">
                        <strong>${shopBoardReply.totalId}</strong>
                        <small>${shopBoardReply.replyDate}</small>
                    </h4>
                    <div id="contentDiv${shopBoardReply.replyNumber}">
                    	<p>${shopBoardReply.replyContent}</p>
                    </div>                                       
				</div>
				<c:if test="${sessionScope.id eq shopBoardReply.totalId}">
					<ul id="functionUl${shopBoardReply.replyNumber}" class="list-inline pull-right">
						<li><a href="javascript:updateReply('${shopBoardReply.replyNumber}', '${shopBoardReply.replyContent}')"><i class="expand-list rounded-x fa fa-pencil"></i> 수정</a></li>
                        <li><a href="javascript:deleteReply('${shopBoardReply.replyNumber}')"><i class="expand-list rounded-x fa fa-times"></i> 삭제</a></li>
					</ul>
				</c:if>
			</div>
		</c:forEach>
		<input type="hidden" id="pageNum" name="pageNum" value="${pageNum}">
	</div>	
	${pagingHtml}
</div>