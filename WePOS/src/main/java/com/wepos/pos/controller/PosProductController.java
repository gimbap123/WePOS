package com.wepos.pos.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.wepos.common.dto.ProductDto;
import com.wepos.common.dto.ShopDto;
import com.wepos.common.util.FileUtil;
import com.wepos.mgr.dto.CategoryDto;
import com.wepos.pos.dao.PosCategoryDao;
import com.wepos.pos.dao.PosMainDao;
import com.wepos.pos.dao.PosProductDao;

@Controller
public class PosProductController {

	@Autowired
	private PosMainDao posMainDao;

	@Autowired
	private PosProductDao posProductDao;

	@Autowired
	private PosCategoryDao posCategoryDao;

	// 메뉴 관리 페이지 이동
	@RequestMapping(value = "/pos/updateProductView.do")
	public ModelAndView getProductInfo(HttpServletRequest request, @RequestParam(value = "mgrId") String mgrId) 
	{
		ProductDto productDto = new ProductDto();
		int shopCode = posMainDao.getShopCode(mgrId);
		productDto.setShopCode(shopCode);
		ShopDto shop = posMainDao.getShop(shopCode);
		List<ProductDto> productList = posMainDao.getProductList(shopCode);
		List<CategoryDto> categoryList = posCategoryDao.selectCategory(shopCode);
		List<ProductDto> countOrder = posProductDao.countOrder(shopCode);

		ModelAndView mav = new ModelAndView("pos/updateProduct");
		mav.addObject("shopCode", shopCode);
		mav.addObject("shop", shop);
		mav.addObject("productList", productList);
		mav.addObject("categoryList", categoryList);
		mav.addObject("countOrder", countOrder);
		return mav;
	}

	// 메뉴 등록 및 수정
	@RequestMapping(value = "/pos/updateProduct.do")
	public String updateProductInfo(HttpServletRequest request, @RequestParam(value = "mgrId") String mgrId,
			ProductDto productDto) throws IOException, Exception 
	{
		String filePath = request.getSession().getServletContext().getRealPath("/") + "uploadFile/";
		String oldFileName = productDto.getProductFile();

		int shopCode = posMainDao.getShopCode(mgrId);
		productDto.setShopCode(shopCode);
		int createProduct = 0;
		int updateProduct = 0;
		if (productDto.getProductCode() == 0) 
		{
			if (!productDto.getUpload().isEmpty()) 
			{
				String newFileName = FileUtil.rename(productDto.getUpload().getOriginalFilename());
				productDto.setProductFile(newFileName);
				File file = new File(filePath + newFileName);
				productDto.getUpload().transferTo(file);
			}
			createProduct = posProductDao.createProduct(productDto);
		} 
		else 
		{
			if (!productDto.getUpload().isEmpty()) 
			{
				productDto.setProductFile(FileUtil.rename(productDto.getUpload().getOriginalFilename()));
				File file = new File(filePath + productDto.getProductFile());
				productDto.getUpload().transferTo(file);
				if (oldFileName != null) {
					FileUtil.removeFile(oldFileName, filePath);
				}
			} 
			else 
			{
				productDto.setProductFile(oldFileName);
			}

			updateProduct = posProductDao.updateProduct(productDto);
		}
		return "redirect:updateProductView.do?mgrId=" + mgrId;
	}

	// 메뉴 삭제
	@RequestMapping(value = "/pos/deleteProduct.do")
	public String deleteProduct(HttpServletRequest request, @RequestParam(value = "mgrId") String mgrId,
			@RequestParam(value = "productCode") int productCode, ProductDto productDto) 
	{
		String filePath = request.getSession().getServletContext().getRealPath("/") + "uploadFile/";

		if (productDto.getProductFile() != null)
		{
			FileUtil.removeFile(productDto.getProductFile(), filePath);
		}

		int shopCode = posMainDao.getShopCode(mgrId);
		productDto.setShopCode(shopCode);
		int result = posProductDao.deleteProduct(productDto);

		return "redirect:updateProductView.do?mgrId=" + mgrId;
	}

	// 카테고리명 중복확인
	@RequestMapping(value = "/pos/checkProductName.do", method = RequestMethod.POST)
	public ModelAndView checkProductNameProcess(@RequestParam(value = "productName") String productName,
			@RequestParam(value = "shopCode") int shopCode) 
	{
		String comment = "";
		ModelAndView mav = new ModelAndView();
		ProductDto productDto = new ProductDto();
		productDto.setProductName(productName);
		productDto.setShopCode(shopCode);
		int checkResult = posProductDao.checkName(productDto);

		if (checkResult >= 1)
			comment = "이미 등록된 이름입니다.";
		else if (checkResult == 0)
			comment = "사용 가능한 이름입니다.";

		mav.addObject("checkResult", checkResult);
		mav.addObject("comment", comment);
		mav.setViewName("pos/checkName");
		return mav;
	}

}
