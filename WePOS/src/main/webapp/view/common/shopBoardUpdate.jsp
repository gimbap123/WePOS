<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Favicon -->
<link rel="shortcut icon" href="favicon.ico">
    
<!-- Web Fonts -->
<link rel='stylesheet' type='text/css' href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin'>

<!-- CSS Global Compulsory -->
<link rel="stylesheet" href="../assets/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="../assets/css/style.css">

<!-- CSS Header and Footer -->
<link rel="stylesheet" href="../assets/css/headers/header-default.css">
<link rel="stylesheet" href="../assets/css/footers/footer-v1.css">

<!-- CSS Implementing Plugins -->
<link rel="stylesheet" href="../assets/plugins/animate.css">
<link rel="stylesheet" href="../assets/plugins/line-icons/line-icons.css">
<link rel="stylesheet" href="../assets/plugins/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="../assets/plugins/cube-portfolio/cubeportfolio/css/cubeportfolio.min.css">    
<link rel="stylesheet" href="../assets/plugins/cube-portfolio/cubeportfolio/custom/custom-cubeportfolio.css">

<!-- CSS Page Style -->
<link rel="stylesheet" href="../assets/css/pages/page_search_inner_tables.css">

<script language="JavaScript" src="../js/common/shopDetailJs.js"></script>

<title>We POS</title>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="header.jsp" flush="false" />
		
		<div class="container content-sm">
			<div class="table-search-v1 panel panel-u margin-bottom-20">
				<div class="panel-heading">
					<h3 class="panel-title">
						<i class="icon-bubble "></i> 글수정
					</h3>
				</div>				
			</div>			
				<div class="table-responsive">		
					<form action="shopBoardUpdate.do" name="shopBoardUpdateForm" enctype="multipart/form-data" method="post">
						<input type="hidden" name="boardNumber" value="${shopBoard.boardNumber}">
						<input type="hidden" name="menuType" value="${menuType}">
						<table class="table table-bordered table-striped table-hover tablesorter">
							<tr>
								<td style="vertical-align: middle; text-align: center;">제 목</td>
								<td>
									<input type="text" class="form-control" id="boardTitle" name="boardTitle" value="${shopBoard.boardTitle}">
								</td>
							</tr>
							<tr>
								<td style="vertical-align: middle; text-align: center;">작성자</td>
								<td><input type="text" class="form-control" id="totalId" name="totalId" value="${shopBoard.totalId}" readonly="readonly"></td>
							</tr>
							<tr>
								<td style="vertical-align: middle; text-align: center;">내 용</td>
								<td>
									<textarea class="form-control" rows="15" id="boardContent" name="boardContent" style="resize: none;">${shopBoard.boardContent}</textarea>
								</td>
							</tr>
							<tr>
								<td style="vertical-align: middle; text-align: center;">첨부 파일</td>
								<td>
									<c:if test="${shopBoard.boardFile == null}">
										첨부된 파일이 없습니다.
									</c:if>
									<c:if test="${shopBoard.boardFile != null}">
										<input type="text" class="form-control" id="boardFile" name="boardFile" value="${shopBoard.boardFile}" readonly="readonly">
									</c:if>
								</td>
							</tr>
							<tr>
								<td style="vertical-align: middle; text-align: center;">첨부 파일</td>
								<td><input type="file" class="form-control" name="upload"></td>
							</tr>
							<tr>
								<td colspan="2" style="vertical-align: middle;" align="right">							
									<button class="btn-u" type="button" onclick="shopBoardUpdate()">수정</button>
									<button class="btn-u" type="button" style="margin-right: 10px;" onclick="history.back()">취소</button>										
								</td>
							</tr>
						</table>	
					</form>			
				</div>			
		</div>
					
		<jsp:include page="footer.jsp" flush="false" />		
	</div>
<!-- JS Global Compulsory -->           
<script type="text/javascript" src="../assets/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript" src="../assets/plugins/jquery/jquery-migrate.min.js"></script>
<script type="text/javascript" src="../assets/plugins/bootstrap/js/bootstrap.min.js"></script> 
<!-- JS Implementing Plugins -->           
<script type="text/javascript" src="../assets/plugins/back-to-top.js"></script>
<script type="text/javascript" src="../assets/plugins/smoothScroll.js"></script>
<script type="text/javascript" src="../assets/plugins/cube-portfolio/cubeportfolio/js/jquery.cubeportfolio.min.js"></script>
<!-- JS Page Level -->
<script type="text/javascript" src="../assets/js/app.js"></script>
<script type="text/javascript" src="../assets/js/plugins/cube-portfolio/cube-portfolio-2.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function() {
        App.init();        
        });
</script>
</body>
</html>