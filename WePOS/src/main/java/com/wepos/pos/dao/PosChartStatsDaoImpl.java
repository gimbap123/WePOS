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
	
	public List<ChartStatsDto> productStats(Map<String, Object> map) {
		List<ChartStatsDto> chartStatsList = getSqlSession().selectList("productStats", map);
		return chartStatsList;
	}
	
	public List<ChartStatsDto> paymentPlanStats(Map<String, Object> map) {
		List<ChartStatsDto> chartStatsList = getSqlSession().selectList("paymentPlanStats", map);
		return chartStatsList;
	}
	
	public List<ChartStatsDto> userTypeStats(Map<String, Object> map) {
		List<ChartStatsDto> chartStatsList = getSqlSession().selectList("userTypeStats", map);
		return chartStatsList;
	}

}
