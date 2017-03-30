<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.*, com.wepos.common.*, com.wepos.common.dto.*"%>

<%@ page
	import="java.util.*, com.wepos.common.*, com.wepos.common.dto.BoardDto"%>
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

<script language="JavaScript" src="../js/common/boardJs.js?v=2"></script>

</head>
<body>

	<%
		BoardDto boardDto = new BoardDto();
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
		<form name="boardDetail" enctype="multipart/form-data" method="post"
			action="boardDelete.do">

			<input type="hidden" name="boardNumber"
				value="${boardDto.boardNumber}">

			<div class="container content-sm">
				<!-- Begin Table Search Panel v1 -->
				<div class="table-search-v1 panel panel-dark margin-bottom-50">
					<div class="panel-heading">
						<h3 class="panel-title">
							<i class="icon-bubble "></i> 글 상세보기 ( ${boardDto.boardNumber}번 게시글 )
						</h3>
					</div>

					<div class="table-responsive">
						<table id="resultTable"
							class="table table-bordered table-striped table-hover tablesorter">

							<tr>
								<td width="5%" align="center">제 목</td>
								<td><input type="text" size="95%" name="boardTitle"
									value="${boardDto.boardTitle}" readonly></td>
							</tr>
							<tr>
								<td width="5%" align="center">작성자</td>
								<td><input type="text" size="95%" name="totalId"
									value="${boardDto.totalId}" readonly></td>
							</tr>
							<tr>
								<td width="5%" align="center">내 용</td>
								<td><textarea rows="20" cols="95%" style="resize: none"
										name="boardContent" readonly>${boardDto.boardContent}</textarea></td>
							</tr>

							<!-- <hr style="margin: 5px 0 5px 0"> -->

							<tr>
								<td width="5%" align="center">파 일</td>
								<td><a href="file.do?boardFile=${boardDto.boardFile}">${boardDto.boardFile}</a></td>
							</tr>

							<!-- <hr style="margin: 5px 0 5px 0"> -->

							<tr>
								<td colspan="2" align="right"><c:if
										test="${sessionScope.id==boardDto.totalId}">
										<input type="button" value="수정하기"
											onClick="location.href='boardRewrite.do?boardNumber=${boardDto.boardNumber}'">
										<%-- <input type="button" value="삭제하기" onClick="location.href='boardDelete.do?boardNumber=${boardDto.boardNumber}'"> --%>
										<input type="button" value="삭제하기" onClick="boardDelete()">
										<input type="button" value="돌아가기"
											onClick="location.href='showBoard.do'">
									</c:if> <c:if
										test="${sessionScope.id==null || sessionScope.id!=boardDto.totalId}">
										<input type="button" value="돌아가기"
											onClick="location.href='showBoard.do'">
									</c:if></td>
							</tr>
						</table>

					</div>
				</div>
				<!-- End Table Search Panel v1 -->
			</div>

		</form>
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