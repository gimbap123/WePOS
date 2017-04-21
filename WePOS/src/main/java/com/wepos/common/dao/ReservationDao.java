package com.wepos.common.dao;

import java.util.List;

import com.wepos.common.dto.ReservationDto;
import com.wepos.common.dto.ShopDto;
import com.wepos.mgr.dto.MgrDto;

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

	//관리자 예약 못하게 하기 위해서 관리자 계정 불러오기
	public List<MgrDto> selectMgrId();

	//접속한 계정이 users인지 mgr인지 구분
	public int selectCheckId(ReservationDto reservationDto);
	
	//예약한 곳이 1군데인지 체크(예약 두군데 이상 방지)
	public int selectResCount(ReservationDto reservationDto);
	
}
