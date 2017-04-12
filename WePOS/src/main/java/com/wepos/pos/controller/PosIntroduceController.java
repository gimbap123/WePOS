package com.wepos.pos.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PosIntroduceController {

	@RequestMapping("/pos/posIntroduce.do")
	public String showIntroduce(){
		return "pos/posIntroduce";
	}
	
}
