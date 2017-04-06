package com.wepos.pos.dao;

import java.sql.Date;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.wepos.pos.dto.PosLogDto;

public class PosLogDaoImpl extends SqlSessionDaoSupport implements PosLogDao {

	public List<PosLogDto> mainLog() {
		return getSqlSession().selectList( "mainLog" );
	}
	
	public List<PosLogDto> searchLog(PosLogDto posLogDto) {
		return getSqlSession().selectList( "searchLog" , posLogDto);
	}
	
	public String productName(int productCode){
		return getSqlSession().selectOne("productName",productCode);
	}

}
