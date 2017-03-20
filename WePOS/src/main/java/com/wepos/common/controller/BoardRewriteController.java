package com.wepos.common.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.wepos.common.dao.BoardDao;
import com.wepos.common.dto.BoardDto;

@Controller
public class BoardRewriteController {

	@Autowired
	private BoardDao boardDao;
	
	@RequestMapping("/common/boardRewrite.do")
	public ModelAndView detail(@RequestParam("boardNumber") int boardNumber){
		
		//수정하기
		
		return null;
			
	}
	
}
