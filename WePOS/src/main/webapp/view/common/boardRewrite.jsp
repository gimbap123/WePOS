<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*, com.wepos.common.*, com.wepos.common.dto.*" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script language="JavaScript" src="../view/common/script.js?v=2"></script>

</head>
<body>

<%-- <%
	BoardDto boardDto=new BoardDto();
%> --%>

<form name="boardRewrite" method="post" action="boardRewrite.do">

<center>

<h3>글 상세보기</h3>

<hr>

<%-- <input type="hidden" name="boardNumber" value="${boardDto.boardNumber }"> --%>

글번호:<input type="text" name="boardNumber" value="${boardDto.boardNumber}" readonly><br>
제    목:<input type="text" name="boardTitle" value="${boardDto.boardTitle}"><br>
작성자:<input type="text" value="${boardDto.totalId}" readonly><br>
등록일:<input type="text" value="${boardDto.boardDate}" readonly><br>
조회수:<input type="text" value="${boardDto.boardReadCnt}" readonly><br>
내    용:<input type="text" name="boardContent" value="${boardDto.boardContent}"><br>
 
<hr>

<input type="button" value="수정완료" onclick="boardRewriteProc()">
<input type="button" value="목록으로" onclick="location.href='showBoard.do'">

</center>

</form>

</body>
</html>