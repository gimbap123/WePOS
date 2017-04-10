package com.wepos.pos.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.wepos.pos.dto.PosLogDto;

public class PosLogDaoImpl extends SqlSessionDaoSupport implements PosLogDao {

	public List<PosLogDto> mainLog() {
		return getSqlSession().selectList( "mainLog" );
	}
	
	public List<PosLogDto> searchTotalLog(PosLogDto posLogDto) {
		return getSqlSession().selectList( "searchTotalLog" , posLogDto);
	}
	
	public List<PosLogDto> searchDayLog(PosLogDto posLogDto) {
		return getSqlSession().selectList( "searchDayLog" , posLogDto);
	}
	
	public List<PosLogDto> searchMonthLog(PosLogDto posLogDto) {
		return getSqlSession().selectList( "searchMonthLog" , posLogDto);
	}
	
	public String productName(int productCode){
		return getSqlSession().selectOne("productName",productCode);
	}

}
