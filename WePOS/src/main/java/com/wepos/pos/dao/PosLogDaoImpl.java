package com.wepos.pos.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.wepos.pos.dto.PosLogDto;

public class PosLogDaoImpl extends SqlSessionDaoSupport implements PosLogDao {

	public List<PosLogDto> todayLog() {
		return getSqlSession().selectList( "log" );
	}

}
