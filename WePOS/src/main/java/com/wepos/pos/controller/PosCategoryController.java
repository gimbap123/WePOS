package com.wepos.pos.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public ModelAndView getCategoryInfo(@RequestParam(value = "mgrId") String mgrId) {

		int shopCode = posMainDao.getShopCode(mgrId);		
		ShopDto shop = posMainDao.getShop(shopCode);
		List<CategoryDto> categoryList = posMainDao.getCategory(shopCode);

		ModelAndView mav = new ModelAndView("pos/updateCategory");
		mav.addObject("shopCode", shopCode);
		mav.addObject("shop", shop);
		mav.addObject("categoryList", categoryList);
		return mav;
	}

	// 메뉴 등록 및 수정
	@RequestMapping(value = "/pos/updateCategory.do")
	public String updateCategoryInfo(@RequestParam(value = "mgrId") String mgrId,CategoryDto categoryDto) {
		
		int shopCode = posMainDao.getShopCode(mgrId);
		categoryDto.setShopCode(shopCode);
		int createCategory=0;
		int updateCategory=0;
		if(categoryDto.getCategoryCode()==0){
			createCategory=posCategoryDao.createCategory(categoryDto);
			System.out.println("등록 성공여부 = "+createCategory);
		}else{
			updateCategory=posCategoryDao.updateCategory(categoryDto);			
			System.out.println("수정 성공여부 = "+updateCategory);
		}
		return "redirect:updateCategoryView.do?mgrId="+mgrId;
	}
	
	// 테이블 삭제
		@RequestMapping(value = "/pos/deleteCategory.do")
		public String deleteCategory(@RequestParam(value = "mgrId") String mgrId,CategoryDto categoryDto) {
			int shopCode = posMainDao.getShopCode(mgrId);
			categoryDto.setShopCode(shopCode);
			int result=posCategoryDao.deleteCategory(categoryDto);
			System.out.println("result="+result);
			return "redirect:updateCategoryView.do?mgrId="+mgrId;
		}
	
}





