package com.wepos.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

}
