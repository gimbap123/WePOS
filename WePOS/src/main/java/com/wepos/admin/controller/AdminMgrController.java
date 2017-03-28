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
	
	
	/*// 아이디 중복검사
		@RequestMapping(value="/common/checkId.do")
		public ModelAndView checkIdProcess(@ModelAttribute UsersDto id)
		{
			ModelAndView mav=new ModelAndView();
			int checkIdFromUsers = adminDao.checkIdFromUsers(id);
			int checkIdFromMgr = adminDao.checkIdFromMgr(id);
			System.out.println("checkIdFromUsers 중복여부 : " + checkIdFromUsers);
			System.out.println("checkIdFromMgr 중복여부 : " + checkIdFromMgr);
			String comment="";
			
			if(checkIdFromUsers==1 || checkIdFromMgr==1)
				comment="이미 등록된 아이디입니다.";
			else if(checkIdFromUsers==0 || checkIdFromMgr==0)
				comment="사용 가능한 아이디입니다.";
			
			mav.addObject("checkIdFromUsers",checkIdFromUsers);
			mav.addObject("checkIdFromMgr",checkIdFromMgr);
			mav.addObject("comment",comment);
			mav.setViewName("../common/checkId");
				
			return mav;
		}*/
}
