package com.wepos.pos.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.wepos.common.dto.ShopDto;
import com.wepos.mgr.dto.CategoryDto;
import com.wepos.pos.dao.PosCategoryDao;
import com.wepos.pos.dao.PosMainDao;

@Controller
public class PosCategoryController {

	@Autowired
	private PosMainDao posMainDao;
	
	@Autowired
	private PosCategoryDao posCategoryDao;

	// 메뉴 관리 페이지 이동
	@RequestMapping(value = "/pos/updateCategoryView.do")
	public ModelAndView getCategoryInfo(@RequestParam(value = "mgrId") String mgrId) 
	{
		int shopCode = posMainDao.getShopCode(mgrId);		
		ShopDto shop = posMainDao.getShop(shopCode);
		List<CategoryDto> categoryList = posCategoryDao.selectCategory(shopCode);
		List<CategoryDto> countProduct = posCategoryDao.countProduct(shopCode);

		ModelAndView mav = new ModelAndView("pos/updateCategory");
		mav.addObject("shopCode", shopCode);
		mav.addObject("shop", shop);
		mav.addObject("categoryList", categoryList);
		mav.addObject("countProduct", countProduct);
		return mav;
	}

	// 메뉴 등록 및 수정
	@RequestMapping(value = "/pos/updateCategory.do")
	public String updateCategoryInfo(@RequestParam(value = "mgrId") String mgrId,CategoryDto categoryDto) 
	{		
		int shopCode = posMainDao.getShopCode(mgrId);
		categoryDto.setShopCode(shopCode);
		if(categoryDto.getCategoryCode()==0){
			posCategoryDao.createCategory(categoryDto);
		}else{
			posCategoryDao.updateCategory(categoryDto);			
		}
		return "redirect:updateCategoryView.do?mgrId="+mgrId;
	}
	
	// 테이블 삭제
	@RequestMapping(value = "/pos/deleteCategory.do")
	public String deleteCategory(@RequestParam(value = "mgrId") String mgrId,CategoryDto categoryDto) 
	{
		int shopCode = posMainDao.getShopCode(mgrId);
		categoryDto.setShopCode(shopCode);
		posCategoryDao.deleteCategory(categoryDto);
		
		return "redirect:updateCategoryView.do?mgrId="+mgrId;
	}
	
	// 카테고리명 중복확인
	@RequestMapping(value="/pos/checkCategoryName.do", method=RequestMethod.POST)
	public ModelAndView checkCategoryNameProcess(@RequestParam(value = "categoryName") String categoryName,
																	@RequestParam(value = "shopCode") int shopCode)
	{
		String comment="";
		ModelAndView mav=new ModelAndView();
		CategoryDto categoryDto=new CategoryDto();		
		categoryDto.setCategoryName(categoryName);
		categoryDto.setShopCode(shopCode);
		int checkResult = posCategoryDao.checkName(categoryDto);
				
		if(checkResult>=1)
			comment="이미 등록된 이름입니다.";
		else if(checkResult==0)
			comment="사용 가능한 이름입니다.";
		
		mav.addObject("checkResult",checkResult);
		mav.addObject("comment",comment);
		mav.setViewName("pos/checkName");			
		return mav;
	}
	
}





