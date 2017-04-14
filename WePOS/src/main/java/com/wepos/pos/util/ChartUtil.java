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
	
	@SuppressWarnings("unchecked")
	public static JSONArray pieChartStat(List<ChartStatsDto> chartStatsList)
	{
		JSONArray jsonChartArray = new JSONArray();
		
		String[] colorArr = {"#f56954", "#00a65a", "#00a65a"};

		int cnt = 0;
		for(ChartStatsDto chartStats : chartStatsList)
		{
			JSONObject jsonChartData = new JSONObject();
			jsonChartData.put("value", chartStats.getTotalPrice());
			jsonChartData.put("color", colorArr[cnt]);
			jsonChartData.put("highlight", colorArr[cnt]);
			jsonChartData.put("label", chartStats.getLabel());		
			cnt++;
			
			jsonChartArray.add(jsonChartData);
		}		
		
		return jsonChartArray;
	}
	
	public static Map<String, Object> chartTypeList()
	{
		Map<String, Object> chartTypeList = new HashMap<String, Object>();
		chartTypeList.put("0", "선택");
		chartTypeList.put("1", "월별 매출");
		chartTypeList.put("2", "상품별 매출");
		chartTypeList.put("3", "결제방식별 매출");
		chartTypeList.put("4", "회원, 비회원별 매출");
		
		return chartTypeList;
	}

}
