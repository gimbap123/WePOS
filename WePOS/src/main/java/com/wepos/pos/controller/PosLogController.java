package com.wepos.pos.controller;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.wepos.common.dto.ProductDto;
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

	// 매출 통계 메인 페이지
	@RequestMapping("/pos/salesLog.do")
	public ModelAndView showSalesLog(@RequestParam(value = "mgrId") String mgrId) {
		int shopCode = posMainDao.getShopCode(mgrId);
		ShopDto shop = posMainDao.getShop(shopCode);
		List<ProductDto> product=posMainDao.getProductList(shopCode);
		List<PosLogDto> mainLog=posLogDao.mainLog();
		ModelAndView mav = new ModelAndView("pos/salesLog");
		mav.addObject("shop", shop);
		mav.addObject("resultLog",mainLog);
		mav.addObject("product",product);
		return mav;
	}
	
	// 검색 후 통계 페이지
	@RequestMapping(value="/pos/searchLog.do", method=RequestMethod.POST)
	public ModelAndView searchLog(@ModelAttribute PosLogDto posLogDto,
	//public ModelAndView searchLog(@RequestParam(value="calendarBegin") Date calendarBegin,
														//@RequestParam(value="calendarEnd") Date calendarEnd,
														@RequestParam(value = "mgrId") String mgrId){
		System.out.println("calendarBegin="+posLogDto.getCalendarBegin());
		//PosLogDto posLogDto=new PosLogDto();
		//posLogDto.setCalendarBegin(calendarBegin);
		//posLogDto.setCalendarEnd(calendarEnd);
		int shopCode = posMainDao.getShopCode(mgrId);
		ShopDto shop = posMainDao.getShop(shopCode);
		List<ProductDto> product=posMainDao.getProductList(shopCode);
		List<PosLogDto> searchLog=posLogDao.searchLog(posLogDto);
		System.out.println("searchLog="+searchLog);
		System.out.println("calendarBegin="+posLogDto.getCalendarBegin());
		ModelAndView mav = new ModelAndView("pos/salesLog");
		mav.addObject("shop", shop);
		mav.addObject("resultLog",searchLog);
		mav.addObject("product",product);
		return mav;
	}
}






