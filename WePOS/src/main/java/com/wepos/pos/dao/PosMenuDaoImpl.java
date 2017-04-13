package com.wepos.pos.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.wepos.common.dto.TablesDto;

public class PosMenuDaoImpl extends SqlSessionDaoSupport implements PosMenuDao{
	
	public int createMenu(TablesDto tablesDto){
		return getSqlSession().insert("createMenu",tablesDto);
	}
	
	public int updateMenu(TablesDto tablesDto){
		return getSqlSession().update( "updateMenu", tablesDto );
	}
	
	public int deleteMenu(int tableCode){
		return getSqlSession().delete("deleteMenu",tableCode);
	}
}
