<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.wepos.common.*, com.wepos.common.dto.*" %>    
    
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
<link rel="stylesheet" href="<c:url value="/assets/plugins/animate.css" />">
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
<link rel="stylesheet" href="<c:url value="/assets/js/table_sorter/blue/style.css" />" type="text/css">



</head>
<body>


<form action="boardWrite.do">


<div class="wrapper">
    <!--=== Header ===-->
    <jsp:include page="header.jsp" flush="false" />
    
    
    <!--=== Search Block Version 2 ===-->
    <div class="search-block99">
      <div class="container">
        <div class="col-md-6 col-md-offset-3">
          <h2 style="text-align: center;">여러분의 소중한 후기를 남겨주세요!</h2>
          <div class="input-group">
            <form id="searchShop" action="searchShopProc.do" name="searchShop" method="get">
                </button>
              </span>
            </form>
          </div>
        </div>
      </div>
    </div>
    <!--/container-->
    <!--=== End Search Block Version 2 ===-->
    <div class="container content-sm">
      <!-- Begin Table Search Panel v1 -->
      <div class="table-search-v1 panel panel-dark margin-bottom-50">
        <div class="panel-heading">
          <h3 class="panel-title">
            <i class="icon-note"></i> 자유게시판 ( 총  ${count} 건의 글 )
          </h3>
        </div>
        <div class="table-responsive">
          <table id="resultTable" class="table table-bordered table-striped table-hover tablesorter">
            <thead>
              <tr>
                <th align="center">글번호</th>
                <th align="center">글제목</th>
                <th align="center">작성자</th>
                <th align="center">등록일</th>
                <th align="center">조회수</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="data" items="${list}" >
                <tr>
                  <td>${data.boardNumber }</td>
                  <td><a href="boardDetail.do?boardNumber=${data.boardNumber}">${data.boardTitle }</a></td>
                  <td>${data.totalId }</td>
                  <td>${data.boardDate }</td>
                  <td>${data.boardReadCnt}</td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
          
          <hr style="margin: 10px">
          
<div align="right">
<c:if test="${sessionScope.id==null}">  
	<!-- <input type="button" value="홈으로" onClick="location.href='main.do'" style="margin: 0 5px 5px 0"> --> 
	<button class="btn-u" type="button" onClick="location.href='main.do'" style="margin: 0 5px 5px 0"> 
	<i class="icon-home"></i>
	</button>
</c:if>  
  
<c:if test="${sessionScope.id!=null}">
	<!-- <input type="submit" value="글쓰기" style="margin: 0 5px 5px 0">
	<input type="button" value="홈으로" onClick="location.href='main.do'" style="margin: 0 5px 5px 0"> -->
	<button class="btn-u" type="submit" style="margin: 0 5px 5px 0"> 
	<i class="icon-pencil"></i>
	</button>
	<button class="btn-u" type="button" onClick="location.href='main.do'" style="margin: 0 5px 5px 0"> 
	<i class="icon-home"></i>
	</button>
</c:if>
</div>


        </div>
      </div>
      <!-- End Table Search Panel v1 -->
    </div>
    
    
<%--     
<c:if test="${sessionScope.id==null}">  
	<input type="button" value="홈으로" onClick="location.href='main.do'">  
</c:if>  
  
<c:if test="${sessionScope.id!=null}">
	<input type="submit" value="글쓰기">
	<input type="button" value="홈으로" onClick="location.href='main.do'">
</c:if>
 --%>


<%-- 
<center>

<form action="boardWrite.do">

<h3>글 목록보기</h3>

<hr>

<table>
	<tr>
		<th>글번호</th>
		<th>글제목</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회수</th>
		<th>첨부파일</th>
	</tr>

<c:forEach var="data" items="${list}" >

	<tr>
		<td>${data.boardNumber }</td>
		<td><a href="boardDetail.do?boardNumber=${data.boardNumber}">${data.boardTitle }</a></td>
		<td>${data.totalId }</td>
		<td>${data.boardDate }</td>
		<td>${data.boardReadCnt}</td>
		<td>${data.boardFile}</td>
	</tr>
	
	</c:forEach>
	
</table>

	<hr>

<c:if test="${sessionScope.id==null}">  
	<input type="button" value="홈으로" onClick="location.href='main.do'">  
</c:if>  
  
<c:if test="${sessionScope.id!=null}">
	<input type="submit" value="글쓰기">
	<input type="button" value="홈으로" onClick="location.href='main.do'">
</c:if>
</form>

</center>
 --%>


<!-- End Content -->
		<jsp:include page="footer.jsp" flush="false" />
	</div>
	<!--/wrapper-->
	
<!-- JS Global Compulsory -->			
<script type="text/javascript" src="../assets/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript" src="../assets/plugins/jquery/jquery-migrate.min.js"></script>
<script type="text/javascript" src="../assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- JS Implementing Plugins -->
<script type="text/javascript" src="../assets/plugins/back-to-top.js"></script>
<script type="text/javascript" src="../assets/plugins/smoothScroll.js"></script>
<script type="text/javascript" src="../assets/plugins/parallax-slider/js/modernizr.js"></script>
<script type="text/javascript" src="../assets/plugins/parallax-slider/js/jquery.cslider.js"></script>

<!-- JS Page Level -->           
<script type="text/javascript" src="../assets/js/app.js"></script>
<script type="text/javascript" src="../assets/js/plugins/parallax-slider.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function() {
      	App.init();       
        ParallaxSlider.initParallaxSlider();
    });
</script>


</form>


</body>
</html>