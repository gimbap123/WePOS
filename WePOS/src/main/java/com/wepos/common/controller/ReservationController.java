package com.wepos.common.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.wepos.common.dao.ReservationDao;
import com.wepos.common.dto.BusinessHoursDto;
import com.wepos.common.dto.ReservationDto;
import com.wepos.common.dto.ShopDto;

@Controller
public class ReservationController {
	
	private Logger log = Logger.getLogger(this.getClass());
		
	@Autowired
	private ReservationDao reservationDao;
		
	//예약 진행
	@RequestMapping(value="/common/reservation.do", method=RequestMethod.POST)
	public String reservationProcess(@ModelAttribute ReservationDto reservationDto, @ModelAttribute BusinessHoursDto businessHoursDto)
	{
		String resDate = reservationDto.getResDate() + " " + businessHoursDto.getStartHour() + ":" + businessHoursDto.getStartMinute() + " " + businessHoursDto.getStartHourType();
		reservationDto.setResFinalDate(resDate);

		reservationDao.insertRes(reservationDto);
		return "redirect:/common/shopDetail.do?userId="+reservationDto.getUserId()+"&shopCode="+reservationDto.getShopCode();
	}
	
	//예약 확인
	@RequestMapping(value="/common/reservationCheck.do", method=RequestMethod.GET)
	public ModelAndView reservationCheck(@ModelAttribute ReservationDto reservationDto, @ModelAttribute BusinessHoursDto businessHoursDto,
			@ModelAttribute ShopDto shopDto, @RequestParam("userId") String userId)
	{
		ReservationDto reservationCheckDto = reservationDao.selectReservation(reservationDto);
		
		if(reservationCheckDto == null)
		{
			ModelAndView mav=new ModelAndView();
	    	mav.setViewName("/common/reservationEmpty");
	    	
			return mav;
		}
		else
		{
		
		String resDate = reservationCheckDto.getResDate();

		reservationCheckDto.setResDate(resDate.substring(0, 10));
		businessHoursDto.setStartHourType(resDate.substring(17));
		businessHoursDto.setStartHour(resDate.substring(11, 13));
		businessHoursDto.setStartMinute(resDate.substring(14, 16));
		
		String HoursType = businessHoursDto.getStartHourType();
		String Hours = businessHoursDto.getStartHour();
		String Minute = businessHoursDto.getStartMinute();
		
		reservationDto.setReseNumber(reservationCheckDto.getReseNumber());
		ShopDto ShopNameDto = reservationDao.selectShopName(reservationDto);
		
		String resState = reservationCheckDto.getResState();
		if(resState.equals("0"))	{	resState = "예약 대기";	}
		if(resState.equals("1"))	{	resState = "예약 완료";	}
		if(resState.equals("2"))	{	resState = "예약 취소";	}
			
		ModelAndView mav=new ModelAndView();
    	mav.addObject("reservationCheckDto",reservationCheckDto);
    	mav.addObject("ShopNameDto", ShopNameDto);
    	mav.addObject("HoursType", HoursType);
    	mav.addObject("Hours", Hours);
    	mav.addObject("Minute", Minute);
    	mav.addObject("resState", resState);
    	mav.setViewName("/common/reservationCheck");
    	
		return mav;
		}
	}

	//수정 진행
	@RequestMapping(value="/common/reservationCheck.do", method=RequestMethod.POST)
	public String updateReservationProcess(@ModelAttribute ReservationDto reservationDto, @ModelAttribute BusinessHoursDto businessHoursDto)
	{
		String resDate = reservationDto.getResDate() + " " + businessHoursDto.getStartHour() + ":" + businessHoursDto.getStartMinute() + " " + businessHoursDto.getStartHourType();
		reservationDto.setResFinalDate(resDate);
			
		reservationDao.updateRes(reservationDto);
		return "redirect:/common/shopDetail.do?userId="+reservationDto.getUserId()+"&shopCode="+reservationDto.getShopCode();
	}
	
	//삭제 진행
	@RequestMapping(value="/common/reservationDelete.do", method=RequestMethod.GET)
	public String deleteReservationProcess(@ModelAttribute ReservationDto reservationDto,
			@RequestParam("userId") String userId, @RequestParam("shopCode") int shopCode, @RequestParam("reseNumber") int reseNumber,
			@RequestParam("resState") String resState)
	{
		reservationDao.deleteRes(reseNumber);	
		
		return "redirect:/common/shopDetail.do?userId="+reservationDto.getUserId()+"&shopCode="+reservationDto.getShopCode();
	}
	
	//지난 예약 확인
	@RequestMapping(value="/common/reservationControl.do", method=RequestMethod.GET)
	public ModelAndView deleteReservationProcess(@ModelAttribute ReservationDto reservationDto,
			@RequestParam("userId") String userId)
	{
		int selectPastResCount = reservationDao.selectPastResCount(reservationDto);
		List<ReservationDto> reservationControlAllList = null;
		List<ReservationDto> reservationControlOneList = null;
		List<ReservationDto> reservationControlTwoList = null;
		
		ShopDto shopDto = new ShopDto();
		List<ShopDto> shopNameList = null;
		shopNameList = reservationDao.selectResAllShopName(reservationDto);
		
		reservationControlAllList = reservationDao.selectReservationAll(reservationDto);
		reservationControlOneList = reservationDao.selectReservationOne(reservationDto);
		reservationControlTwoList = reservationDao.selectReservationTwo(reservationDto);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/common/reservationControl");
		mav.addObject("reservationControlAllList", reservationControlAllList);  
		mav.addObject("reservationControlOneList", reservationControlOneList);  
		mav.addObject("reservationControlTwoList", reservationControlTwoList);  
		mav.addObject("selectPastResCount", selectPastResCount);  
		mav.addObject("shopNameList", shopNameList);  
		
		return mav;
		//return "redirect:/common/shopDetail.do?userId="+reservationDto.getUserId()+"&shopCode="+reservationDto.getShopCode();
	}
	
}
