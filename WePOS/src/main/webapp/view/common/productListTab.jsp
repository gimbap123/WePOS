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
        		<c:forEach items="${productList}" var="product">
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
	                       <c:if test="${sessionScope.id != null && sessionScope.userType != 2}">
	                       	<button class="btn-u" type="button" onclick="productGradeView(${product.productCode}, true)">평점 주기</button>
	                       	</c:if>
                    	</div>
                    	<div class="col-md-5" id="userGradeDiv${product.productCode}" style="display: none;">
                    		
                    		<c:set var="flag" value="0" />
                    		<c:forEach items="${productGradeList}" var="productGrade">
                    			<c:if test="${product.productCode ==  productGrade.productCode}">
                    				<c:set var="flag" value="1" />
                    				<form action="#" class="sky-form" style="border: none;" id="gradeUpdateForm${product.productCode}">
		                    			<input type="hidden" name="productCode" value="${product.productCode}">           
		                    			<input type="hidden" name="userId" value="${sessionScope.id}">
		                    			<input type="hidden" name="currentPage" value="${currentPage}">
		                    			<input type="hidden" name="categoryCode" value="${categoryCode}">
		                    			<input type="hidden" name="shopCode" value="${shopCode}">
			                    		<div class="rating" id="ratingDiv">
			                    			<c:forEach var="i" begin="1" end="5" step="1">
			                    				<c:if test="${productGrade.grade == 6 - i}">
			                    					<input type="radio" name="grade" id="quality-${6 - i}-${product.productCode}" value="${6 - i}" checked="checked">
			                    				</c:if>
			                    				<c:if test="${productGrade.grade != 6 - i}">
			                    					<input type="radio" name="grade" id="quality-${6 - i}-${product.productCode}" value="${6 - i}">
			                    				</c:if>
			                    				<label for="quality-${6 - i}-${product.productCode}"><i class="fa fa-star"></i></label>
			                    			</c:forEach>		                               
			                               	평점 입력 (1 ~ 5점) :              
			                            </div>                             
			                             <hr style="margin: 15px">
			                             <div class="input-group">
			                             	<input type="text" class="form-control" id="gradeComment" name="gradeComment" placeholder="상품평을 입력하세요." value="${productGrade.gradeComment}">	
			                              	<span class="input-group-btn">
												<button class="btn-u" type="button" style="height: 34px" onclick="productGradeUpdate(${product.productCode})">								
													<i class="fa fa-pencil"></i>
												</button>
											</span>	
											<span class="input-group-btn">
												<button class="btn-u" type="button" style="height: 34px" onclick="productGradeDelete(${product.productCode})">								
													<i class="fa fa-trash"></i>
												</button>
											</span>	
											<span class="input-group-btn">
												<button class="btn-u" type="button" style="height: 34px" onclick="productGradeView(${product.productCode}, false)">								
													<i class="fa fa- fa-reply"></i>
												</button>
											</span>	
			                              </div>  
		                              </form>   
                    			</c:if>        		
                    		</c:forEach>      
                    		<c:if test="${flag == 0}">
                    			<form action="#" class="sky-form" style="border: none;" id="gradeForm${product.productCode}">
	                    			<input type="hidden" name="productCode" value="${product.productCode}">           
	                    			<input type="hidden" name="userId" value="${sessionScope.id}">
	                    			<input type="hidden" name="currentPage" value="${currentPage}">
	                    			<input type="hidden" name="categoryCode" value="${categoryCode}">
	                    			<input type="hidden" name="shopCode" value="${shopCode}">
		                    		<div class="rating" id="ratingDiv">
		                    			<c:forEach var="i" begin="1" end="5" step="1">
		                    				<input type="radio" name="grade" id="quality-${6 - i}-${product.productCode}" value="${6 - i}">
		                    				<label for="quality-${6 - i}-${product.productCode}"><i class="fa fa-star"></i></label>
		                    			</c:forEach>                                
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
                    		</c:if>
                    	                    	   
                    		                                                                           	
                    	</div>
                    	
                    	
        			</div>
        		</c:forEach>
        	</c:if>           
           
		</div><!--/col-md-9-->        	
	</div><!--/row-->
	${pagingHtml}     
</div><!--/container-->		
<!--=== End Content Part ===-->