package com.wepos.pos.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.wepos.common.dto.ProductDto;
import com.wepos.pos.dto.PosLogDto;

public class PosLogDaoImpl extends SqlSessionDaoSupport implements PosLogDao {

	public List<PosLogDto> mainLog(PosLogDto posLogDto) {
		return getSqlSession().selectList( "mainLog",posLogDto );
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
	
	public String categoryName(PosLogDto posLogDto){
		return getSqlSession().selectOne("categoryName",posLogDto);
	}
	
	public List<PosLogDto> categoryDayLog(PosLogDto posLogDto) {
		return getSqlSession().selectList( "categoryDayLog" , posLogDto);
	}
	
	public List<PosLogDto> categoryMonthLog(PosLogDto posLogDto) {
		return getSqlSession().selectList( "categoryMonthLog" , posLogDto);
	}

}
