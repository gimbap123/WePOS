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

<form name="boardWrite" action="boardWrite">

<table>
	<tr>
		<th>글번호</th>
		<th>글제목</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>

<c:forEach var="data" items="${list}" >

	<tr>
		<th>${data.boardNumber }</th>
		<th>${data.boardTitle }</th>
		<th>${data.totalId }</th>
		<th>${data.date }</th>
		<th>${data.readCnt}</th>
	</tr>
	
	</c:forEach>
	
</table>

<input type="submit" value="글쓰기">

</form>

</center>



</body>
</html>