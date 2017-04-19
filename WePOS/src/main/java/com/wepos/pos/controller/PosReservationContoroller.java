package com.wepos.pos.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.wepos.common.dto.ReservationDto;
import com.wepos.pos.dao.PosReservationDao;

@Controller
public class PosReservationContoroller {
	
	@Autowired
	private PosReservationDao posReservationDao;

	// 예약 관리 메인 페이지로 이동
	@RequestMapping("/pos/posReservation.do")
	public ModelAndView showPosReservation(@RequestParam("mgrId") String mgrId, @RequestParam("shopCode") int shopCode)
	{
		ReservationDto reservationDto = new ReservationDto();
		
		int countStateZero = posReservationDao.selectStateZero(shopCode);
		
		int countPosRes = posReservationDao.countPosRes(shopCode);
		
		List<ReservationDto> resList = posReservationDao.selectResList(shopCode);
		
		ModelAndView mav = new ModelAndView("pos/posReservation");
		mav.addObject("resList", resList);
		mav.addObject("countPosRes", countPosRes);
		mav.addObject("countStateZero", countStateZero);
		return mav;
	}
	
	// 예약 상태 변경
	@RequestMapping("/pos/updateReservationState.do")
	public String updateReservationState(@ModelAttribute ReservationDto reservationDto,
			@RequestParam("shopCode") int shopCode, @RequestParam("reseNumber") int reseNumber,
			@RequestParam("resState") String resState, @RequestParam("userId") String userId, @RequestParam("mgrId") String mgrId)
	{
		posReservationDao.updateState(reservationDto);
		
		return "redirect:posReservation.do?mgrId="+mgrId+"&shopCode="+shopCode;
	}
	
}






