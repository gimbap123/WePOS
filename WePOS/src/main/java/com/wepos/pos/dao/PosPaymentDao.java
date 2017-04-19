package com.wepos.pos.dao;

import java.util.List;
import java.util.Map;

import com.wepos.common.dto.SumOrdersDetailDto;

public interface PosPaymentDao {
  public List<SumOrdersDetailDto> getPaymentInfoOfTable( String tableCode );

  public int updatePaymentComplete( Map<String, Integer> paymentInfo );
}
