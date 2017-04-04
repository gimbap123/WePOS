package com.wepos.pos.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.wepos.common.dto.ShopDto;
import com.wepos.pos.dao.PosLogDao;
import com.wepos.pos.dao.PosMainDao;
import com.wepos.pos.dto.PosLogDto;

@Controller
public class PosLogController {

	@Autowired
	private PosMainDao posMainDao;
	@Autowired
	private PosLogDao posLogDao;

	// 매출 통계 페이지
	@RequestMapping("/pos/salesLog.do")
	public ModelAndView showSalesLog(@RequestParam(value = "mgrId") String mgrId) {
		int shopCode = posMainDao.getShopCode(mgrId);
		ShopDto shop = posMainDao.getShop(shopCode);
		List<PosLogDto> log=posLogDao.todayLog();
		System.out.println("log="+log);
		ModelAndView mav = new ModelAndView("pos/salesLog");
		mav.addObject("shop", shop);
		mav.addObject("log",log);
		return mav;
	}
}
