package com.wepos.mgr.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.wepos.admin.dao.AdminDao;
import com.wepos.admin.dto.CityDto;
import com.wepos.admin.dto.LocalDto;
import com.wepos.admin.dto.ShopTypeDto;
import com.wepos.common.dto.BusinessHoursDto;
import com.wepos.common.dto.ShopDto;
import com.wepos.mgr.dao.MgrDao;

@Controller
public class MgrController {
	
	@Autowired
	private MgrDao mgrDao;
	
	@Autowired
	private AdminDao adminDao;
	
	// 매장 검색
	@RequestMapping(value = "/pos/shopInfoUpdate.do")
	public ModelAndView shopInfoUpdate(@RequestParam("shopCode") int shopCode)
	{
		ShopDto shop = mgrDao.shopInfo(shopCode);
		
		BusinessHoursDto businessHours = new BusinessHoursDto();
		businessHours.parsingHours(shop.getShopStartTime(), shop.getShopEndTime());
		
		List<ShopTypeDto> shopTypeList = adminDao.getShopType();
		List<CityDto> cityList = adminDao.getCity();
		
		List<LocalDto> localList = null;
		  
		if(shop.getCityCode() != 0)
		{
			localList = adminDao.searchLocal(shop.getCityCode());
	 	}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("pos/shopInfoUpdate");
		mav.addObject("shop", shop);
		mav.addObject("shopTypeList", shopTypeList);
		mav.addObject("cityList", cityList);	
		mav.addObject("localList", localList);
		mav.addObject("businessHours", businessHours);
		
		return mav;
	}
}
