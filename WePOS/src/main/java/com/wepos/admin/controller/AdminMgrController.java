package com.wepos.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.wepos.admin.dao.AdminDao;
import com.wepos.admin.dto.ShopTypeDto;
import com.wepos.common.dto.UsersDto;
import com.wepos.mgr.dto.ShopMgrDto;

@Controller
public class AdminMgrController {

	@Autowired
	private AdminDao adminDao;
	
	// 관리자 추가 페이지로 이동
	@RequestMapping(value = "/admin/shopMgrRegistration.do", method = RequestMethod.GET)
	public ModelAndView shopMgrRegistrationView()
	{
		List<ShopTypeDto> shopTypeList = adminDao.getShopType();
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/shopMgrRegistration");
		mav.addObject("shopTypeList", shopTypeList);
		
		return mav;
	}
	
	
	// 관리자 추가 기능 수행
	@RequestMapping(value = "/admin/shopMgrRegistration.do", method = RequestMethod.POST)
	public String shopMgrRegistrationProcess(HttpServletRequest request, @ModelAttribute ShopMgrDto shopMgrDto) throws IOException, Exception
	{
				
		/*adminDao.shopMgrRegistration(shopMgrDto);		*/
		return "redirect:/admin/shopRegistration.do";
	}
	
}