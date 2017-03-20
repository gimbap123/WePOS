package com.wepos.common.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.wepos.common.dto.BoardDto;

public class BoardDaoImpl extends SqlSessionDaoSupport implements BoardDao {

	public List<BoardDto> list() {
		// TODO Auto-generated method stub
		return getSqlSession().selectList("selectList");
	}

	public int getRowCount() {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("selectOne");
	}
	
	public void boardInsert(BoardDto boardDto) {
		// TODO Auto-generated method stub
		getSqlSession().insert("boardInsert", boardDto);
	}
	
	public int getNumber() {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("getNumber");
	}

	public void plusReadCnt(int boardNumber) {
		// TODO Auto-generated method stub
		getSqlSession().update("plusReadCnt", boardNumber);
	}
	
	public BoardDto selectBoard(int boardNumber) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("selectBoard", boardNumber);
	}
	
	public void boardRewrite(BoardDto boardDto) {
		// TODO Auto-generated method stub
		getSqlSession().update("updateBoard", boardDto);
	}
	
}