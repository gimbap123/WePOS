package com.wepos.pos.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.wepos.common.dto.ReservationDto;
import com.wepos.pos.dto.PosLogDto;

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

	public List<ReservationDto> selectStateList(Map<String, Object> map) {
		return getSqlSession().selectList("selectStateList", map);
	}
	
	public int selectCountState(Map<String, Object> map) {
		return getSqlSession().selectOne("selectCountState", map);
	}
}
