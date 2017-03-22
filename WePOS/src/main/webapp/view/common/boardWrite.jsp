<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>We POS</title>

<script language="JavaScript" src="../js/common/boardJs.js?v=1"></script>

</head>
<body>
<jsp:include page="header.jsp" flush="false" /> 
<h3>자유게시판</h3>
<hr>
<form name="boardWrite" enctype="multipart/form-data" method="post" action="boardWrite.do">
<input type="text" name="boardTitle" placeholder="제목"><p>  
 <input type="text" name="totalId" value="${sessionScope.id}" readonly><p>  
 <textarea rows="10" cols="50" style="resize: none" name="boardContent" placeholder="내용을 입력하세요."></textarea>p>  
<hr>
<input type="button" value="등록" onclick="checkWrite()">
<input type="button" value="목록" onclick="javascript:history.back()">
<input type="file" name="upload" value="파일 첨부">
</form>

</body>
</html>