package com.wepos.pos.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.wepos.common.dto.SumOrdersDetailDto;
import com.wepos.common.dto.UsersDto;
import com.wepos.pos.dao.PosPaymentDao;

@Controller
public class PosPaymentController {

	@Autowired
	private PosPaymentDao posPaymentDao;

	@RequestMapping(value = "/pos/getPaymentInfo.do", method = RequestMethod.GET, produces = "text/json;charset=UTF8")
	public void paymentAjax(@RequestParam("tableCode") String tableCode, HttpServletResponse response)
	{
		response.setContentType("text/html;charset=UTF-8");

		Gson gson = new Gson();
		String paymentJson = null;

		List<SumOrdersDetailDto> oddList = posPaymentDao.getPaymentInfoOfTable(tableCode);

		if (oddList != null)
		{
			paymentJson = gson.toJson(oddList);
		}
		try 
		{
			response.getWriter().print(paymentJson);
		} 
		catch (IOException e) 
		{
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/pos/posPayment.do", method = RequestMethod.POST)
	public String posPayment(@RequestParam("shopCode") int shopCode, @RequestParam("tableCode") int tableCode,
			@RequestParam("paymentCode") int paymentCode, @RequestParam("userId") String userId, 
			@RequestParam("userPaymentPrice") int userPaymentPrice,HttpSession session) 
	{

		Map<String, Integer> paymentInfo = new HashMap<String, Integer>();

		paymentInfo.put("shopCode", shopCode);
		paymentInfo.put("tableCode", tableCode);
		paymentInfo.put("paymentCode", paymentCode);		
		posPaymentDao.updatePaymentComplete(paymentInfo);
		posPaymentDao.updateTableStatusToUnused(tableCode);
		
		UsersDto usersDto=new UsersDto();
		usersDto.setUserId(userId);
		usersDto.setUserExpense(userPaymentPrice);
		posPaymentDao.updateUsersExpense(usersDto);

		return "redirect:posMain.do?mgrId=" + session.getAttribute("id");
	}
	
	@RequestMapping(value = "/pos/getUserGradeInfo.do", method = RequestMethod.GET,produces = "text/json;charset=UTF8")
	public void getUserGradeInfo(@RequestParam("userPhone") String userPhone, HttpServletResponse response) 
	{
		response.setContentType("text/html;charset=UTF-8");
		List<UsersDto> userInfo=posPaymentDao.getUserGradeInfo(userPhone);
		Gson gson = new Gson();
		String paymentJson=gson.toJson(userInfo);
		try{
			response.getWriter().print(paymentJson);
		}catch(IOException e){
			e.printStackTrace();
		}
		
		/*ModelAndView mav=new ModelAndView();
		mav.setViewName("pos/posUserGrade");
		mav.addObject("userInfo",userInfo);
		
		return mav;*/
	}

/*	@RequestMapping(value = "/pos/getUserGradeInfo.do", method = RequestMethod.GET,produces = "text/json;charset=UTF8")
	public ModelAndView getUserGradeInfo(@RequestParam("userPhone") String userPhone,HttpServletResponse response) 
	{
		List<UsersDto> userInfo=posPaymentDao.getUserGradeInfo(userPhone);
		Gson gson = new Gson();
		String paymentJson=gson.toJson(userInfo);
		try{
			response.getWriter().print(paymentJson);
		}catch(IOException e){
			e.printStackTrace();
		}
				
		ModelAndView mav=new ModelAndView();
		mav.setViewName("pos/posUserGrade");
		mav.addObject("userInfo",userInfo);
		
		return mav;
	}*/
}
