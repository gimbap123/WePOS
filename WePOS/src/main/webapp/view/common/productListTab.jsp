<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="../assets/plugins/sky-forms-pro/skyforms/css/sky-forms.css">
<link rel="stylesheet" href="../assets/plugins/sky-forms-pro/skyforms/custom/custom-sky-forms.css">
<link rel="stylesheet" href="../assets/css/pages/page_clients.css">

<script type="text/javascript" src="../assets/js/forms/review.js"></script>

<!--=== Content Part ===-->
<div class="container content" style="padding-bottom: 20px; padding-top: 20px;">		
	<div class="row">
    	<div class="col-md-8">
        	<c:if test="${fn:length(productList) == 0}">
        		<h2>등록된 상품이 없습니다.</h2>
        	</c:if>		
        	<c:if test="${productList != null}">
        		<div class="row">
	        		<div class="col-md-4">	        			
	        			<div class="input-group">
	        				<select class="form-control" name="categoryCode" id="categoryCode">
	        					<option value="0">전체</option>
	        					<c:forEach items="${categoryList}" var="category">
	        						<c:if test="${categoryCode == category.categoryCode}">
	        							<option value="${category.categoryCode}" selected="selected">${category.categoryName}</option>
	        						</c:if>
	        						<c:if test="${categoryCode != category.categoryCode}">
	        							<option value="${category.categoryCode}">${category.categoryName}</option>
	        						</c:if>	        						
	        					</c:forEach>
	        				</select>
	        				<span class="input-group-btn">
								<button class="btn-u" type="button" style="height: 34px" onclick="productListPaging()">								
									<i class="fa fa-search"></i>
								</button>
							</span>		
	        			</div>	        			     
	        		</div>
        		</div>
        		<c:forEach items="${productList }" var="product">
        			<div class="row clients-page" style="margin-bottom: 20px">
        				<div class="col-md-4">
                        	<img src="${product.productFile}" class="img-responsive hover-effect" alt="" style="width: 200px; height: 120px"/>
                    	</div>
                    	<div class="col-md-3">
                    		<h3>${product.productName}</h3>
                    		<ul class="list-inline">
	                           <li><i class="fa fa-krw"></i> <fmt:formatNumber value="${product.productPrice}" type="number" />원</li>	                          
	                       </ul>
	                       <p>${product.productDesc}</p>
	                       <c:if test="${sessionScope.id != null}">
	                       	<button class="btn-u" type="button" onclick="productGradeView(${product.productCode}, true)">평점 주기</button>
	                       	</c:if>
                    	</div>
                    	<div class="col-md-5" id="userGradeDiv${product.productCode}" style="display: none;">
                    	                    	   
                    		<form action="../user/productGrade.do" class="sky-form" style="border: none;">
                    			<input type="hidden" name="productCode" value="${product.productCode}">           
                    			<input type="hidden" name="userId" value="${sessionScope.id}">
                    			<input type="hidden" name="currentPage" value="${currentPage}">
                    			<input type="hidden" name="categoryCode" value="${categoryCode}">
                    			<input type="hidden" name="shopCode" value="${shopCode}">
	                    		<div class="rating" id="ratingDiv">
	                                <input type="radio" name="grade" id="quality-5-${product.productCode}" value="5">
	                                <label for="quality-5-${product.productCode}"><i class="fa fa-star"></i></label>
	                                <input type="radio" name="grade" id="quality-4-${product.productCode}" value="4">
	                                <label for="quality-4-${product.productCode}"><i class="fa fa-star"></i></label>
	                                <input type="radio" name="grade" id="quality-3-${product.productCode}" value="3">
	                                <label for="quality-3-${product.productCode}"><i class="fa fa-star"></i></label>
	                                <input type="radio" name="grade" id="quality-2-${product.productCode}" value="2">
	                                <label for="quality-2-${product.productCode}"><i class="fa fa-star"></i></label>
	                                <input type="radio" name="grade" id="quality-1-${product.productCode}" value="1">
	                                <label for="quality-1-${product.productCode}"><i class="fa fa-star"></i></label>
	                               	평점 입력 (1 ~ 5점) :              
	                            </div>                             
	                             <hr style="margin: 15px">
	                             <div class="input-group">
	                             	<input type="text" class="form-control" id="gradeComment" name="gradeComment" placeholder="상품평을 입력하세요.">	
	                              	<span class="input-group-btn">
										<button class="btn-u" type="button" style="height: 34px" onclick="productGrade(${product.productCode})">								
											<i class="fa fa-pencil"></i>
										</button>
									</span>	
									<span class="input-group-btn">
										<button class="btn-u" type="button" style="height: 34px" onclick="productGradeView(${product.productCode}, false)">								
											<i class="fa fa- fa-reply"></i>
										</button>
									</span>	
	                              </div>  
                              </form>                                                                              	
                    	</div>
                    	
                    	
        			</div>
        		</c:forEach>
        	</c:if>           
           
		</div><!--/col-md-9-->        	
	</div><!--/row-->
	${pagingHtml}     
</div><!--/container-->		
<!--=== End Content Part ===-->