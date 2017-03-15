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
public class RegistrationController {
	@Autowired
	private CommonDao commonDao;
	
	@RequestMapping(value="/common/registration.do",method=RequestMethod.GET)
	public String mainView()
	{
		return "common/registration";
	}
	
	@RequestMapping(value="/common/registration.do",method=RequestMethod.POST)
	public ModelAndView registration(@ModelAttribute("users") UsersDto users){
		ModelAndView mav=new ModelAndView();
		commonDao.registration(users);
		mav.setViewName("main");
		return mav;
	}
}









