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
import com.wepos.pos.dao.PosMenuDao;

@Controller
public class PosMenuController {

	@Autowired
	private PosMainDao posMainDao;
	
	@Autowired
	private PosMenuDao posMenuDao;

	// 메뉴 관리 페이지 이동
	@RequestMapping(value = "/pos/updateMenuView.do")
	public ModelAndView getMenuInfo(@RequestParam(value = "mgrId") String mgrId) {

		ProductDto productDto=new ProductDto();
		// 관리자 아이디로 매장 코드 select
		int shopCode = posMainDao.getShopCode(mgrId);
		productDto.setShopCode(shopCode);
		// 매장 코드 번호로 매장 정보 Select
		ShopDto shop = posMainDao.getShop(shopCode);		
		// 매장 내 메뉴 select
		List<ProductDto> productList = posMainDao.getProductList(shopCode);
		List<CategoryDto> categoryList = posMainDao.getCategory(shopCode);

		ModelAndView mav = new ModelAndView("pos/updateMenu");
		mav.addObject("shopCode", shopCode);
		mav.addObject("shop", shop);
		mav.addObject("productList", productList);
		mav.addObject("categoryList", categoryList);
		return mav;
	}

	// 메뉴 관리 페이지 이동
	@RequestMapping(value = "/pos/updateMenu.do")
	public String updateMenuInfo(@RequestParam(value = "mgrId") String mgrId,ProductDto productDto) {
		
		int shopCode = posMainDao.getShopCode(mgrId);
		productDto.setShopCode(shopCode);
		int createTable=0;
		int updateTable=0;
		/*if(tablesDto.getTableCode()==0){
			createTable=posMenuDao.createMenu(tablesDto);
			System.out.println("등록 성공여부 = "+createTable);
		}else{
			updateTable=posMenuDao.updateMenu(tablesDto);			
			System.out.println("수정 성공여부 = "+updateTable);
		}*/
		return "redirect:updateMenuView.do?mgrId="+mgrId;
	}
	
	// 테이블 삭제
		@RequestMapping(value = "/pos/deleteMenu.do")
		public String deleteMenu(@RequestParam(value = "tableCode") int tableCode,
													@RequestParam(value = "mgrId") String mgrId) {
			int result=posMenuDao.deleteMenu(tableCode);
			System.out.println("result="+result);
			return "redirect:updateMenuView.do?mgrId="+mgrId;
		}
	
}





