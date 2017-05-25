package com.wepos.pos.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.wepos.common.dto.SumOrdersDetailDto;
import com.wepos.common.dto.UsersDto;

public class PosPaymentDaoImpl extends SqlSessionDaoSupport implements PosPaymentDao {

  public List<SumOrdersDetailDto> getPaymentInfoOfTable( String tableCode ) {
    // TODO Auto-generated method stub
    return getSqlSession().selectList( "getPaymentInfoOfTable", tableCode );
  }

  public int updatePaymentComplete( Map<String, Integer> paymentInfo ) {
    // TODO Auto-generated method stub
    return getSqlSession().update( "updatePaymentComplete", paymentInfo );
  }

  public void updateTableStatusToUnused( int tableCode ) {
    getSqlSession().update( "updateTableStatusToUnused", tableCode );
    // TODO Auto-generated method stub
  }
  
  public List<UsersDto> getUserGradeInfo( String userPhone )  {
	 return getSqlSession().selectList( "getUserGradeInfo", userPhone );
  }
  
  public int updateUsersExpense(UsersDto usersDto){
	  return getSqlSession().update("updateUsersExpense",usersDto);
  }
}
