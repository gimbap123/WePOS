package com.wepos.common.controller;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wepos.common.dao.BoardDao;
import com.wepos.common.dto.BoardDto;
import com.wepos.common.util.FileUtil;

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
		/*int numNumber=boardDao.getNumber()+1;
		boardDto.setBoardNumber(numNumber);*/
		
		System.out.println("Number="+boardDto.getBoardNumber()+", totalId="+boardDto.getTotalId()+", title="+boardDto.getBoardTitle());
		System.out.println("getNumber="+boardDto.getBoardNumber());
		
		
		//파일 첨부 유무를 따져야 합니다
				try{
					String newName=""; //변경할 파일 이름을 저장하려고
					//업로드된 파일이 존재한다면
					if(!boardDto.getUpload().isEmpty()){ //!를 주어서 isEmpty를 부정
						newName=FileUtil.rename(boardDto.getUpload().getOriginalFilename());
						System.out.println("원본파일명="+boardDto.getUpload().getOriginalFilename());
						
						//DTO의 객체 filename => 변경된 파일명 => 실제로 DB상의 filename
						System.out.println("newName="+newName);
						boardDto.setBoardFile(newName);
					}
					//DB저장
					boardDao.boardInsert(boardDto); //입력받은값+게시물번호, 파일변경
					//실제 업로드 기능 => 업로드된 변경된 파일 => 지정한 업로드 위치로 이동시키기(복사해서!)
					if(!boardDto.getUpload().isEmpty()){
						File file=new File(FileUtil.UPLOAD_PATH+"/"+newName);
						//전송시켜라!
						boardDto.getUpload().transferTo(file); //~transferTo(전송할객체명)
					}
						
				}catch(IOException e){ //시큐어 코딩 방식
					e.printStackTrace();
				}catch(Exception e){
					e.printStackTrace();
				}

		
		//boardDao.boardInsert(boardDto); //입력받은값+게시물번호, 파일변경
				
				
		//글 목록으로 이동
		return "redirect:/common/showBoard.do";
		
	}
	
}
