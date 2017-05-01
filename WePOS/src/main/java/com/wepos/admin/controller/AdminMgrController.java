package com.wepos.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.wepos.admin.dao.AdminDao;
import com.wepos.admin.dto.ShopTypeDto;
import com.wepos.common.dto.ShopDto;
import com.wepos.mgr.dto.MgrDto;

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

	// 선택한 매장의 코드 가져오기
	@RequestMapping(value = "/admin/searchShopCode.do", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String searchShopCode(@RequestParam("shopTypeCode") int shopTypeCode) 
	{
		List<ShopDto> shopList = adminDao.searchShopCode(shopTypeCode);
		StringBuffer sb = new StringBuffer();

		for (ShopDto shop : shopList) {
			sb.append("<option value=\"");
			sb.append(shop.getShopCode());
			sb.append("\">");
			sb.append(shop.getShopName());
			sb.append("</option>");
		}
		return sb.toString();
	}

	// 관리자 추가 기능 수행
	@RequestMapping(value = "/admin/shopMgrRegistration.do", method = RequestMethod.POST)
	public String shopMgrRegistrationProcess(HttpServletRequest request, @ModelAttribute MgrDto mgrDto) throws IOException, Exception 
	{
		String shopTypeCode = request.getParameter("shopTypeCode");

		if (shopTypeCode.equals(1)) {
			mgrDto.setShopCode(Integer.parseInt(shopTypeCode));
		}
		if (shopTypeCode.equals(2)) {
			mgrDto.setShopCode(Integer.parseInt(shopTypeCode));
		}
		if (shopTypeCode.equals(3)) {
			mgrDto.setShopCode(Integer.parseInt(shopTypeCode));
		}
		if (shopTypeCode.equals(4)) {
			mgrDto.setShopCode(Integer.parseInt(shopTypeCode));
		}

		adminDao.insertMgr(mgrDto);

		return "redirect:/common/main.do";
	}

	// 관리자 정보 수정
	@RequestMapping(value = "/admin/showMgrInfo.do")
	public ModelAndView showUserInfoView(@RequestParam("mgrId") String mgrId)
	{
		ModelAndView mav = new ModelAndView();
		MgrDto mgrInfo = adminDao.showMgrInfo(mgrId);
		String shopName = adminDao.showShopInfo(mgrInfo.getShopCode());
		mav.addObject("mgrInfo", mgrInfo);
		mav.addObject("shopName", shopName);
		mav.setViewName("admin/updateMgrInfo");
		return mav;
	}

	@RequestMapping(value = "/admin/updateMgrInfo.do")
	public ModelAndView updateUserInfoProcess(@ModelAttribute MgrDto mgrDto)
	{
		ModelAndView mav = new ModelAndView();
		int result = adminDao.updateMgrInfo(mgrDto);

		mav.addObject("result", result);

		if (result == 1) {
			mav.setViewName("common/main");
		}

		if (result == 0) {
			mav.setViewName("admin/updateMgrInfo");
		}
		return mav;
	}
}
