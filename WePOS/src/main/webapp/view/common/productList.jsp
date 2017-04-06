<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link rel="stylesheet" href="../assets/css/pages/page_clients.css">

<!--=== Content Part ===-->
<div class="container content" style="padding-bottom: 20px">		
	<div class="row">
    	<div class="col-md-8">
        	<c:if test="${fn:length(productList) == 0}">
        		<h2>등록된 상품이 없습니다.</h2>
        	</c:if>		
        	<c:if test="${productList != null}">
        		<c:forEach items="${productList }" var="product">
        			<div class="row clients-page" style="margin-bottom: 20px">
        				<div class="col-md-4">
                        	<img src="${product.productFile}" class="img-responsive hover-effect" alt="" style="width: 200px; height: 120px"/>
                    	</div>
                    	<div class="col-md-8">
                    		<h3>${product.productName}</h3>
                    		<ul class="list-inline">
	                           <li><i class="fa fa-krw"></i> ${product.productPrice}</li>	                          
	                       </ul>
	                       <p>${product.productDesc}</p>
                    	</div>
        			</div>
        		</c:forEach>
        	</c:if>           
           
		</div><!--/col-md-9-->        	
	</div><!--/row-->
	${pagingHtml}     
</div><!--/container-->		
<!--=== End Content Part ===-->