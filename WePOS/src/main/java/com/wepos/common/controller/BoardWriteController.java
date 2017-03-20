package com.wepos.common.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.wepos.common.dao.BoardDao;
import com.wepos.common.dto.BoardDto;

@Controller
public class BoardWriteController {
	
	@Autowired
	private BoardDao boardDao;

	@RequestMapping(value="/common/boardWrite.do", method=RequestMethod.GET) 
	public String write() {
		System.out.println("boardWrite.do GET방식 호출됨");
		return "/common/boardWrite";
	}
	
	@RequestMapping(value="/common/boardWrite.do", method=RequestMethod.POST)
	public String mainView(@ModelAttribute BoardDto boardDto) {
	
		//게시물번호
		int numNumber=boardDao.getNumber()+1;
		boardDto.setBoardNumber(numNumber);
		
		System.out.println("Number="+boardDto.getBoardNumber()+", totalId="+boardDto.getTotalId()+", title="+boardDto.getBoardTitle());
		
		System.out.println("getNumber="+boardDto.getBoardNumber());
		
		boardDao.boardInsert(boardDto); //입력받은값+게시물번호, 파일변경
				
		//글 목록으로 이동
		return "redirect:/common/showBoard.do";
		
	}
	
}
