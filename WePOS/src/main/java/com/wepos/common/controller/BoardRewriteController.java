package com.wepos.common.controller;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.wepos.common.dao.BoardDao;
import com.wepos.common.dto.BoardDto;
import com.wepos.common.util.FileUtil;

@Controller
public class BoardRewriteController {

	@Autowired
	private BoardDao boardDao;
	
	@RequestMapping(value="/common/boardRewrite.do", method=RequestMethod.GET)
	public ModelAndView updateReady(@RequestParam("boardNumber") int boardNumber){
			BoardDto boardDto=boardDao.selectBoard(boardNumber);
			
			if(boardDto.getTotalId()==null){
				
			}
			
		return new ModelAndView("/common/boardRewrite", "boardDto", boardDto);		
	}
	
	@RequestMapping(value="/common/boardRewrite.do", method=RequestMethod.POST)
	public String updateProc(@ModelAttribute BoardDto boardDto){
		
		System.out.println("boardDto.getBoardNumber()="+boardDto.getBoardNumber());

		//boardDto=boardDao.selectBoard(boardDto.getBoardNumber());
		
		
		
		
		//업로드가 되어있지 않다면 상관이 없는데 만약 업로드가 되어있는 기존 파일을 수정하고 싶다면..
				// ==>새로 업로드 할 파일을 업로드할 때 새로운 파일명으로 변경합니다
				BoardDto board=null;
				String oldFileName=""; //기존 파일명을 저장할 변수
				//수정하기 전의 상태의 레코드를 먼저 불러옵니다
				board=boardDao.selectBoard(boardDto.getBoardNumber());
/*				
				//DB상의 암호==웹상의 암호 => !를 사용하여 같지 않다면
				if(!board.getPwd().equals(command.getPwd())){
					//에러메세지를 웹 상에 출력합니다
					result.rejectValue("pwd", "invalidPassword"); //validation.properties 키값과 동일해야함
					return "boardModify"; //baordModify.jsp로 전환합니다 암호가 틀렸으니 다시 입력받고자
				}else{ //암호가 맞는 경우 =>기존파일 이름을 구해서 
							//=>업로드 파일이 존재하면 기존파일을 삭제하고 새로운 파일로 세팅합니다 =>DB저장
							//=>업로드 파일이 존재하지 않는다면 기존 파일을 그대로 덮어씁니다 =>DB까지
*/					
					oldFileName=board.getBoardFile();
					
					
					//업로드된 파일이 존재한다면
					if(!boardDto.getUpload().isEmpty()){ //!를 주어서 isEmpty를 부정
						System.out.println("원본파일명="+boardDto.getUpload().getOriginalFilename());
						try{
						//새로운 탐색기에서 새로 변경할 파일을 업로드하는 경우(메모리상)
							boardDto.setBoardFile(FileUtil.rename(boardDto.getUpload().getOriginalFilename()));
						}catch(Exception e){
							e.printStackTrace();
						}
					}else{ //업로드된 파일이 존재하지 않는다면
						boardDto.setBoardFile(oldFileName);
					}
					
					//실제로 DB상에 반영
					boardDao.boardRewrite(boardDto);
					
					//실제 업로드 기능 => 업로드된 변경된 파일 => 지정한 업로드 위치로 이동시키기(복사해서!)
					if(!boardDto.getUpload().isEmpty()){
						try{
						File file=new File(FileUtil.UPLOAD_PATH+"/"+boardDto.getBoardFile());
						//전송시켜라!
						boardDto.getUpload().transferTo(file); //~transferTo(전송할객체명)				
				}catch(IOException e){ //시큐어 코딩 방식
					e.printStackTrace();
				}catch(Exception e){
					e.printStackTrace();
				}

				//전의 파일을 삭제하고 난 후 이동할 예정
				if(oldFileName!=null){
					FileUtil.removeFile(oldFileName);
				}//if

				}//else
		
		
		
		
				
		//boardDao.boardRewrite(boardDto);		
		
		return "redirect:/common/showBoard.do";
	}
	
	
	
}
