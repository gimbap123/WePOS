package com.wepos.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
	
	@RequestMapping("/common/login.do")
	public String mainView()
	{
		return "common/login";
	}
}
