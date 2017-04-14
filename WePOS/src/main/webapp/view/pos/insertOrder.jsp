<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%  
 //response.sendRedirect(request.getContextPath() + "/pos/posMain.do?mgrId=");
%>
<script>
</script>
${mgrId}<br>
${orders}<br>
${iod}<br>
${dod}<br>

${deleteOddList}<br>

    ModelAndView mav = new ModelAndView( "pos/insertOrder" );
    mav.addObject( "mgrId", mgrId );
    mav.addObject( "orders", orders );
    mav.addObject( "iod", insertOrdersDetail );
    mav.addObject( "dod", deleteOrdersDetail );

    mav.addObject( "deleteOddList", deleteOddList );
    return mav;