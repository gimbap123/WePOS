package com.wepos.pos.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.wepos.pos.dao.PosFunctionDao;

@Controller
public class PosFunctionController {

	@Autowired
	private PosFunctionDao posFunctionDao;

	@RequestMapping(value = "/pos/moveTable.do")
	public String moveTable(@RequestParam("shopCode") int shopCode, @RequestParam("fromTableCode") int fromTableCode,
			@RequestParam("toTableCode") int toTableCode, HttpSession session) 
	{
		Map<String, Integer> shopInfo = new HashMap<String, Integer>();
		shopInfo.put("shopCode", shopCode);
		shopInfo.put("fromTableCode", fromTableCode);
		shopInfo.put("toTableCode", toTableCode);

		posFunctionDao.moveTable(shopInfo);
		return "redirect:posMain.do?mgrId=" + session.getAttribute("id");
	}

	@RequestMapping(value = "/pos/getMovableTableList.do")
	public ModelAndView getMovableTableList(@RequestParam("shopCode") int shopCode, HttpServletResponse response) 
	{
		List<Integer> movableTableCode = posFunctionDao.getMovableTableList(shopCode);

		Gson gson = new Gson();
		String jsonData = null;

		if (movableTableCode != null) {
			jsonData = gson.toJson(movableTableCode);
		}
		try {
			response.getWriter().print(jsonData);
		} catch (IOException e) {
			e.printStackTrace();
		}

		ModelAndView mav = new ModelAndView("pos/posMove");
		mav.addObject("movableTableCode", movableTableCode);
		return mav;
	}
}