package com.wepos.common.dao;

import com.wepos.common.dto.ReservationDto;

public interface ReservationDao {
	
	//해당 주문 내역 저장하기
	public void insertRes(ReservationDto reservationDto);
	

}
