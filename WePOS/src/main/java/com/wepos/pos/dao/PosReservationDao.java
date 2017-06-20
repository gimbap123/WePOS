package com.wepos.pos.dao;

import java.util.List;
import java.util.Map;

import com.wepos.common.dto.ReservationDto;

public interface PosReservationDao {

	//관리 페이지 예약 정보 불러오기
	public List<ReservationDto> selectResList(int shopCode);
	
	//관리 페이지 예약 정보 숫자
	public int countPosRes(int shopCode);
	
	//예약 상태 업데이트
	public void updateState(ReservationDto reservationDto);

	//해당하는 매장의 예약자를 불러오는데 예약상태가 대기인 숫자를 가지고 오자
	public int selectStateZero(int shopCode);
	
	//예약상태에 따른 예약자 리스트 불러오기
	public List<ReservationDto> selectStateList(Map<String, Object> map);
	
	//예약상태에 따른 건수 불러오기
	public int selectCountState(Map<String, Object> map);
	
}
