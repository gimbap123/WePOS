<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.*, com.wepos.common.*, com.wepos.common.dto.*"%>

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



</head>
<body>

	<form action="showBoard.do" name="searchBoard"
		onsubmit="return searchCheck()">

		<div class="wrapper">
			<!--=== Header ===-->
			<jsp:include page="header.jsp" flush="false" />

			<!--=== Search Block Version 2 ===-->
			<div class="search-block99">
				<div class="container">
					<div class="col-md-8 col-md-offset-1">
						<h2 style="text-align: left;">
							<img src="../image/common/wepos.png" style="float: left; margin: 0 10px 0 10px">
							여러분의 소중한 후기를 남겨주세요!
						</h2>

						<hr style="margin: 5px 0 0 5px">

						<h5>
							자유게시판은 회원 여러분들이 자유롭게 글을 등록하는 공간입니다.<br> 
							게시판에 글을 등록하시면 저희 WePOS에서 제공하는 다양한 혜택을<br> 
							누리실 수 있습니다. 여러분의 많은 관심을 부탁드립니다. 감사합니다!<br>
						</h5>

						<h6>
							(타인을 비방하는 글이나 상업성 광고 및 개인정보 유출 등에 해당하는 글은<br> 
							작성자에게 별도의 통보없이 즉시 삭제되오니 참고 부탁드립니다.)
						</h6>
					</div>
				</div>
			</div>
			<!--/container-->

			<!--=== End Search Block Version 2 ===-->
			<div class="container content-sm">
				<!-- Begin Table Search Panel v1 -->
				<div class="table-search-v1 panel panel-u margin-bottom-50">
					<div class="panel-heading">
						<h3 class="panel-title">
							<c:if test="${boardTypeCode==1}">
							<i class="icon-note"></i> 공지사항 ( 총 ${count} 건의 글 )
							</c:if>
							<c:if test="${boardTypeCode==2}">
							<i class="icon-note"></i> FAQ ( 총 ${count} 건의 글 )
							</c:if>
							
							<input type="hidden" name="boardTypeCode" value="${boardTypeCode}">

							<hr style="margin: 1px 0 1px 0">

							<div align="right" style="vertical-align: middle;">
								<select name="keyField" style="color: black; font-size: small;">
									<option value="title">글제목</option>
									<option value="writer">작성자</option>
									<option value="content">글내용</option>
									<option value="all">전체</option>
								</select> <input type="text" size="20" name="keyWord"
									style="height: 20px; color: black;">
								<!-- <input type="submit" value="검색" style="width: 50px; height: 20px; vertical-align: middle; text-align: center; color: gray;"> -->
								<b><a href="javascript:document.searchBoard.submit()"
									style="color: white; text-decoration: none;">[FIND]</a></b>
							</div>

						</h3>

					</div>
					<div class="table-responsive">
						<table id="resultTable"
							class="table table-bordered table-striped table-hover tablesorter">
							<thead>
								<tr>
									<th style="text-align:center" width="10%">글번호</th>
									<th style="text-align:center" width="50%">글제목</th>
									<th style="text-align:center" width="15%">작성자</th>
									<th style="text-align:center" width="15%">등록일</th>
									<th style="text-align:center" width="10%">조회수</th>
								</tr>
							</thead>

							<c:if test="${count==0}">
								<tr>
									<td colspan="5" style="text-align:center">등록된 게시물이 없습니다</td>
								</tr>
							</c:if>
							
							<c:if test="${count!=0}">
							<tbody>
								<c:forEach var="data" items="${list}">
									<tr>
										<td style="text-align:center">${data.boardNumber }</td>
										<td style="text-align:center">
											<a href="boardDetail.do?boardNumber=${data.boardNumber}&boardTypeCode=${boardTypeCode}">
											<%-- <a href="test.do?boardNumber=${data.boardNumber}&boardTypeCode=${boardTypeCode}"> --%>
												${data.boardTitle }
											</a>
										</td>
										<td style="text-align:center">${data.totalId }</td>
										<td style="text-align:center">${data.boardDate }</td>
										<td style="text-align:center">${data.boardReadCnt}</td>
									</tr>
								</c:forEach>
							</tbody>
							</c:if>

							<tr>
								<td align="center" colspan="5">${pagingHtml}</td>
							</tr>

						</table>

						<hr style="margin: 10px">

						<div align="right">
							<c:if test="${sessionScope.id==null}">
								<button class="btn-u" type="button"
									onClick="location.href='main.do'" style="margin: 0 5px 5px 0">
									<i class="icon-home"></i>
								</button>
							</c:if>

							<c:if test="${sessionScope.id!=null}">
								<c:if test="${sessionScope.id.equals('admin')}">
									<button class="btn-u" type="button" style="margin: 0 5px 5px 0"
										onclick="location.href='boardWrite.do?boardTypeCode=${boardTypeCode}'">
										<i class="icon-pencil"></i>
									</button>
									<button class="btn-u" type="button"
										onClick="location.href='main.do'" style="margin: 0 5px 5px 0">
										<i class="icon-home"></i>
									</button>
								</c:if>
							
								<c:if test="${!sessionScope.id.equals('admin') && boardTypeCode==1}">
									<button class="btn-u" type="button"
										onClick="location.href='main.do'" style="margin: 0 5px 5px 0">
										<i class="icon-home"></i>
									</button>
								</c:if>
								
								<c:if test="${!sessionScope.id.equals('admin') && boardTypeCode==2}">
									<button class="btn-u" type="button" style="margin: 0 5px 5px 0"
										onclick="location.href='boardWrite.do?boardTypeCode=${boardTypeCode}'">
										<i class="icon-pencil"></i>
									</button>
									<button class="btn-u" type="button"
										onClick="location.href='main.do'" style="margin: 0 5px 5px 0">
										<i class="icon-home"></i>
									</button>
								</c:if>
							</c:if>
							
						</div>
					</div>
				</div>
				<!-- End Table Search Panel v1 -->
			</div>
			<!-- End Content -->
			<jsp:include page="footer.jsp" flush="false" />
		</div>
		<!--/wrapper-->
	</form>

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