package com.wepos.common.controller;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.wepos.common.dao.BoardDao;
import com.wepos.common.dto.BoardDto;
import com.wepos.common.util.PagingUtil;

@Controller
public class ShowBoardController {

		@Autowired
		private BoardDao boardDao;
		
		@RequestMapping("/common/showBoard.do")
		public ModelAndView showBoard(@RequestParam(value="pageNum", defaultValue="1") int currentPage){ 
						
			
			//총글의 갯수 또는 검색된 글의 갯수(총 레코드 수)
			int count = boardDao.getRowCount();
		    
			//PagingUtil page = new PagingUtil(currentPage, count, 10,10, "list.do");
			PagingUtil page = new PagingUtil(currentPage, count, 3,3, "list.do");
			
			
			List<BoardDto> list = null;
			if(count > 0){
				System.out.println("여기는 DAO 호출");
				list = boardDao.list();
			}else{
				list = Collections.emptyList();
			}
			System.out.println("ShowBoardController클래스의 count="+count);
			
			
			ModelAndView  mav = new ModelAndView();
			mav.setViewName("/common/showBoard"); //boardList.jsp 페이지로 이동하라
			mav.addObject("count", count); //총 레코드 수
			mav.addObject("list", list); //화면에 출력할 데이터
			mav.addObject("pagingHtml", page.getPagingHtml()); //링크 문자열 
			
			return mav;
	}
	
}
