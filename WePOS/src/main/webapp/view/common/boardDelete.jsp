<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*, com.wepos.common.*, com.wepos.common.dto.BoardDto" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>We POS</title>
</head>
<body>

	<form method="post" action="boardDelete.do">
		<input type="hidden" name="boardNumber" value="${boardNumber}">
		<input type="submit" value="삭제">
		<input type="button" value="취소" onclick="location.href='showBoard.do'">
	</form>

</body>
</html>