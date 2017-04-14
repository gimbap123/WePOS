package com.wepos.pos.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.wepos.common.dto.ProductDto;
import com.wepos.common.dto.ShopDto;
import com.wepos.mgr.dto.CategoryDto;
import com.wepos.pos.dao.PosMainDao;
import com.wepos.pos.dao.PosProductDao;

@Controller
public class PosProductController {

	@Autowired
	private PosMainDao posMainDao;
	
	@Autowired
	private PosProductDao posProductDao;

	// 메뉴 관리 페이지 이동
	@RequestMapping(value = "/pos/updateProductView.do")
	public ModelAndView getProductInfo(@RequestParam(value = "mgrId") String mgrId) {

		ProductDto productDto=new ProductDto();
		int shopCode = posMainDao.getShopCode(mgrId);
		productDto.setShopCode(shopCode);
		ShopDto shop = posMainDao.getShop(shopCode);	
		List<ProductDto> productList = posMainDao.getProductList(shopCode);
		List<CategoryDto> categoryList = posMainDao.getCategory(shopCode);

		ModelAndView mav = new ModelAndView("pos/updateProduct");
		mav.addObject("shopCode", shopCode);
		mav.addObject("shop", shop);
		mav.addObject("productList", productList);
		mav.addObject("categoryList", categoryList);
		return mav;
	}

	// 메뉴 등록 및 수정
	@RequestMapping(value = "/pos/updateProduct.do")
	public String updateProductInfo(@RequestParam(value = "mgrId") String mgrId,ProductDto productDto) {
		
		int shopCode = posMainDao.getShopCode(mgrId);
		productDto.setShopCode(shopCode);
		int createProduct=0;
		int updateProduct=0;
		if(productDto.getProductCode()==0){
			createProduct=posProductDao.createProduct(productDto);
			System.out.println("등록 성공여부 = "+createProduct);
		}else{
			updateProduct=posProductDao.updateProduct(productDto);			
			System.out.println("수정 성공여부 = "+updateProduct);
		}
		return "redirect:updateProductView.do?mgrId="+mgrId;
	}
	
	// 테이블 삭제
		@RequestMapping(value = "/pos/deleteProduct.do")
		public String deleteProduct(@RequestParam(value = "mgrId") String mgrId,ProductDto productDto) {
			int shopCode = posMainDao.getShopCode(mgrId);
			productDto.setShopCode(shopCode);
			System.out.println("productCode="+productDto.getProductCode());
			System.out.println("shopCode="+productDto.getShopCode());
			int result=posProductDao.deleteProduct(productDto);
			System.out.println("result="+result);
			return "redirect:updateProductView.do?mgrId="+mgrId;
		}
	
}





