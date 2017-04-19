package com.wepos.pos.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.wepos.common.dto.ProductDto;
import com.wepos.common.dto.ShopDto;
import com.wepos.mgr.dto.CategoryDto;
import com.wepos.pos.dao.PosCategoryDao;
import com.wepos.pos.dao.PosLogDao;
import com.wepos.pos.dao.PosMainDao;
import com.wepos.pos.dto.PosLogDto;

@Controller
public class PosLogController {

	@Autowired
	private PosMainDao posMainDao;
	@Autowired
	private PosLogDao posLogDao;
	@Autowired
	private PosCategoryDao posCategoryDao;

	// 매출 통계 메인 페이지
	@RequestMapping("/pos/salesLog.do")
	public ModelAndView showSalesLog(@RequestParam(value = "mgrId") String mgrId) {
		int shopCode = posMainDao.getShopCode(mgrId);
		ShopDto shop = posMainDao.getShop(shopCode);
		PosLogDto posLogDto=new PosLogDto();
		posLogDto.setShopCode(shopCode);
		List<ProductDto> product=posMainDao.getProductList(shopCode);
		List<PosLogDto> mainLog=posLogDao.mainLog(posLogDto);
		List<CategoryDto> categoryList = posCategoryDao.selectCategory(shopCode);
		
		ModelAndView mav = new ModelAndView("pos/salesLog");
		
		mav.addObject("shop", shop);
		mav.addObject("resultLog",mainLog);
		mav.addObject("product",product);
		mav.addObject("categoryList",categoryList);
		return mav;
	}
	
	// 검색 후 통계 페이지
	@RequestMapping(value="/pos/searchLog.do", method=RequestMethod.POST)
	public ModelAndView searchLog(@ModelAttribute PosLogDto posLogDto,
														@RequestParam(value = "mgrId") String mgrId){
		
		int shopCode = posMainDao.getShopCode(mgrId);
		posLogDto.setShopCode(shopCode);
		ShopDto shop = posMainDao.getShop(shopCode);
		List<ProductDto> product=posMainDao.getProductList(shopCode);		
		List<PosLogDto> searchLog=null;
		
		if(posLogDto.getProductCode()==0)
			posLogDto.setProductName("전체 메뉴");
		else{
			String productName=posLogDao.productName(posLogDto.getProductCode());
			posLogDto.setProductName(productName);
		}
		
		if(posLogDto.getCategoryCode()==0)
			posLogDto.setCategoryName("전체 상품분류");
		else{
			String categoryName=posLogDao.categoryName(posLogDto);
			posLogDto.setCategoryName(categoryName);
		}
		
		
		if(posLogDto.getSearchGroup()==1){			
			if(posLogDto.getSearchType()==2)
				searchLog=posLogDao.categoryDayLog(posLogDto);
			else if(posLogDto.getSearchType()==3)
				searchLog=posLogDao.categoryMonthLog(posLogDto);
		}
		else if(posLogDto.getSearchGroup()==2){
			if(posLogDto.getSearchType()==1)
				searchLog=posLogDao.searchTotalLog(posLogDto);
			else if(posLogDto.getSearchType()==2)
				searchLog=posLogDao.searchDayLog(posLogDto);
			else if(posLogDto.getSearchType()==3)
				searchLog=posLogDao.searchMonthLog(posLogDto);
		}		
		
		ModelAndView mav = new ModelAndView("pos/salesLog");
			
		mav.addObject("shop", shop);
		mav.addObject("resultLog",searchLog);
		mav.addObject("product",product);
		mav.addObject("posLogDto",posLogDto);
		return mav;
	}
	
	@RequestMapping(value="/pos/searchCategory.do", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String searchCategory(@RequestParam("shopCode") int shopCode)
	{
		List<CategoryDto> categoryList = posCategoryDao.selectCategory(shopCode);
		StringBuffer sb = new StringBuffer();
		for(CategoryDto categoryDto : categoryList)
		{			
			sb.append("<option value=\"");
			sb.append(categoryDto.getCategoryCode());
			sb.append("\">");
			sb.append(categoryDto.getCategoryName());
			sb.append("</option>");			
		}		
		return sb.toString();
	}
	
	@RequestMapping(value="/pos/searchProduct.do", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String searchProduct(@RequestParam("shopCode") int shopCode)
	{
		List<ProductDto> product=posMainDao.getProductList(shopCode);
		StringBuffer sb = new StringBuffer();
		for(ProductDto productDto : product)
		{			
			sb.append("<option value=\"");
			sb.append(productDto.getProductCode());
			sb.append("\">");
			sb.append(productDto.getProductName());
			sb.append("</option>");			
		}		
		return sb.toString();
	}
}






