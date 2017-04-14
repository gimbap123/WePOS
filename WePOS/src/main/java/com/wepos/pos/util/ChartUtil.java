package com.wepos.pos.util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.wepos.pos.dto.ChartStatsDto;

public class ChartUtil {
	
	@SuppressWarnings("unchecked")
	public static JSONObject barChartStat(List<ChartStatsDto> chartStatsList)
	{
		JSONObject jsonChartData = new JSONObject();
		JSONArray labels = new JSONArray();
		JSONArray datasets = new JSONArray();
		JSONArray dataArray = new JSONArray();
		
		JSONObject jsonData = new JSONObject();
		jsonData.put("label", "총 매출");
		jsonData.put("fillColor", "rgba(210, 214, 222, 1)");
		jsonData.put("strokeColor", "rgba(210, 214, 222, 1)");
		jsonData.put("pointColor", "rgba(210, 214, 222, 1)");
		jsonData.put("pointStrokeColor", "#c1c7d1");
		jsonData.put("pointHighlightFill", "#fff");
		jsonData.put("pointHighlightStroke", "rgba(220,220,220,1)");
		
		for(ChartStatsDto chartStats : chartStatsList)
		{
			labels.add(chartStats.getLabel());
				
			dataArray.add(chartStats.getTotalPrice());		
			
		}
		
		jsonData.put("data", dataArray);
		datasets.add(jsonData);	
		
		jsonChartData.put("labels", labels);
		jsonChartData.put("datasets", datasets);
		
		return jsonChartData;
	}
	
	public static Map<String, Object> chartTypeList()
	{
		Map<String, Object> chartTypeList = new HashMap<String, Object>();
		chartTypeList.put("0", "선택");
		chartTypeList.put("1", "월별 매출");
		chartTypeList.put("2", "상품별 매출");
		
		return chartTypeList;
	}

}
