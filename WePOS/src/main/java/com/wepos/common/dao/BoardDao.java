package com.wepos.common.dao;

import java.util.List;
import java.util.Map;

import com.wepos.common.dto.BoardDto;

public interface BoardDao {

	//글 목록보기
	public List<BoardDto> list();
	
	//총 레코드 수 구하기
	public int getRowCount();	
	
	//글쓰기
	public void boardInsert(BoardDto boardDto);
	
	//게시물 번호의 최대값
	public int getNumber();
	
	//조회수 증가
	public void plusReadCnt(int boardNumber);
	
	//글 상세보기
	public BoardDto selectBoard(int boardNumber);
	
	//글 수정하기
	public void boardRewrite(BoardDto boardDto);
	
}