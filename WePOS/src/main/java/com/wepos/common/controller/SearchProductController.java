package com.wepos.common.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.wepos.admin.dao.AdminDao;
import com.wepos.admin.dto.CityDto;
import com.wepos.admin.dto.LocalDto;
import com.wepos.admin.dto.ShopTypeDto;
import com.wepos.common.dao.ProductDao;
import com.wepos.common.dto.ProductDto;
import com.wepos.common.dto.ShopDto;
import com.wepos.common.util.PagingUtil;

@Controller
public class SearchProductController {
	
	@Autowired
	private AdminDao adminDao;
	
	@Autowired
	private ProductDao productDao;
	
	// 상품 검색
	@RequestMapping(value = "/common/searchProduct.do")
	public ModelAndView searchProductView(HttpServletRequest request, 
			@RequestParam(value="pageNum", defaultValue="1") int currentPage, 
			@ModelAttribute ShopDto shop, @RequestParam(value="productName", defaultValue="") String productName)
	{
		String filePath = request.getSession().getServletContext().getRealPath("/") + "uploadFile\\";
		int index = filePath.lastIndexOf("\\WePOS");
		filePath = filePath.substring(index);
		
		if("".equals(productName))
		{
			productName = null;
		}
		  
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("productName", productName);
		map.put("shopTypeCode", shop.getShopTypeCode());
		map.put("cityCode", shop.getCityCode());
		map.put("localCode", shop.getLocalCode());
		
		int productCount = productDao.searchProductCount(map);
		  
		PagingUtil page = null;
		if(shop.getShopTypeCode() == 0 && shop.getCityCode() == 0 && shop.getLocalCode() == 0 
				&& productName == null)
		{
			page = new PagingUtil(currentPage, productCount, 12, 5, "searchProduct.do");
		}
		else
		{
			String paramString = "";
			if(productName == null)
			{
				paramString = "?shopTypeCode=" + shop.getShopTypeCode() +
						"&cityCode=" + shop.getCityCode() + "&localCode=" + shop.getLocalCode();
			}
			else
			{
				paramString = "?productName=" + productName + "&shopTypeCode=" + shop.getShopTypeCode() +
						"&cityCode=" + shop.getCityCode() + "&localCode=" + shop.getLocalCode();
			}
			page = new PagingUtil(paramString, currentPage, productCount, 12, 5, "searchProduct.do");
		}
		
		map.put("start", page.getStartCount());
		map.put("end", page.getEndCount());	  
		
		List<ProductDto> productList = null;
		
		if(productCount > 0)
		{
			productList = productDao.searchProduct(map);
			for(ProductDto resultProduct : productList)
			{
				if(resultProduct.getProductFile() != null)
				{
					String fileName = resultProduct.getProductFile();		
					resultProduct.setProductFile(filePath + fileName);
				}
				else
				{
					resultProduct.setProductFile("/WePOS/uploadFile/nullImg.jpg");
				}
			}
		}  
		else
		{
			productList = Collections.emptyList();
		}
		
		List<ShopTypeDto> shopTypeList = adminDao.getShopType();
		List<CityDto> cityList = adminDao.getCity();
		  
		List<LocalDto> localList = null;
		  
		if(shop.getCityCode() != 0)
		{
			localList = adminDao.searchLocal(shop.getCityCode());
		}
		  
		ModelAndView mav = new ModelAndView();
		mav.setViewName("common/searchProduct");
		mav.addObject("productList", productList);  
		mav.addObject("productCount", productCount);
		mav.addObject("shopTypeList", shopTypeList);
		mav.addObject("cityList", cityList);
		mav.addObject("localList", localList);
		mav.addObject("pagingHtml", page.getPagingHtml());
		
		mav.addObject("shopTypeCode", shop.getShopTypeCode());
		mav.addObject("cityCode", shop.getCityCode());
		mav.addObject("localCode", shop.getLocalCode());
		mav.addObject("productName", productName);
		
		return mav;
	}

}
