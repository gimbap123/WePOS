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
public class BoardDeleteController {

	@Autowired
	private BoardDao boardDao;
	
	@RequestMapping(value="/common/boardDelete.do", method=RequestMethod.GET)
	public ModelAndView boardDelete(@RequestParam int boardNumber){
		System.out.println("GET방식의 boardNumber="+boardNumber);
		return new ModelAndView("common/boardDelete", "boardNumber", boardNumber);
	}
	
	@RequestMapping(value="/common/boardDelete.do", method=RequestMethod.POST)
	public String boardDeleteProc(@RequestParam("boardNumber") int boardNumber){
						
		//BoardDto boardDto=new BoardDto();
		
		System.out.println("POST방식의 boardNumber="+boardNumber);
		
		//System.out.println("boardDto의 getBoardNumber()="+boardDto.getBoardContent());
		
		boardDao.boardDelete(boardNumber);		
		
		return "redirect:/common/showBoard.do";
	}
	
}
