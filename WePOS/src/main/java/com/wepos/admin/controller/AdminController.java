package com.wepos.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.wepos.admin.dao.AdminDao;
import com.wepos.admin.dto.City;
import com.wepos.admin.dto.ShopType;

@Controller
public class AdminController {

	@Autowired
	private AdminDao adminDao;
	
	// 매장 추가 페이지로 이동
	@RequestMapping("/admin/shopRegistration.do")
	public ModelAndView mainView()
	{
		List<ShopType> shopTypeList = adminDao.getShopType();
		List<City> cityList = adminDao.getCity();
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/shopRegistration");
		mav.addObject("shopTypeList", shopTypeList);
		mav.addObject("cityList", cityList);
		
		return mav;
	}
}
