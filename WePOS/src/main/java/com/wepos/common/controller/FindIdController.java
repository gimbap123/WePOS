package com.wepos.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FindIdController {
	
	@RequestMapping("/common/findId.do")
	public String mainView()
	{
		return "common/findId";
	}
}
