package com.wepos.pos.dao;

import java.util.List;
import java.util.Map;

public interface PosFunctionDao {

  // 이동 가능한 테이블 번호 select
  List<Integer> getMovableTableList( int shopCode );
  
  // 테이블 이동
  int moveTable( Map<String, Integer> shopInfo );
}
