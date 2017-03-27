package com.wepos.pos.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PosMainController {

  // 포스 페이지로 이동
  @RequestMapping( value = "/pos/posMain.do" )
  public ModelAndView posProc() {
    ModelAndView mav = new ModelAndView( "pos/posMain" );
    return mav;
  }
}
