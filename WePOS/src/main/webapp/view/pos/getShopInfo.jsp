<%@ page language="java" contenttype="text/html; charset=utf-8" pageencoding="utf-8"%>
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