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



</body>
</html>