package com.wepos.admin.controller;

import java.io.File;
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
import com.wepos.admin.dto.CityDto;
import com.wepos.admin.dto.LocalDto;
import com.wepos.admin.dto.ShopTypeDto;
import com.wepos.common.dto.ShopDto;
import com.wepos.common.util.FileUtil;

@Controller
public class AdminController {

	@Autowired
	private AdminDao adminDao;
	
	// 매장 추가 페이지로 이동
	@RequestMapping(value = "/admin/shopRegistration.do", method = RequestMethod.GET)
	public ModelAndView shopRegistrationView()
	{
		List<ShopTypeDto> shopTypeList = adminDao.getShopType();
		List<CityDto> cityList = adminDao.getCity();
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/shopRegistration");
		mav.addObject("shopTypeList", shopTypeList);
		mav.addObject("cityList", cityList);
		
		return mav;
	}
	
	// 선택한 지역에 따른 시, 군 정보 가져오기
	@RequestMapping(value = "/admin/searchLocal.do", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String searchLocal(@RequestParam("cityCode") int cityCode)
	{
		List<LocalDto> localList = adminDao.searchLocal(cityCode);
		StringBuffer sb = new StringBuffer();
		for(LocalDto local : localList)
		{			
			sb.append("<option value=\"");
			sb.append(local.getLocalCode());
			sb.append("\">");
			sb.append(local.getLocalName());
			sb.append("</option>");			
		}		
		return sb.toString();
	}
	
	// 매장 추가 기능 수행
	@RequestMapping(value = "/admin/shopRegistration.do", method = RequestMethod.POST)
	public String shopRegistrationProcess(HttpServletRequest request, @ModelAttribute ShopDto shop) throws IOException, Exception
	{
		String newFileName = "";
		String filePath = request.getSession().getServletContext().getRealPath("/") + "downloadFile/";
		if(!shop.getUpload().isEmpty())
		{
			newFileName = FileUtil.rename(shop.getUpload().getOriginalFilename());
			shop.setShopFile(newFileName);
			File file = new File(filePath + newFileName);
			shop.getUpload().transferTo(file);
		}
		
		adminDao.shopRegistration(shop);		
		return "redirect:/admin/shopRegistration.do";
	}
}
