package com.wepos.mgr.controller;

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
import org.springframework.web.servlet.ModelAndView;

import com.wepos.admin.dao.AdminDao;
import com.wepos.admin.dto.CityDto;
import com.wepos.admin.dto.LocalDto;
import com.wepos.admin.dto.ShopTypeDto;
import com.wepos.common.dto.BusinessHoursDto;
import com.wepos.common.dto.ShopDto;
import com.wepos.common.util.FileUtil;
import com.wepos.mgr.dao.MgrDao;

@Controller
public class MgrController {
	
	@Autowired
	private MgrDao mgrDao;
	
	@Autowired
	private AdminDao adminDao;
	
	// 매장 수정
	@RequestMapping(value = "/pos/shopInfoUpdate.do", method = RequestMethod.GET)
	public ModelAndView shopInfoUpdateView(@RequestParam("shopCode") int shopCode)
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
	
	// 매장 수정 기능 수행
	@RequestMapping(value = "/pos/shopInfoUpdate.do", method = RequestMethod.POST)
	public String shopInfoUpdateProcess(HttpServletRequest request, 
			@ModelAttribute ShopDto shop, @ModelAttribute BusinessHoursDto businessHours) throws IOException, Exception
	{
		String filePath = request.getSession().getServletContext().getRealPath("/") + "uploadFile/";
		String oldFileName = shop.getShopFile();	
		
		String startTime = businessHours.getStartHour() + ":" + businessHours.getStartMinute() + businessHours.getStartHourType();
		String endTime = businessHours.getEndHour() + ":" + businessHours.getEndMinute() + businessHours.getEndHourType();
		
		shop.setShopStartTime(startTime);
		shop.setShopEndTime(endTime);
		
		if(!shop.getUpload().isEmpty())
		{
			shop.setShopFile(FileUtil.rename(shop.getUpload().getOriginalFilename()));
			File file = new File(filePath + shop.getShopFile());
			shop.getUpload().transferTo(file);
			if(oldFileName != null)
			{
				FileUtil.removeFile(oldFileName, filePath);
			}
		}
		else
		{
			shop.setShopFile(oldFileName);
		}
		
		mgrDao.shopInfoUpdate(shop);
		
		return "redirect:/pos/shopInfoUpdate.do?shopCode=" + shop.getShopCode();
	}
		
}
