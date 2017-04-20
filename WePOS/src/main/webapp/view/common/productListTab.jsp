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
	<div class="row" style="margin-bottom: 10px;">
    	<div class="col-md-10">
        	<c:if test="${fn:length(productList) == 0}">
        		<h2>등록된 상품이 없습니다.</h2>
        	</c:if>
        	<c:if test="${fn:length(productList) != 0}">
        		<div class="row">
	        		<div class="col-md-3">	        			
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
                        	<img src="${product.productFile}" class="img-responsive hover-effect" alt="" style="width: 290px; height: 180px"/>
                    	</div>
                    	<div class="col-md-3">
                    		<h3>${product.productName}</h3>
                    		<ul class="list-inline">
	                           <li><i class="fa fa-krw"></i> <fmt:formatNumber value="${product.productPrice}" type="number" />원</li>	                          
	                       </ul>
	                       <p>${product.productDesc}</p>
	                      
	                       <ul class="list-inline star-vote" style="padding-left: 5px">
	                       		<c:forEach var="i" begin="1" end="5" step="1">
	                       			<c:if test="${product.avgGrade >= i}">
	                       				<li style="margin: 0px; padding: 0px;"><i class="color-green fa fa-star"></i></li>											                       			
	                       			</c:if>
	                       			<c:if test="${product.avgGrade < i}">
	                       				<li style="margin: 0px; padding: 0px;"><i class="color-green fa fa-star-o"></i></li>											                       			
	                       			</c:if>
	                       		</c:forEach>                                                          
                            </ul>
                           
	                       <div class="row" style="padding-left: 15px">
		                       <button class="btn-u" type="button" data-toggle="modal" data-target="#productGradeModal" onclick="productGradeModal(${product.productCode}, '${product.productName}')">평점 보기</button>
		                       <c:if test="${sessionScope.id != null && sessionScope.userType != 2}">
		                       		<button class="btn-u" type="button" onclick="$('#userGradeDiv' + ${product.productCode}).show()">평점 주기</button>
		                       </c:if>
	                       </div>
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
			                             	<input type="text" class="form-control" id="gradeComment${product.productCode}" name="gradeComment" placeholder="상품평을 입력하세요." value="${productGrade.gradeComment}">	
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
												<button class="btn-u" type="button" style="height: 34px" onclick="productGradeCancle(${product.productCode}, '${productGrade.gradeComment}', ${productGrade.grade})">								
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
		                             	<input type="text" class="form-control" id="gradeComment${product.productCode}" name="gradeComment" placeholder="상품평을 입력하세요.">	
		                              	<span class="input-group-btn">
											<button class="btn-u" type="button" style="height: 34px" onclick="productGrade(${product.productCode})">								
												<i class="fa fa-pencil"></i>
											</button>
										</span>	
										<span class="input-group-btn">
											<button class="btn-u" type="button" style="height: 34px" onclick="productGradeCancle(${product.productCode}, '', 0)">								
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
		<%-- <jsp:include page="productGradeModal.jsp" flush="false" />	 --%>
		<div class="modal fade" id="productGradeModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">			
		</div>
	</div><!--/row-->
	${pagingHtml}     
</div><!--/container-->		
<!--=== End Content Part ===-->