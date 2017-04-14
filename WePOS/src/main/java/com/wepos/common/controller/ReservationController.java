package com.wepos.common.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.wepos.common.dao.ReservationDao;
import com.wepos.common.dto.ReservationDto;

@Controller
public class ReservationController {

	@Autowired
	private ReservationDao reservationDao;
		
	@RequestMapping(value="/common/reservation.do", method=RequestMethod.POST)
	public String reservationProcess(@ModelAttribute ReservationDto reservationDto, @RequestParam("userId") String userId)
	{
		System.out.println("★userId="+userId);
		//ReservationDto reservationDto = new ReservationDto(); ★여기서 시간을 받는 DTO를 만들어야 하는가?
		
		//String resDate = businessHours.getStartHour() + ":" + businessHours.getStartMinute() + businessHours.getStartHourType();
		//reservationDto.setResDate(resDate);
		
		reservationDao.insertRes(reservationDto);
		return "redirect:/common/shopDetail.do";
	}
	
}
