<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<!--<meta http-equiv="refresh" content='0; url=<c:url value="/pos/posMain.do?shopCode=${shopInfo.shopCode}"/>'> -->
</head>
<body onload="showPosMain()">
<script>
function showPosMain() {
    document.location.href="/WePOS/pos/posMain.do?shopCode=${shopCode}";
}
</script>
</body>
</html>
<%-- <jsp:forward page="/pos/posMain.do?shopCode=${shopCode}"/>
 --%>