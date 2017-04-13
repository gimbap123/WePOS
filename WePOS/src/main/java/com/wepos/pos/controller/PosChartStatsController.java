package com.wepos.pos.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("pos/posChartStats");
			
		return mav;
	}
}
