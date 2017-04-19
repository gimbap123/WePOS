package com.wepos.user.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.wepos.common.util.PagingUtil;
import com.wepos.user.dao.UserDao;
import com.wepos.user.dto.ProductGradeDto;

@Controller
public class UserController {
	
	@Autowired
	private UserDao userDao;
	
	// 상품 평점 주기 기능 수행
	@RequestMapping("/user/productGrade.do")
	public String productGradeProcess(@ModelAttribute ProductGradeDto productGrade,
			@RequestParam("shopCode") int shopCode, @RequestParam(value="pageNum", defaultValue="1") int currentPage,
			@RequestParam(value="categoryCode", defaultValue="0") int categoryCode)
	{
		userDao.productGradeWrite(productGrade);
		return "redirect:/common/productList.do?shopCode=" + shopCode + "&pageNum=" + currentPage + "&categoryCode=" + categoryCode;
	}
	
	// 상품 평점 수정 기능
	@RequestMapping("/user/productGradeUpdate.do")
	public String productGradeUpdate(@ModelAttribute ProductGradeDto productGrade,
			@RequestParam("shopCode") int shopCode, @RequestParam(value="pageNum", defaultValue="1") int currentPage,
			@RequestParam(value="categoryCode", defaultValue="0") int categoryCode)
	{
		userDao.productGradeUpdate(productGrade);
		return "redirect:/common/productList.do?shopCode=" + shopCode + "&pageNum=" + currentPage + "&categoryCode=" + categoryCode;
	}
	
	// 상품 평점 삭제 기능
	@RequestMapping("/user/productGradeDelete.do")
	public String productGradeDelete(@ModelAttribute ProductGradeDto productGrade,
			@RequestParam("shopCode") int shopCode, @RequestParam(value="pageNum", defaultValue="1") int currentPage,
			@RequestParam(value="categoryCode", defaultValue="0") int categoryCode)
	{
		userDao.productGradeDelete(productGrade);
		return "redirect:/common/productList.do?shopCode=" + shopCode + "&pageNum=" + currentPage + "&categoryCode=" + categoryCode;
	}
	
	// 상품 평점 보기
	@RequestMapping("/user/productGradeModal.do")
	public ModelAndView productGradeModal(@RequestParam("productCode") int productCode,
			@RequestParam("productName") String productName,
			@RequestParam(value="pageNum", defaultValue="1") int currentPage)
	{	
		int productGradeCount = userDao.productGradeCount(productCode);
		
		String paramString = "javascript:gradeModalPaging";
		PagingUtil page = new PagingUtil(paramString, currentPage, productGradeCount, 5, 5, null);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("productCode", productCode);
		map.put("start", page.getStartCount());
		map.put("end", page.getEndCount());
		
		List<ProductGradeDto> productGradeModalList = null;
		
		if(productGradeCount > 0)
		{
			productGradeModalList = userDao.productGradeModalList(map);
		}
		else
		{
			productGradeModalList = Collections.emptyList();
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("common/productGradeModal");
		mav.addObject("productGradeModalList", productGradeModalList);
		mav.addObject("productName", productName);
		mav.addObject("productGradeCount", productGradeCount);
		mav.addObject("pagingHtml", page.getPagingHtml());			
		mav.addObject("productCode", productCode);			
		
		return mav;
	}

}
