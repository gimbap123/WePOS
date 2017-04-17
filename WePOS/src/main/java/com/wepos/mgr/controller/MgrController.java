package com.wepos.mgr.controller;

import java.io.File;
import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.wepos.common.dao.ShopDao;
import com.wepos.common.dto.BusinessHoursDto;
import com.wepos.common.dto.ShopDto;
import com.wepos.common.util.FileUtil;
import com.wepos.common.util.PagingUtil;
import com.wepos.mgr.dao.MgrDao;
import com.wepos.mgr.dto.ShopNoticeDto;

@Controller
public class MgrController {
	
	@Autowired
	private MgrDao mgrDao;
	
	@Autowired
	private AdminDao adminDao;
	
	@Autowired
	private ShopDao shopDao;
	
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
	
	@RequestMapping(value = "/pos/posShopNotice.do")
	public ModelAndView posShopNotice(@RequestParam("shopCode") int shopCode,
			@RequestParam(value="searchNoticeType", defaultValue="all") String searchNoticeType, 
			@RequestParam(value="searchNoticeText", defaultValue="") String searchNoticeText,
			@RequestParam(value="pageNum", defaultValue="1") int currentPage)
	{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("shopCode", shopCode);
		map.put("searchNoticeType", searchNoticeType);
		map.put("searchNoticeText", searchNoticeText);
		
		int shopNoticeCount = shopDao.shopNoticeCount(map);
		
		String paramString = "?shopCode=" + shopCode +
				  "&searchNoticeType=" + searchNoticeType + "&searchNoticeText=" + searchNoticeText;		
		
		PagingUtil page = new PagingUtil(paramString, currentPage, shopNoticeCount, 5, 5, "posShopNotice.do");
		
		map.put("start", page.getStartCount());
		map.put("end", page.getEndCount());
		
		List<ShopNoticeDto> shopNoticeList = null;
		
		if(shopNoticeCount > 0)
		{
			shopNoticeList = shopDao.shopNoticeList(map); 		  		  
		}
		else
		{
			shopNoticeList = Collections.emptyList();
		}
		
		Map<String, Object> searchNoticeTypeList = new HashMap<String, Object>();
		searchNoticeTypeList.put("all", "전체");
		searchNoticeTypeList.put("mgr_id", "작성자");
		searchNoticeTypeList.put("notice_title", "제목");
		searchNoticeTypeList.put("notice_content", "내용");
				
		ModelAndView mav = new ModelAndView();
		mav.setViewName("pos/posShopNotice");
		mav.addObject("shopNoticeList", shopNoticeList);
		mav.addObject("shopNoticeCount", shopNoticeCount);
		mav.addObject("pagingHtml", page.getPagingHtml());
		
		mav.addObject("searchNoticeType", searchNoticeType);
		mav.addObject("searchNoticeText", searchNoticeText);
		mav.addObject("searchNoticeTypeList", searchNoticeTypeList);
		mav.addObject("shopCode", shopCode);
		mav.addObject("menuType", "pos");
		
		return mav;
	}	
		
}
