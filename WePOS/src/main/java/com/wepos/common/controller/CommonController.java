package com.wepos.common.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.wepos.common.dao.CommonDao;
import com.wepos.common.dto.UsersDto;

@Controller
public class CommonController {
	
	@Autowired
	private CommonDao commonDao;
	
	// 메인 페이지로 이동-----------------------------------------------------------------------------------------
	@RequestMapping("/common/main.do")
	public String mainView()
	{
		return "common/main";
	}
	
	// 회원가입 ------------------------------------------------------------------------------------------------
	@RequestMapping(value="/common/registration.do",method=RequestMethod.GET)
	public String registrationView()
	{
		return "common/registration";
	}
	
	@RequestMapping(value="/common/registration.do",method=RequestMethod.POST)
	public ModelAndView registrationProcess(@ModelAttribute UsersDto users){
		ModelAndView mav=new ModelAndView();
		int result=commonDao.registration(users);
		System.out.println("result = "+result);
		mav.addObject("result", result);
		
		if(result==1){			
			mav.setViewName("common/login");
		}
			
		if(result==0){
			mav.setViewName("common/main");
		}		
		return mav;
	}
	// 아이디 중복검사
	@RequestMapping(value="/common/checkId.do", method=RequestMethod.POST)
	//public ModelAndView checkIdProcess(@RequestParam("userId") UsersDto id)
	public ModelAndView checkIdProcess(@ModelAttribute UsersDto id)
	{
		ModelAndView mav=new ModelAndView();
		String res = commonDao.checkId(id);
		//System.out.println("중복여부 : " + res);
		String result="";
		
		if(res!=null)
			result="이미 등록된 아이디입니다.";
		else
			result="사용 가능한 아이디입니다.";
		//mav.addObject("res",res.trim());
		mav.addObject("result",result.trim());
		mav.setViewName("common/checkId");
			
		return mav;
	}
	
	// 아이디 찾기 페이지로 이동	----------------------------------------------------------------------------------
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
	
	// 로그인 ---------------------------------------------------------------------------------------------------------
	@RequestMapping(value="/common/login.do", method=RequestMethod.GET)
	public String loginView()
	{
		return "common/login";
	}
	
	

}








