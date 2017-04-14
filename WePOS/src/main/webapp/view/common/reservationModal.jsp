<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script language="JavaScript" src="../js/common/reservation.js?ver=2"></script>
					<!-- MODAL -->
	                <form id="resForm" name="resForm" action="reservation.do?userId=${sessionScope.id}" method="post">
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
                                            <div class="col-md-3">
                                                <p><input class="form-control" style="font-weight: bolder;text-align: center; background-color: #72c02c; opacity: .75" value="예약인원" readonly/></p>
                                                <p><input class="form-control" style="font-weight: bolder;text-align: center; background-color: #72c02c; opacity: .75" value="예약날짜" readonly/></p>
                                                <p><input class="form-control" style="font-weight: bolder;text-align: center; background-color: #72c02c; opacity: .75" value="예약시간" readonly/></p>
                                                <p><input class="form-control" style="font-weight: bolder;text-align: center; background-color: #72c02c; opacity: .75" value="예약설명" readonly/></p>
                                            </div>
                                            <div class="col-md-9">
                                                <p><select class="form-control" id="resPersons" name="resPersons" >
														<option value="0">예약 인원을 설정할 수 있습니다</option>
                                                	<c:forEach var="i" begin="1" end="30" step="1">
														<option value="${i}}">${i}명</option>
													</c:forEach>
												</select></p>
                                                <p><input class="form-control" type="text" name="date" id="date" placeholder="예약 날짜를 설정할 수 있습니다" /></p>
	                                            <p>
	                                            <select class="form-control" id="startHourType" name="startHourType">
													<option value="am">AM</option>
													<option value="pm">PM</option>
												</select>
	                                            <select class="form-control" id="resTime" name="resTime">
													<option value="0">예약 시간을 설정할 수 있습니다</option>
													<option value="1">06시-08시</option>
													<option value="2">08시-10시</option>
													<option value="3">10시-12시</option>
													<option value="4">12시-14시</option>
													<option value="5">14시-16시</option>
													<option value="6">16시-18시</option>
													<option value="7">18시-20시</option>
													<option value="8">20시-22시</option>
													<option value="9">22시-24시</option>
													<option value="10">24시-02시</option>
													<option value="11">02시-04시</option>
													<option value="12">04시-06시</option>
												</select></p>
                                                <p><input class="form-control" type="text" id="resMemo" placeholder="주문 관련하여 내용을 적어주세요" /></p>
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