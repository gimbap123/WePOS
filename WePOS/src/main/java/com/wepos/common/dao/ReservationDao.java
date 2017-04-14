package com.wepos.common.dao;

import com.wepos.common.dto.ReservationDto;

public interface ReservationDao {
	
	//해당 주문 내역 불러오기
	public ReservationDto selectRes(ReservationDto reservationDto);
	

}
