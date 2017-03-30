package com.wepos.common.controller;

import java.io.File;
import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
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
import com.wepos.common.util.PagingUtil;

@Controller
public class BoardController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private BoardDao boardDao;
	
	// 게시판 목록 페이지로 이용
	@RequestMapping("/common/showBoard.do")
	public ModelAndView showBoardView(@RequestParam(value="pageNum", defaultValue="1") int currentPage,
			@RequestParam(value="keyField", defaultValue="") String keyField, @RequestParam(value="keyWord", defaultValue="") String keyWord)
	{ 
		if(log.isDebugEnabled())
		{
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
		PagingUtil page = new PagingUtil(currentPage, count, 5, 5, "showBoard.do");
		
		map.put("start", page.getStartCount());
		map.put("end", page.getEndCount());
		
		List<BoardDto> list = null;
		if(count > 0)
		{			
			list = boardDao.list(map);
		}
		else
		{
			list = Collections.emptyList();
		}	
		
		ModelAndView  mav = new ModelAndView();
		mav.setViewName("/common/showBoard"); //boardList.jsp 페이지로 이동하라
		mav.addObject("count", count); //총 레코드 수
		mav.addObject("list", list); //화면에 출력할 데이터
		mav.addObject("pagingHtml", page.getPagingHtml()); //링크 문자열 
		
		return mav;
	}
	
	// 게시판 글쓰기 페이지로 이동
	@RequestMapping(value="/common/boardWrite.do", method=RequestMethod.GET) 
	public String boardWriteView() 
	{		
		return "/common/boardWrite";
	}
	
	// 글쓰기 기능 수행
	@RequestMapping(value="/common/boardWrite.do", method=RequestMethod.POST)
	public String boardWriteProcess(@ModelAttribute BoardDto boardDto) 
	{			
		//파일 첨부 유무를 따져야 합니다
		try
		{
			String newName=""; //변경할 파일 이름을 저장하려고
			//업로드된 파일이 존재한다면
			if(!boardDto.getUpload().isEmpty())  //!를 주어서 isEmpty를 부정
			{ 
				newName=FileUtil.rename(boardDto.getUpload().getOriginalFilename());				
				//DTO의 객체 filename => 변경된 파일명 => 실제로 DB상의 filename				
				boardDto.setBoardFile(newName);
				
				//실제 업로드 기능 => 업로드된 변경된 파일 => 지정한 업로드 위치로 이동시키기(복사해서!)
				File file=new File(FileUtil.UPLOAD_PATH+"/"+newName);
				//전송시켜라!
				boardDto.getUpload().transferTo(file); //~transferTo(전송할객체명)
			}
			//DB저장
			boardDao.boardInsert(boardDto); //입력받은값+게시물번호, 파일변경		
		}
		catch(IOException e)  //시큐어 코딩 방식
		{ 
			e.printStackTrace();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
					
		//글 목록으로 이동
		return "redirect:/common/showBoard.do";		
	}
	
	// 글 수정 페이지로 이동
	@RequestMapping(value="/common/boardRewrite.do", method=RequestMethod.GET)
	public ModelAndView boardRewriteView(@RequestParam("boardNumber") int boardNumber)
	{
		BoardDto boardDto=boardDao.selectBoard(boardNumber);
		return new ModelAndView("/common/boardRewrite", "boardDto", boardDto);		
	}
	
	// 글 수정 기능 수행
	@RequestMapping(value="/common/boardRewrite.do", method=RequestMethod.POST)
	public String boardRewriteProcess(@ModelAttribute BoardDto boardDto)
	{
		//업로드가 되어있지 않다면 상관이 없는데 만약 업로드가 되어있는 기존 파일을 수정하고 싶다면..
		// ==>새로 업로드 할 파일을 업로드할 때 새로운 파일명으로 변경합니다
		BoardDto board=null;
		String oldFileName=""; //기존 파일명을 저장할 변수
		//수정하기 전의 상태의 레코드를 먼저 불러옵니다
		board=boardDao.selectBoard(boardDto.getBoardNumber());
		
		oldFileName=board.getBoardFile();
					
		//업로드된 파일이 존재한다면
		if(!boardDto.getUpload().isEmpty())
		{ 
			System.out.println("원본파일명="+boardDto.getUpload().getOriginalFilename());
			try
			{
				//새로운 탐색기에서 새로 변경할 파일을 업로드하는 경우(메모리상)
				boardDto.setBoardFile(FileUtil.rename(boardDto.getUpload().getOriginalFilename()));
				
				//실제 업로드 기능 => 업로드된 변경된 파일 => 지정한 업로드 위치로 이동시키기(복사해서!)
				File file=new File(FileUtil.UPLOAD_PATH+"/"+boardDto.getBoardFile());
				//전송시켜라!
				boardDto.getUpload().transferTo(file); //~transferTo(전송할객체명)		
				
				//전의 파일을 삭제하고 난 후 이동할 예정
				if(oldFileName!=null)
				{
					FileUtil.removeFile(oldFileName);
				}
			}
			catch(IOException e)  //시큐어 코딩 방식
			{
				e.printStackTrace();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		else  //업로드된 파일이 존재하지 않는다면
		{
			boardDto.setBoardFile(oldFileName);
		}
		
		//실제로 DB상에 반영
		boardDao.boardRewrite(boardDto);
			
		return "redirect:/common/showBoard.do";
	}
	
	// 글 상세보기 페이지로 이동
	@RequestMapping("/common/boardDetail.do")
	public ModelAndView boardDetailView(@RequestParam("boardNumber") int boardNumber)
	{		
    	//조회수를 증가시킵니다
    	boardDao.plusReadCnt(boardNumber);
    	
    	//1.위 seq값에 해당하는 값만 출력합니다
    	BoardDto boardDto=boardDao.selectBoard(boardNumber);
    	
    	// 1)이동할 페이지명 2)키명(모델 키명) 3)모델 Value명
    	return new ModelAndView("/common/boardDetail", "boardDto", boardDto);		
	}
	
	// 파일 다운로드
    @RequestMapping("/common/file.do")
    public ModelAndView download(@RequestParam("boardFile") String boardFile)
    {
    	File downloadFile=new File(FileUtil.UPLOAD_PATH+"/"+boardFile);
    	//기존의 방식은 ModelAndView("이동할페이지명(View객체명)", "키명", Value(저장할값)값);
    	// =>Model(키, 저장할값) =>request.setAttribute(키, 저장할값)
    	return new ModelAndView("downloadView", "downloadFile", downloadFile);
    }
    
    // 글 삭제 페이지로 이동
    @RequestMapping(value="/common/boardDelete.do", method=RequestMethod.GET)
	public ModelAndView boardDelete(@RequestParam int boardNumber)
    {		
		return new ModelAndView("common/boardDelete", "boardNumber", boardNumber);
	}
    
    // 글 삭제 기능 수행
    @RequestMapping(value="/common/boardDelete.do", method=RequestMethod.POST)
	public String boardDeleteProc(@RequestParam("boardNumber") int boardNumber)
    {
		boardDao.boardDelete(boardNumber);		
		return "redirect:/common/showBoard.do";
	}
    
}
