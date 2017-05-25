package com.wepos.pos.dao;

import java.util.List;
import java.util.Map;

import com.wepos.common.dto.SumOrdersDetailDto;
import com.wepos.common.dto.UsersDto;

public interface PosPaymentDao {
  public List<SumOrdersDetailDto> getPaymentInfoOfTable( String tableCode );

  public int updatePaymentComplete( Map<String, Integer> paymentInfo );

  public void updateTableStatusToUnused( int tableCode );
  
  public List<UsersDto> getUserGradeInfo( String userPhone );
  
  public int updateUsersExpense(UsersDto usersDto);
}
