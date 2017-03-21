package com.wepos.common.controller;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.wepos.common.dao.BoardDao;
import com.wepos.common.dto.BoardDto;
import com.wepos.common.util.FileUtil;

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
	
	
	//파일 다운로드
    @RequestMapping("/common/file.do")
    public ModelAndView download(@RequestParam("boardFile") String boardFile) {
    	File downloadFile=new File(FileUtil.UPLOAD_PATH+"/"+boardFile);
    	//기존의 방식은 ModelAndView("이동할페이지명(View객체명)", "키명", Value(저장할값)값);
    	// =>Model(키, 저장할값) =>request.setAttribute(키, 저장할값)
    	return new ModelAndView("downloadView", "downloadFile", downloadFile);
    }
	
	
}
