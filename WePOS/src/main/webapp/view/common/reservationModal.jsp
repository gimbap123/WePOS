<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page	import="java.util.*, com.wepos.common.*, com.wepos.common.dto.ShopDto"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script language="JavaScript" src="../js/common/reservation.js?ver=3"></script>
					<!-- MODAL -->
	                <form id="resForm" name="resForm" action="reservation.do" method="post">
	                <input type="hidden" id="userId" name="userId" value="${sessionScope.id }">
	                <input type="hidden" id="shopCode" name="shopCode" value="${shop.shopCode}">
	                <div class="margin-bottom-40">
                        <div class="modal fade" id="responsive" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        <h4 class="modal-title" id="myModalLabel4" style="font-weight: bold;">MAKE A RESERVATION!</h4>
                                    </div>
                                    <div class="modal-body">
                                    <div class="headline" style="margin: 0 0 20px 0; padding-bottom: -10px; display: inline-block; border-bottom: 2px solid #72c02c;">
                                    <h5><i class="icon-rocket"></i> ${sessionScope.id }님이 원하시는 예약을 진행할 수 있습니다.</h5></div>
                                        <div class="row">
                                        <!-- ★이곳에 name값이랑 DB의 필드명이랑 동일해야함★ -->
                                            <div class="col-md-3">
                                                <p><input class="form-control" style="font-weight: bolder;text-align: center; background-color: #72c02c; opacity: .75" value="예약인원" readonly/></p>
                                                <p><input class="form-control" style="font-weight: bolder;text-align: center; background-color: #72c02c; opacity: .75" value="예약날짜" readonly/></p>
                                                <p><input class="form-control" style="font-weight: bolder;text-align: center; background-color: #72c02c; opacity: .75" value="예약시간" readonly/></p>
                                                <p><input class="form-control" style="font-weight: bolder;text-align: center; background-color: #72c02c; opacity: .75" value="예약설명" readonly/></p>
                                            </div>
                                            <div class="col-md-9">
                                                <p>
	                                                <select class="form-control" id="resPersons" name="resPersons" >
														<option value="0">예약 인원을 설정할 수 있습니다</option>
	                                                	<c:forEach var="i" begin="1" end="30" step="1">
															<option value="${i}">${i}명</option>
														</c:forEach>
													</select>
												</p>
                                                <p><input class="form-control" type="text" name="resDate" id="start" placeholder="예약 날짜를 설정할 수 있습니다" /></p>
                                                <div class="col-md-4">
                                                	<select class="form-control" id="startHourType" name="startHourType">
                                                		<option value="0"><i class="icon-rocket">타입</i></option>
														<option value="am">AM</option>
														<option value="pm">PM</option>
													</select>
                                                </div>
                                                <div class="col-md-4">
	                                            <p>
	                                            	<select class="form-control" id="startHour" name="startHour">								
		                                            	<option value="0">시</option>
														<c:forEach var="i" begin="1" end="12" step="1">
															<c:if test="${i < 10}">
																<c:set var="i" value="0${i}" />
															</c:if>
															<option value="${i}">${i}시</option>							
														</c:forEach>		
													</select>
	                                            </p>
												</div>
												<div class="col-md-4">
	                                            <p>
	                                            	<select class="form-control" id="startMinute" name="startMinute">
		                                            	<option value="0">분</option>
														<c:forEach var="i" begin="0" end="59" step="1">
															<c:if test="${i < 10}">
																<c:set var="i" value="0${i}" />
															</c:if>
															<option value="${i}">${i}분</option>							
														</c:forEach>					
													</select>
	                                            </p>
												</div>												
                                                <p><input class="form-control" type="text" name="resDesc" id="resDesc" placeholder="주문 관련하여 내용을 적어주세요" /></p>
                                            </div>
                                        </div>
                                    </div>	
                                    <div class="modal-footer">
                                        <button type="button" class="btn-u btn-u-default" data-dismiss="modal">취소하기</button>
                                        <button type="button" class="btn-u btn-u-primary" onclick="checkRes()">예약하기</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    </form>
                    </body>
	                <!-- MODAL -->  