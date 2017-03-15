package com.wepos.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RegistrationController {
	
	@RequestMapping("/common/registration.do")
	public String mainView()
	{
		return "common/registration";
	}
}
