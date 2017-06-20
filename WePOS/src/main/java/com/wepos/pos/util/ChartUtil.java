package com.wepos.pos.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.wepos.pos.dto.ChartStatsDto;

public class ChartUtil {
	
	@SuppressWarnings("unchecked")
	public static JSONObject barLineChartStat(List<ChartStatsDto> chartStatsList)
	{		
		JSONObject jsonChartData = new JSONObject();
		
		if(chartStatsList.size() == 0)
		{
			jsonChartData = null;
		}
		else
		{
			JSONArray labels = new JSONArray();
			JSONArray datasets = new JSONArray();
			JSONArray dataArray = new JSONArray();
			
			JSONObject jsonData = new JSONObject();
			jsonData.put("label", "총 매출");
			jsonData.put("fillColor", "rgba(64, 224, 208, 1)");
			jsonData.put("strokeColor", "rgba(64, 224, 208, 1)");
			jsonData.put("pointColor", "rgba(64, 224, 208, 1)");
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
		}
		
		return jsonChartData;
	}
	
	@SuppressWarnings("unchecked")
	public static JSONArray pieChartStat(List<ChartStatsDto> chartStatsList)
	{
		JSONArray jsonChartArray = new JSONArray();
		
		String[] colorArr = {"#40e0d0", "#ff6666", "#ffff66"};
		
		if(chartStatsList.size() == 0)
		{
			jsonChartArray = null;
		}
		else
		{
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
		/*chartTypeList.put("4", "회원, 비회원별 매출");*/
		
		return chartTypeList;
	}	
	
	public static int monthGap(String monthStart, String monthFinish) throws ParseException
	{
		int gap = 0;
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat monthSdf = new SimpleDateFormat("yyyy-MM");
		
		while(!monthStart.equals(monthFinish))
		{
			Date dateMonth = monthSdf.parse(monthStart);
			cal.setTime(dateMonth);
			cal.add(Calendar.MONTH, 1);
			dateMonth = cal.getTime();
			monthStart = monthSdf.format(dateMonth);
			gap++;		
		}
		
		return gap;
	}
	
}
