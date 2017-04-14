package com.wepos.common.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.wepos.common.dto.ReservationDto;

public class ReservationDaoImpl extends SqlSessionDaoSupport implements ReservationDao {

	public void insertRes(ReservationDto reservationDto) {
		getSqlSession().insert("insertRes", reservationDto);
	}
	
}
