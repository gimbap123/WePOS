package com.wepos.pos.controller;

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
		int flag=0;
		int data=0;
		int shopCode = posMainDao.getShopCode(mgrId);
		ShopDto shop = posMainDao.getShop(shopCode);
		List<ProductDto> product=posMainDao.getProductList(shopCode);
		List<PosLogDto> mainLog=posLogDao.mainLog();
		
		ModelAndView mav = new ModelAndView("pos/salesLog");
		if(mainLog.isEmpty()==true)
			data=0;
		else
			data=1;
		mav.addObject("shop", shop);
		mav.addObject("resultLog",mainLog);
		mav.addObject("product",product);
		mav.addObject("flag", flag);
		mav.addObject("data",data);
		return mav;
	}
	
	// 검색 후 통계 페이지
	@RequestMapping(value="/pos/searchLog.do", method=RequestMethod.POST)
	public ModelAndView searchLog(@ModelAttribute PosLogDto posLogDto,
														@RequestParam(value = "mgrId") String mgrId){
		int flag=1;
		int data=0;
		List<PosLogDto> searchLog=null;
		if(posLogDto.getProductCode()==0)
			posLogDto.setProductName("전체 메뉴");
		else{
			String productName=posLogDao.productName(posLogDto.getProductCode());
			posLogDto.setProductName(productName);
		}
		int shopCode = posMainDao.getShopCode(mgrId);
		ShopDto shop = posMainDao.getShop(shopCode);
		List<ProductDto> product=posMainDao.getProductList(shopCode);
		
		if(posLogDto.getSearchType()==1)
			searchLog=posLogDao.searchTotalLog(posLogDto);
		else if(posLogDto.getSearchType()==2)
			searchLog=posLogDao.searchDayLog(posLogDto);
		else if(posLogDto.getSearchType()==3)
			searchLog=posLogDao.searchMonthLog(posLogDto);
		
		ModelAndView mav = new ModelAndView("pos/salesLog");
		if(searchLog.isEmpty()==true)
			data=0;
		else
			data=1;
			
		mav.addObject("shop", shop);
		mav.addObject("resultLog",searchLog);
		mav.addObject("product",product);
		mav.addObject("flag",flag);
		mav.addObject("data",data);
		mav.addObject("posLogDto",posLogDto);
		return mav;
	}
}






