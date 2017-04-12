<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%  
  response.sendRedirect(request.getContextPath() + "/pos/posMain.do?mgrId="+session.getId());
%>