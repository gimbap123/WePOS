package com.wepos.pos.util;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.wepos.pos.dto.ChartStatsDto;

public class ChartUtil {
	
	@SuppressWarnings("unchecked")
	public JSONObject barChartData(List<ChartStatsDto> chartStatsList)
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
			labels.add(chartStats.getMon() + "월");		
				
			dataArray.add(chartStats.getTotalPrice());		
			
		}
		
		jsonData.put("data", dataArray);
		datasets.add(jsonData);	
		
		jsonChartData.put("labels", labels);
		jsonChartData.put("datasets", datasets);
		
		return jsonChartData;
	}

}
