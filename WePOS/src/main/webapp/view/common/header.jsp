<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--=== Header ===-->
<div class="header">
	<div class="container">
		<!-- Logo -->		
		<a class="logo" href="../common/main.do"> <img src="../image/common/logo.png" alt="Logo">
		</a>		
		<!-- End Logo -->
		<!-- Topbar -->
		<div class="topbar">
			<ul class="loginbar pull-right">
				<c:if test="${sessionScope.id == null}">
					<li><a href="../common/terms.do">회원가입</a></li>
					<li class="topbar-devider"></li>
					<li><a href="../common/login.do">로그인</a></li>
				</c:if>
				<c:if test="${sessionScope.id != null}">
					<c:if test="${sessionScope.userType== 1}">
						<li><a href="../common/reservationCheck.do?userId=${sessionScope.id}">예약내역</a></li>
						<li class="topbar-devider"></li>		
						<li><a href="../common/showUserInfo.do?userId=${sessionScope.id}">회원정보</a></li>
					</c:if>
					<c:if test="${sessionScope.userType== 2}">
						<li><a href="../admin/showMgrInfo.do?mgrId=${sessionScope.id}">관리자 정보</a></li>
					</c:if><c:if test="${sessionScope.userType== 3}">
						<li><a href="../common/showUserInfo.do?userId=${sessionScope.id}">마스터 정보</a></li>
					</c:if>
					<li class="topbar-devider"></li>				
					<li><a href="../common/logout.do">로그아웃</a></li>
				</c:if>
			</ul>	
		</div>
		<!-- End Topbar -->
	</div>
	<!--/end container-->
	

	<!-- Collect the nav links, forms, and other content for toggling -->
	<div
		class="collapse navbar-collapse mega-menu navbar-responsive-collapse">
		<div class="container">
			<ul class="nav navbar-nav">
				<!-- WE POS -->
				<li class="dropdown"><a href="javascript:void(0);"
					class="dropdown-toggle" data-toggle="dropdown"> WE POS </a>
					<ul class="dropdown-menu">
						<li><a href="../common/showBoard.do?boardTypeCode=1">공지사항</a></li>
						<li><a href="../common/posIntroduce.do">We POS 소개</a></li>
					</ul></li>
				<!-- End WE POS -->
				
				<!-- 매장 관리(관리자 기능) -->				
				<c:if test="${sessionScope.userType == 2}">
				<li class="dropdown"><a href="javascript:void(0);"
					class="dropdown-toggle" data-toggle="dropdown"> 매장 관리 </a>
					<ul class="dropdown-menu">
						<li><a href="<c:url value="/pos/posMain.do?mgrId=${sessionScope.id}"/>">매장 영업</a></li>
						<li class="dropdown-submenu">
							<a href="javascript:void(0);">매장 관리</a>														
							<ul class="dropdown-menu">
								<li><a href="../pos/updateCategoryView.do?mgrId=${sessionScope.id}">상품분류 관리</a></li>
								<li><a href="../pos/updateProductView.do?mgrId=${sessionScope.id}">상품 관리</a></li>
								<li><a href="../pos/updateTableView.do?mgrId=${sessionScope.id}">테이블 관리</a></li>
								<li><a href="../pos/posReservation.do?mgrId=${sessionScope.id}&shopCode=${sessionScope.shopCode}">예약 관리</a></li>
							</ul>
						</li>
						<li class="dropdown-submenu">
							<a href="javascript:void(0);">매장 통계</a>														
							<ul class="dropdown-menu">
								<li><a href="../pos/salesLog.do?mgrId=${sessionScope.id}">매출 통계</a></li>
								<li><a href="../pos/posChartStats.do?shopCode=${sessionScope.shopCode}">차트 통계</a></li>	
							</ul>
						</li>
						
						<li class="dropdown-submenu">
							<a href="javascript:void(0);">매장 페이지 관리</a>
							<ul class="dropdown-menu">
								<li><a href="../pos/shopInfoUpdate.do?shopCode=${sessionScope.shopCode}">매장 정보</a></li>
								<li><a href="../pos/posShopNotice.do?shopCode=${sessionScope.shopCode}">공지사항</a></li>
								<li><a href="../pos/posShopBoard.do?shopCode=${sessionScope.shopCode}">자유 게시판</a></li>									
							</ul>
						</li>
					</ul></li>
				</c:if>			
				<!-- End 매장 관리(관리자 기능) -->
				
				<!-- WePOS 관리자 기능 -->
				<c:if test="${sessionScope.userType == 3}">
				<li class="dropdown"><a href="javascript:void(0);"
					class="dropdown-toggle" data-toggle="dropdown"> 관리자 기능 </a>
					<ul class="dropdown-menu">
						<li><a href="../admin/shopRegistration.do">매장 추가</a></li>
						<li><a href="../admin/shopMgrRegistration.do">매장 관리자 추가</a></li>						
					</ul></li>
				</c:if>
				<!-- End WePOS 관리자 기능 -->

				<!-- 검 색 -->
				<li class="dropdown"><a href="javascript:void(0);"
					class="dropdown-toggle" data-toggle="dropdown"> 검 색 </a>
					<ul class="dropdown-menu">		
						<li><a href="../common/searchShop.do">매장 검색</a></li>						
						<li><a href="../common/searchProduct.do">상품 검색</a></li>
					</ul></li>
				<!-- End 검색 -->

				<!-- 게시판 -->
				<li><a href="../common/showBoard.do?boardTypeCode=2">자유게시판</a></li>
			</ul>
		</div>
		<!--/end container-->
	</div>
	<!--/navbar-collapse-->
</div>
<!--=== End Header ===-->