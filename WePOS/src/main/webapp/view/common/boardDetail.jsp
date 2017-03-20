<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*, com.wepos.common.*, com.wepos.common.dto.*" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	BoardDto boardDto=new BoardDto();
%>

<form name="boardRewrite" action="boardRewrite.do">

<center>

<h3>글 상세보기</h3>

<hr>

제    목:<input type="text" name="boardTitle" value="${boardDto.boardTitle}"><br>
작성자:<input type="text" value="${boardDto.totalId}"><br>
등록일:<input type="text" value="${boardDto.boardDate}"><br>
조회수:<input type="text" value="${boardDto.boardReadCnt}"><br>
내    용:<input type="text" name="boardContent" value="${boardDto.boardContent}"><br>

<hr>

<input type="button" value="수정완료" onClick="boardRewrite()">
<input type="button" value="삭제하기" onClick="">
<input type="button" value="돌아가기" onClick="location.href='showBoard.do'">

</center>

</form>

</body>
</html>