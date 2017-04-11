package com.wepos.pos.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.wepos.common.dto.TablesDto;

public class PosTableDaoImpl extends SqlSessionDaoSupport implements PosTableDao{
	public int updateTable(TablesDto tablesDto){
		return getSqlSession().update( "updateTable", tablesDto );
	}
}
