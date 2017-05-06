package com.wepos.common.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.wepos.common.dto.BusinessHoursDto;
import com.wepos.common.dto.ReservationDto;
import com.wepos.common.dto.ShopDto;
import com.wepos.mgr.dto.MgrDto;

public class ReservationDaoImpl extends SqlSessionDaoSupport implements ReservationDao {

	public void insertRes(ReservationDto reservationDto) {
		getSqlSession().insert("insertRes", reservationDto);
	}
	
	public ReservationDto selectReservation(ReservationDto reservationDto) {
		return getSqlSession().selectOne("selectReservation", reservationDto);
	}
	
	public ShopDto selectShopName(ReservationDto reservationDto) {
		return getSqlSession().selectOne("selectShopName", reservationDto);
	}
	
	public void updateRes(ReservationDto reservationDto) {
		getSqlSession().update("updateRes", reservationDto);
	}
	
	public void deleteRes(int reseNumber) {
		getSqlSession().delete("deleteRes", reseNumber);
	}
	
	public int countRes(ReservationDto reservationDto) {
		return getSqlSession().selectOne("countRes", reservationDto);
	}
	
	public List<MgrDto> selectMgrId() {
		return getSqlSession().selectList("selectMgrId");
	}
	
	public int selectCheckId(ReservationDto reservationDto) {
		return getSqlSession().selectOne("selectCheckId", reservationDto);
	}

	public int selectResCount(ReservationDto reservationDto) {
		return getSqlSession().selectOne("selectResCount", reservationDto);
	}
	
	public int selectPastResCount(ReservationDto reservationDto) {
		return getSqlSession().selectOne("selectPastResCount", reservationDto);
	}
	
	public List<ReservationDto> selectReservationAll(ReservationDto reservationDto) {
		return getSqlSession().selectList("selectReservationAll", reservationDto);
	}
	
	public List<ReservationDto> selectReservationOne(ReservationDto reservationDto) {
		return getSqlSession().selectList("selectReservationOne", reservationDto);
	}
	
	public List<ReservationDto> selectReservationTwo(ReservationDto reservationDto) {
		return getSqlSession().selectList("selectReservationTwo", reservationDto);
	}
	
	public List<ShopDto> selectResAllShopName(ReservationDto reservationDto) {
		return getSqlSession().selectList("selectResAllShopName", reservationDto);
	}
	
}
