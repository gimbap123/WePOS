package com.wepos.common.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.wepos.common.dao.CommonDao;
import com.wepos.common.dto.UsersDto;

@Controller
public class CommonController {
	
	@Autowired
	private CommonDao commonDao;
	
	// 메인 페이지로 이동
	@RequestMapping("/common/main.do")
	public String mainView()
	{
		return "common/main";
	}
	
	// 아이디 찾기 페이지로 이동	
	@RequestMapping(value="/common/findId.do", method=RequestMethod.GET)
	public String findIdView()
	{
		return "common/findId";
	}
	
	// 아이디 찾기 기능 수행
	@RequestMapping(value="/common/findId.do", method=RequestMethod.POST)
	public ModelAndView findIdProcess(@ModelAttribute UsersDto user)
	{
		String userName = commonDao.findId(user);
		System.out.println("userName : " + userName);
		return new ModelAndView("common/findId", "userName", userName);
	}
}
