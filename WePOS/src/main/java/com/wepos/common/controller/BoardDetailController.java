package com.wepos.common.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.wepos.common.dao.BoardDao;
import com.wepos.common.dto.BoardDto;

@Controller
public class BoardDetailController {

	@Autowired
	private BoardDao boardDao;
	
	@RequestMapping("/common/boardDetail.do")
	public ModelAndView detail(@RequestParam("boardNumber") int boardNumber){
		
    	//조회수를 증가시킵니다
    	boardDao.plusReadCnt(boardNumber);
    	
    	//1.위 seq값에 해당하는 값만 출력합니다
    	BoardDto boardDto=boardDao.selectBoard(boardNumber);
    	
    	// 1)이동할 페이지명 2)키명(모델 키명) 3)모델 Value명
    	return new ModelAndView("/common/boardDetail", "boardDto", boardDto);
		
	}
	
}
