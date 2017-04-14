package com.wepos.common.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.wepos.common.dto.ReservationDto;

public class ReservationDaoImpl extends SqlSessionDaoSupport implements ReservationDao {

	public ReservationDto selectRes(ReservationDto reservationDto) {
		return getSqlSession().selectOne("selectRes", reservationDto);
	}
	
}
