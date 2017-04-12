package com.wepos.common.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.wepos.common.dto.BoardDto;
import com.wepos.common.dto.ReplyDto;

public class BoardDaoImpl extends SqlSessionDaoSupport implements BoardDao {

	public List<BoardDto> list(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return getSqlSession().selectList("selectList", map);
	}

	public int getRowCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("getRowCount", map);
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
	
	public BoardDto selectBoard(BoardDto boardDto) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("selectBoard", boardDto);
	}
	
	public void boardRewrite(BoardDto boardDto) {
		// TODO Auto-generated method stub
		getSqlSession().update("updateBoard", boardDto);
	}
	
	public void boardDelete(BoardDto boardDto) {
		// TODO Auto-generated method stub
		getSqlSession().delete("boardDelete", boardDto);
	}
	
	public void boardReplyDelete(int boardNumber) {
		getSqlSession().delete("boardReplyDelete", boardNumber);
	}
	
	
	
	
	public int getReplyCount(int boardNumber) {
		return getSqlSession().selectOne("getReplyCount", boardNumber);
	}
	
	public List<ReplyDto> replyList(int boardNumber) {
		return getSqlSession().selectList("selectReplyList", boardNumber);
	}
	
	public void insertReply(ReplyDto replyDto) {
		getSqlSession().insert("insertReply", replyDto);
	}
	
	public void updateReply(int replyNumber) {
		getSqlSession().update("updateReply", replyNumber);
	}
	
}
