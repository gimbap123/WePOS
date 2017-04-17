package com.wepos.common.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wepos.common.dao.ReservationDao;
import com.wepos.common.dto.BusinessHoursDto;
import com.wepos.common.dto.ReservationDto;

@Controller
public class ReservationController {
	
	private Logger log = Logger.getLogger(this.getClass());

	@Autowired
	private ReservationDao reservationDao;
		
	@RequestMapping(value="/common/reservation.do", method=RequestMethod.POST)
	public String reservationProcess(@ModelAttribute ReservationDto reservationDto, @ModelAttribute BusinessHoursDto businessHoursDto) throws ParseException
	{
		System.out.println("userId="+reservationDto.getUserId());
		System.out.println("shopCode="+reservationDto.getShopCode());
		System.out.println("resPersons="+reservationDto.getResPersons());
		System.out.println("resDate="+reservationDto.getResDate());
		
		String resDate = reservationDto.getResDate() + " " + businessHoursDto.getStartHour() + ":" + businessHoursDto.getStartMinute() + businessHoursDto.getStartHourType();
		//String resDate = businessHoursDto.getStartHour() + ":" + businessHoursDto.getStartMinute() + businessHoursDto.getStartHourType();
		reservationDto.setResFinalDate(resDate);
		System.out.println("resFinalDate="+reservationDto.getResFinalDate());
		
		
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm a");
		cal.setTime(formatter.parse(resDate));
		System.out.println("cal.getTime="+cal.getTime());

		
		
		
		reservationDao.insertRes(reservationDto);
		return "redirect:/common/shopDetail.do?shopCode="+reservationDto.getShopCode();
	}
	
}
