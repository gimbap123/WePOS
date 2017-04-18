package com.wepos.pos.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.wepos.common.dto.SumOrdersDetailDto;
import com.wepos.pos.dao.PosPaymentDao;

@Controller
public class PosPaymentController {

  @Autowired
  private PosPaymentDao posPaymentDao;
  
  @RequestMapping(value = "/pos/posPayment.do", method=RequestMethod.GET, produces="text/json;charset=UTF8")
  public void paymentAjax( 
    @RequestParam("tableCode") String tableCode, HttpServletResponse response ) {
    response.setContentType( "text/html;charset=UTF-8" );
    
    Gson gson = new Gson();
    String paymentJson = null;
   
    List<SumOrdersDetailDto> oddList = posPaymentDao.getPaymentInfoOfTable( tableCode );
    
    if( oddList != null ) {
      paymentJson = gson.toJson( oddList );
      System.out.println( paymentJson );
    }
    try {
      response.getWriter().print( paymentJson );
    }
    catch( IOException e ) {
      e.printStackTrace();
    }
  }
}
