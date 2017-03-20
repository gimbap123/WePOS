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

<center>

<h3>글 상세보기</h3>

<hr>
글번호=>${boardDto.boardNumber}<br>
제　목=>${boardDto.boardTitle}<br>
작성자=>${boardDto.totalId}<br>
등록일=>${boardDto.boardDate}<br>
조회수=>${boardDto.boardReadCnt}<br>
내　용=>${boardDto.boardContent}<br>
 
<hr>

<input type="button" value="수정하기" onClick="location.href='boardRewrite.do?boardNumber=${boardDto.boardNumber}'">
<input type="button" value="삭제하기" onClick="location.href='boardDelete.do?boardNumber=${boardDto.boardNumber}'">
<input type="button" value="돌아가기" onClick="location.href='showBoard.do'">

</center>

</body>
</html>