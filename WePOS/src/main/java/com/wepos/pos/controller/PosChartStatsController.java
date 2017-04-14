package com.wepos.pos.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.wepos.pos.dao.PosChartStatsDao;
import com.wepos.pos.dto.ChartStatsDto;

@Controller
public class PosChartStatsController {
	
	@Autowired
	private PosChartStatsDao posChartStatsDao;
	
	// 차트 통계
	@RequestMapping(value = "/pos/posChartStats.do", method = RequestMethod.GET)
	public ModelAndView posChartStatsView(@RequestParam("shopCode") int shopCode)
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("pos/posChartStats");		
		
		return mav;
	}
	
	// 차트 통계 기능 수행
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/pos/posChartStats.do", method = RequestMethod.POST)
	public ModelAndView posChartStatsProcess(@RequestParam("shopCode") int shopCode, 
			@RequestParam("chartType") int chartType, @RequestParam("start") String start, 
			@RequestParam("finish") String finish)
	{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("chartType", chartType);
		map.put("start", start);
		map.put("finish", finish);
		map.put("shopCode", shopCode);
		
		List<ChartStatsDto> chartStatsList = null;
		if(chartType == 1)
		{
			chartStatsList = posChartStatsDao.monthStats(map);
		}	
		
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
		
		String chartTitle = "월별 매출 (" + start + " ~ " + finish + ")";
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("pos/posChartStats");
		mav.addObject("jsonChartData", jsonChartData);
		mav.addObject("chartTitle", chartTitle);
			
		return mav;
	}
}
