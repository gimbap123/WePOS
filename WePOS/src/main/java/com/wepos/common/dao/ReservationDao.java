package com.wepos.common.dao;

import com.wepos.common.dto.ReservationDto;
import com.wepos.common.dto.ShopDto;

public interface ReservationDao {
	
	//해당 주문 내역 저장하기
	public void insertRes(ReservationDto reservationDto);
	
	//해당 아이디의 주문 내역 가져오기
	public ReservationDto selectReservation(ReservationDto reservationDto);
	
	//매장 이름 가지고 오기
	public ShopDto selectShopName(ReservationDto reservationDto);
	
	//예약 내역 수정하기
	public void updateRes(ReservationDto reservationDto);
	
	//예약 내역 삭제하기
	public void deleteRes(int reseNumber);
	
	//해당 매장 해당 아이디의 주문건수 가져오기
	public int countRes(ReservationDto reservationDto);

	
}
