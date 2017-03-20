package com.wepos.common.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.wepos.common.dao.BoardDao;
import com.wepos.common.dto.BoardDto;

@Controller
public class BoardRewriteController {

	@Autowired
	private BoardDao boardDao;
	
	@RequestMapping(value="/common/boardRewrite.do", method=RequestMethod.GET)
	public ModelAndView updateReady(@RequestParam("boardNumber") int boardNumber){
			BoardDto boardDto=boardDao.selectBoard(boardNumber);
		return new ModelAndView("/common/boardRewrite", "boardDto", boardDto);		
	}
	
	@RequestMapping(value="/common/boardRewrite.do", method=RequestMethod.POST)
	public String updateProc(@ModelAttribute BoardDto boardDto){
		
		System.out.println("boardDto.getBoardNumber()="+boardDto.getBoardNumber());

		//boardDto=boardDao.selectBoard(boardDto.getBoardNumber());
				
		boardDao.boardRewrite(boardDto);		
		
		return "redirect:/common/showBoard.do";
	}
	
	
	
}
