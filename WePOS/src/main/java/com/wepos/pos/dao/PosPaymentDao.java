package com.wepos.pos.dao;

import java.util.List;

import com.wepos.common.dto.SumOrdersDetailDto;

public interface PosPaymentDao {
  public List<SumOrdersDetailDto> getPaymentInfoOfTable( String tableCode );
}
