<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.*, com.wepos.common.*, com.wepos.common.dto.*"%>

<%@ page
	import="java.util.*, com.wepos.common.*, com.wepos.common.dto.BoardDto"%>
<%@ page import="com.wepos.common.dto.ReplyDto" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>We POS</title>

<!-- Meta -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Favicon -->
<link rel="shortcut icon" href="favicon.ico">

<!-- Web Fonts -->
<link rel='stylesheet' type='text/css'
	href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin'>

<!-- CSS Global Compulsory -->
<link rel="stylesheet"
	href="<c:url value="/assets/plugins/bootstrap/css/bootstrap.min.css" />">
<link rel="stylesheet" href="<c:url value="/assets/css/style.css" />">

<!-- CSS Header and Footer -->
<link rel="stylesheet"
	href="<c:url value="/assets/css/headers/header-default.css" />">
<link rel="stylesheet"
	href="<c:url value="/assets/css/footers/footer-v1.css" />">

<!-- CSS Implementing Plugins -->
<link rel="stylesheet"
	href="<c:url value="/assets/plugins/animate.css" />">
<link rel="stylesheet"
	href="<c:url value="/assets/plugins/line-icons/line-icons.css" />">
<link rel="stylesheet"
	href="<c:url value="/assets/plugins/font-awesome/css/font-awesome.min.css" />">

<!-- CSS Page Style -->
<link rel="stylesheet"
	href="<c:url value="/assets/css/pages/page_search_inner_tables.css" />">

<!-- CSS Customization -->
<link rel="stylesheet" href="<c:url value="/assets/css/custom.css" />">

<!-- table Sorter CSS ( devdra9 added ) -->
<link rel="stylesheet"
	href="<c:url value="/assets/js/table_sorter/blue/style.css" />"
	type="text/css">

<script language="JavaScript" src="../js/common/boardJs.js?v=1"></script>


<style>
.dropbtn {
    background-color: white;
    color: black;
    font-size: 16px;
    border: none;
    cursor: pointer;
    
}

.dropbtn:hover, .dropbtn:focus {
    background-color: white;
}

.dropdown {
    position: relative;
    display: inline-block;
}

.dropdown-content {
    display: none;
    width: 60px;
    position: absolute;
    background-color: #f9f9f9;
    overflow: auto;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
}

.dropdown-content a {
    color: black;
    padding: 5px 15px;
    text-decoration: none;
    display: block;
}

.dropdown a:hover {background-color: #f1f1f1}

.show {display:block;}
</style>


</head>
<body>

	<%
		BoardDto boardDto = new BoardDto();
		ReplyDto replyDto = new ReplyDto();
	%>

	<div class="wrapper">
		<!--=== Header ===-->
		<jsp:include page="header.jsp" flush="false" />

		<!--=== Search Block Version 2 ===-->
		<div class="search-block99">
			<div class="container">
				<div class="col-md-8 col-md-offset-1">
					<h2 style="text-align: left;">글을 확인하실 수 있습니다.</h2>
				</div>
			</div>
		</div>
		<!--/container-->

			<input type="hidden" name="boardNumber" value="${boardDto.boardNumber}">

			<div class="container content" style="width: 60%; min-height: 558px">
				<div class="row blog-page">
					<div class="col-md-12">
						<div class="blog margin-bottom-40">
						
		<form name="boardDetail" enctype="multipart/form-data" method="post"
			action="boardDelete.do?boardNumber=${boardDto.boardNumber}&boardTypeCode=${boardTypeCode}">
			<input type="hidden" name="boardNumber=${boardDto.boardNumber }">
			
							<h2 style="color:green; ">${boardDto.boardTitle}</h2>
							<div class="blog-post-tags">
								<ul class="list-unstyled list-inline blog-info">
									<li><i class="fa fa-calendar"></i> ${boardDto.boardDate}</li>
									<li><i class="fa fa-pencil"></i> ${boardDto.totalId}</li>
									<li><i class="fa fa-comments"></i> ${repCount}개의 댓글</li>
								</ul>
							</div>
							<hr>
							<div class="blog-img">

								<img class="img-responsive" src="${boardDto.boardFile}" alt="">
								
							</div>
							<p>${boardDto.boardContent}</p>
							<hr>
							<b>첨부파일:</b> <a href="file.do?boardFile=${boardDto.boardFile}">${boardDto.boardFile}</a>
							<c:if test="${boardDto.boardFile==null}">
								파일이 존재하지 않습니다.
							</c:if>

								<c:if test="${sessionScope.id==boardDto.totalId}">	
								<a class="btn-u btn-u-small" onClick="location.href='showBoard.do?boardTypeCode=${boardTypeCode}'" style="float: right;"><i
									class="fa fa-plus-sign"></i> 돌아가기</a>
								<a class="btn-u btn-u-small" onClick="boardDelete()" style="float: right;"><i
									class="fa fa-plus-sign"></i> 삭제하기</a>
								<a class="btn-u btn-u-small" onClick="location.href='boardRewrite.do?boardNumber=${boardDto.boardNumber}&boardTypeCode=${boardTypeCode}'" style="float: right;"><i
									class="fa fa-plus-sign"></i> 수정하기</a>
								</c:if>
								<c:if test="${sessionScope.id==null || sessionScope.id!=boardDto.totalId}">
								<a class="btn-u btn-u-small" onClick="location.href='showBoard.do?boardTypeCode=${boardTypeCode}'" style="float: right;"><i
									class="fa fa-plus-sign"></i> 돌아가기</a>
								</c:if>
							
					</form>

							<div style="height: 20px"></div>
							<div class="headline" ><h3>Comment</h3></div>
							
					<form name="boardReply" method="post" action="boardReply.do?boardNumber=${boardDto.boardNumber}">		
							
							<c:if test="${sessionScope.id==null}">
								<div class="input-group margin-bottom-20">
									<textarea rows="3" cols="100%" style="resize: none; width: 100%" name="replyContent" placeholder="먼저 로그인을 해주세요!" onClick="location.href='login.do'"></textarea>
									<span class="input-group-addon"><b>등록</b></span>
								</div>
							</c:if>
							<c:if test="${sessionScope.id!=null}">
								<div class="input-group margin-bottom-20" name="repContent">
									<textarea rows="3" cols="100%" style="resize: none; width: 100%" name="replyContent" id="replyContent" placeholder="내용을 작성하세요." maxlength="100"></textarea>
									<span class="input-group-addon"><a href="javascript:replyCheck()"><b>등록</b></a></span>
								</div>
							</c:if>
							
							<input type="hidden" name="totalId" class="totalId" id="totalId" value="${sessionScope.id}">
							<input type="hidden" name="replyContent" value="${reply.replyContent }">
							<input type="hidden" name="boardTypeCode" value="${boardTypeCode}">
							
					</form>
					
					<div id="boardReplys">
					<form name="boardReplys" method="post" action="boardReplys.do?boardNumber=${boardDto.boardNumber}&boardTypeCode=${boardTypeCode}">
					</div>
					
					<input type="hidden" id="boardNumber" name="boardNumber" value="${boardDto.boardNumber}">
					<input type="hidden" id="boardTypeCode" name="boardTypeCode" value="${boardTypeCode}">
					
							<hr style="margin: 0 0 20px 0">

							<c:set var="cnt" value="1" />
							<c:forEach var="reply" items="${replyList}">
							<table>
								<tr>
								<td>
								<div class="dropdown">
									<a class="dropbtn" id="replyTotalId" style="color: blue;font-weight: bolder; font-size: 15px; text-decoration: none;" onmouseover="javascript:checkRepId('${reply.totalId}')">${reply.totalId }</a>
								  	<div class="dropdown-content" id="dropdown-content">
								    	<a href="javascript:repEdit('${reply.replyContent}', '${reply.replyNumber}', '${cnt}')" class="repEdit">수정</a>
								    	<a href="#">삭제</a>
								 	 </div>
								</div>
									<font style="color: gray;">${reply.replyDate }</font>
								</td>
								</tr>

								<tr>
									<td name="repContents${cnt}" class="repContents${cnt}" id="repContents${reply.replyNumber}">${reply.replyContent }</td>
								</tr>
								
							<%-- <div>
								<c:if test="${sessionScope.id eq reply.totalId}">
									<ul id="functionUl${reply.replyNumber}" class="list-inline pull-right">
										<li><a href="javascript:updateReply('${reply.replyNumber}', '${reply.replyContent}')"><i class="expand-list rounded-x fa fa-pencil"></i> 수정</a></li>
				                        <li><a href="javascript:deleteReply('${reply.replyNumber}')"><i class="expand-list rounded-x fa fa-times"></i> 삭제</a></li>
									</ul>
								</c:if>
							</div> --%>

							</table>
							<hr style="margin: 20px 0 20px 0">
								<c:set var="cnt" value="${cnt+1}"  />
							</c:forEach>

					</form>				
					
						</div>
					</div>
				</div>
			</div>
			

		<!-- End Content -->

		<jsp:include page="footer.jsp" flush="false" />

	</div>
	<!--/wrapper-->

	<!-- JS Global Compulsory -->
	<script type="text/javascript"
		src="../assets/plugins/jquery/jquery.min.js"></script>
	<script type="text/javascript"
		src="../assets/plugins/jquery/jquery-migrate.min.js"></script>
	<script type="text/javascript"
		src="../assets/plugins/bootstrap/js/bootstrap.min.js"></script>
	<!-- JS Implementing Plugins -->
	<script type="text/javascript" src="../assets/plugins/back-to-top.js"></script>
	<script type="text/javascript" src="../assets/plugins/smoothScroll.js"></script>
	<script type="text/javascript"
		src="../assets/plugins/parallax-slider/js/modernizr.js"></script>
	<script type="text/javascript"
		src="../assets/plugins/parallax-slider/js/jquery.cslider.js"></script>

	<!-- JS Page Level -->
	<script type="text/javascript" src="../assets/js/app.js"></script>
	<script type="text/javascript"
		src="../assets/js/plugins/parallax-slider.js"></script>
	<script type="text/javascript">
		jQuery(document).ready(function() {
			App.init();
			ParallaxSlider.initParallaxSlider();
		});

	</script>
	
</body>
</html>
