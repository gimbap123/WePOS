package com.wepos.pos.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.wepos.common.dto.ReservationDto;
import com.wepos.common.dto.ShopDto;
import com.wepos.pos.dao.PosMainDao;
import com.wepos.pos.dao.PosReservationDao;
import com.wepos.pos.dto.PosLogDto;

@Controller
public class PosReservationContoroller {

	@Autowired
	private PosReservationDao posReservationDao;

	@Autowired
	private PosMainDao posMainDao;

	// 예약 관리 메인 페이지로 이동
	@RequestMapping("/pos/posReservation.do")
	public ModelAndView showPosReservation(@RequestParam("mgrId") String mgrId,
			@RequestParam("shopCode") int shopCode)
	{
		// 매장 코드 번호로 매장 정보 Select
		ShopDto shop = posMainDao.getShop(shopCode);

		int countStateZero = posReservationDao.selectStateZero(shopCode);

		int countPosRes = posReservationDao.countPosRes(shopCode);

		List<ReservationDto> resList = posReservationDao.selectResList(shopCode);

		ModelAndView mav = new ModelAndView("pos/posReservation");
		mav.addObject("resList", resList);
		mav.addObject("countPosRes", countPosRes);
		mav.addObject("countStateZero", countStateZero);
		mav.addObject("shop", shop);
		return mav;
	}

	// 예약 상태 변경
	@RequestMapping("/pos/updateReservationState.do")
	public String updateReservationState(@ModelAttribute ReservationDto reservationDto,
			@RequestParam("shopCode") int shopCode, @RequestParam("reseNumber") int reseNumber,
			@RequestParam("resState") String resState, @RequestParam("userId") String userId,
			@RequestParam("mgrId") String mgrId) 
	{
		posReservationDao.updateState(reservationDto);

		return "redirect:posReservation.do?mgrId=" + mgrId + "&shopCode=" + shopCode;
	}

	// 예약 상태로 검색
	@RequestMapping(value = "/pos/searchState.do", method = RequestMethod.POST)
	public ModelAndView searchState(@RequestParam("mgrId") String mgrId, @RequestParam("searchType") int searchType,
			@ModelAttribute PosLogDto posLogDto, @RequestParam("shopCodes") int shopCode,
			@ModelAttribute ReservationDto reservationDto) 
	{
		ShopDto shop = posMainDao.getShop(shopCode);
		String calendarBegin = posLogDto.getCalendarBegin().toString();
		String calendarEnd = posLogDto.getCalendarEnd().toString();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchType", searchType);
		map.put("shopCode", shopCode);
		map.put("calendarBegin", calendarBegin);
		map.put("calendarEnd", calendarEnd);

		List<ReservationDto> stateList = posReservationDao.selectStateList(map);

		int stateListSize = posReservationDao.selectCountState(map);

		ModelAndView mav = new ModelAndView("pos/posReservation");
		mav.addObject("stateList", stateList);
		mav.addObject("stateListSize", stateListSize);
		mav.addObject("shop", shop);
		return mav;
	}

}
