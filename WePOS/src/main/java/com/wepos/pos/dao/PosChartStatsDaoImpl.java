package com.wepos.pos.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.wepos.pos.dto.ChartStatsDto;

public class PosChartStatsDaoImpl extends SqlSessionDaoSupport implements PosChartStatsDao {
	
	public List<ChartStatsDto> monthStats(Map<String, Object> map) {
		List<ChartStatsDto> chartStatsList = getSqlSession().selectList("monthStats", map);
		return chartStatsList;
	}

}
