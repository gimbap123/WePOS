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

}
