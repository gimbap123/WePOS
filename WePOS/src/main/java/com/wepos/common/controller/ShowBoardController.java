package com.wepos.common.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
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
	
		private Logger log = Logger.getLogger(this.getClass());

		@Autowired
		private BoardDao boardDao;
		
		@RequestMapping("/common/showBoard.do")
		public ModelAndView showBoard(@RequestParam(value="pageNum", defaultValue="1") int currentPage,
				@RequestParam(value="keyField", defaultValue="") String keyField,
				@RequestParam(value="keyWord", defaultValue="") String keyWord){ 
						
			if(log.isDebugEnabled()){
				System.out.println("ListController의 list.do");
				log.debug("currentPage : " + currentPage);
				log.debug("keyField : " + keyField);
				log.debug("keyWord : " + keyWord);
			}			
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("keyField", keyField); //검색분야
			map.put("keyWord", keyWord); //검색어
			
			//총글의 갯수 또는 검색된 글의 갯수(총 레코드 수)
			int count = boardDao.getRowCount(map);
		    
			//PagingUtil page = new PagingUtil(currentPage, count, 10,10, "list.do");
			PagingUtil page = new PagingUtil(currentPage, count, 3, 3, "showBoard.do");
			
			map.put("start", page.getStartCount());
			map.put("end", page.getEndCount());
			
			List<BoardDto> list = null;
			if(count > 0){
				System.out.println("여기는 DAO 호출");
		
				System.out.println("start="+page.getStartCount());
				System.out.println("end="+page.getEndCount());
				
				list = boardDao.list(map);
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
