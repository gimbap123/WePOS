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
	
	@RequestMapping(value="/common/reservation.do")
	public String reservationOnload(@RequestParam("userId") String userId){
		System.out.println("야 나 호출된다");
		return null;
	}
	
	@RequestMapping(value="/common/reservation.do", method=RequestMethod.POST)
	public String reservationProcess(@ModelAttribute ReservationDto reservationDto, @RequestParam("userId") String userId){
		System.out.println("reservationDto.getResDate()"+reservationDto.getResDate());
		System.out.println("reservationDto.getResDesc()"+reservationDto.getResDesc());
		System.out.println("reservationDto.getReseNumber()"+reservationDto.getReseNumber());
		System.out.println("reservationDto.getResPersons()"+reservationDto.getResPersons());
		System.out.println("reservationDto.getResState()"+reservationDto.getResState());
		System.out.println("reservationDto.getShopCode()"+reservationDto.getShopCode());
		System.out.println("reservationDto.getUserId()"+reservationDto.getUserId());
		System.out.println("=================[경계선]=================");
		
		
		
		return null;
	}
	
}
