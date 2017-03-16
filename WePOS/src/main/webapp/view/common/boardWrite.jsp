<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script language="JavaScript" src="../view/common/script.js?v=1"></script>

</head>
<body>

<h3>자유게시판</h3>
<hr>
<form name="boardWrite" method="post" action="boardWrite.do">
<input type="text" name="boardTitle" value="제목"><p>
<input type="text" name="totalId" value="아이디"><p>
<textarea rows="10" cols="50" style="resize: none" name="boardContent">내용을 입력하세요.</textarea><p>
<hr>
<input type="button" value="등록" onclick="checkWrite()">
<input type="button" value="목록" onclick="javascript:history.back()">
<input type="button" value="파일 첨부">
</form>

</body>
</html>