package com.wepos.pos.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.wepos.common.dto.ReservationDto;

public class PosReservationDaoImpl extends SqlSessionDaoSupport implements PosReservationDao {
	
	public List<ReservationDto> selectResList(int shopCode) {
		return getSqlSession().selectList("selectResList", shopCode);
	}
	
	public int countPosRes(int shopCode) {
		return getSqlSession().selectOne("countPosRes", shopCode);
	}

	public void updateState(ReservationDto reservationDto) {
		getSqlSession().update("updateState", reservationDto);
	}
	
	public int selectStateZero(int shopCode) {
		return getSqlSession().selectOne("selectStateZero", shopCode);
	}
	
}
