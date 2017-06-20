package com.wepos.pos.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.wepos.common.dto.ProductDto;
import com.wepos.common.dto.ShopDto;
import com.wepos.common.dto.TablesDto;
import com.wepos.pos.dao.PosMainDao;
import com.wepos.pos.dao.PosTableDao;

@Controller
public class PosTableController {

	@Autowired
	private PosMainDao posMainDao;

	@Autowired
	private PosTableDao posTableDao;

	// 테이블 관리 페이지 이동
	@RequestMapping(value = "/pos/updateTableView.do")
	public ModelAndView getTableInfo(@RequestParam(value = "mgrId") String mgrId)
	{
		int shopCode = posMainDao.getShopCode(mgrId);
		// 매장 코드 번호로 매장 정보 Select
		ShopDto shop = posMainDao.getShop(shopCode);
		// 매장 내 테이블 정보 select
		List<TablesDto> tables = posMainDao.getTables(shopCode);
		// 매장 내 테이블 숫자 select
		int tableCount = posMainDao.getTableCount(shopCode);
		// 매장 내 메뉴 select
		List<ProductDto> productList = posMainDao.getProductList(shopCode);

		ModelAndView mav = new ModelAndView("pos/updateTable");
		mav.addObject("shopCode", shopCode);
		mav.addObject("shop", shop);
		mav.addObject("tables", tables);
		mav.addObject("productList", productList);
		mav.addObject("tableCount", tableCount);
		return mav;
	}

	// 테이블 관리 페이지 이동
	@RequestMapping(value = "/pos/updateTable.do")
	public String updateTableInfo(@RequestParam(value = "mgrId") String mgrId, TablesDto tablesDto) 
	{
		int shopCode = posMainDao.getShopCode(mgrId);
		tablesDto.setShopCode(shopCode);
		if (tablesDto.getTableCode() == 0) 
		{
			posTableDao.createTable(tablesDto);
		} else 
		{
			posTableDao.updateTable(tablesDto);
		}
		return "redirect:updateTableView.do?mgrId=" + mgrId;
	}

	// 테이블 삭제
	@RequestMapping(value = "/pos/deleteTable.do")
	public String deleteTable(@RequestParam(value = "tableCode") int tableCode,
			@RequestParam(value = "mgrId") String mgrId)
	{
		posTableDao.deleteTable(tableCode);
		return "redirect:updateTableView.do?mgrId=" + mgrId;
	}

}
