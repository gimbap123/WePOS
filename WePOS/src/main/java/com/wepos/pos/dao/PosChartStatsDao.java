package com.wepos.pos.dao;

import java.util.List;
import java.util.Map;

import com.wepos.pos.dto.ChartStatsDto;

public interface PosChartStatsDao {

	// 월별 통계
	public List<ChartStatsDto> monthStats(Map<String, Object> map);
	
	// 상품별 통계
	public List<ChartStatsDto> productStats(Map<String, Object> map);
	
}
