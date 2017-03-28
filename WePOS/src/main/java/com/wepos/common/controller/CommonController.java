package com.wepos.common.controller;

import java.util.HashMap;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.wepos.common.dao.CommonDao;
import com.wepos.common.dto.UsersDto;
import com.wepos.common.util.MailSendUtil;
import com.wepos.common.util.RandomPasswordUtil;
import com.wepos.mgr.dto.MgrLoginDto;
import com.wepos.user.dto.UserLoginDto;

@Controller
public class CommonController {
	
	@Autowired
	private CommonDao commonDao;
	
	// 메인 페이지로 이동-----------------------------------------------------------------------------------------
	@RequestMapping("/common/main.do")
	public String mainView()
	{
		return "common/main";
	}
	
	// 회원가입 ------------------------------------------------------------------------------------------------
	@RequestMapping(value="/common/registration.do",method=RequestMethod.GET)
	public String registrationView()
	{
		return "common/registration";
	}
	
	@RequestMapping(value="/common/registration.do",method=RequestMethod.POST)
	public ModelAndView registrationProcess(@ModelAttribute UsersDto users){
		ModelAndView mav=new ModelAndView();
		int result=commonDao.registration(users);
		System.out.println("result = "+result);
		mav.addObject("result", result);
		
		if(result==1){			
			mav.setViewName("common/login");
		}
			
		if(result==0){
			mav.setViewName("common/main");
		}		
		return mav;
	}
	// 이용약관
	@RequestMapping("/common/terms.do")
	public String termsView()
	{
		return "common/terms";
	}
	// 아이디 중복검사
	@RequestMapping(value="/common/checkId.do", method=RequestMethod.POST)
	//public ModelAndView checkIdProcess(@RequestParam("userId") UsersDto id)
	public ModelAndView checkIdProcess(@RequestParam("userId") String id)
	{
		ModelAndView mav=new ModelAndView();
		int checkIdFromUsers = commonDao.checkIdFromUsers(id);
		int checkIdFromMgr = commonDao.checkIdFromMgr(id);
		int checkIdFromList=commonDao.checkIdFromDeletedId(id);
		System.out.println("checkIdFromUsers 중복여부 : " + checkIdFromUsers);
		System.out.println("checkIdFromMgr 중복여부 : " + checkIdFromMgr);
		System.out.println("checkIdFromList 중복여부 : " + checkIdFromList);
		String comment="";
		
		if(checkIdFromUsers==1 || checkIdFromMgr==1 || checkIdFromList==1)
			comment="이미 등록된 아이디입니다.";
		else if(checkIdFromUsers==0 || checkIdFromMgr==0 || checkIdFromList==0)
			comment="사용 가능한 아이디입니다.";
		
		mav.addObject("checkIdFromUsers",checkIdFromUsers);
		mav.addObject("checkIdFromMgr",checkIdFromMgr);
		mav.addObject("checkIdFromList",checkIdFromList);
		mav.addObject("comment",comment);
		mav.setViewName("common/checkId");
			
		return mav;
	}
	
	// 아이디 / 패스워드 찾기 페이지로 이동	
	@RequestMapping("/common/findIdPw.do")
	public String findIdView()
	{
		return "common/findIdPw";
	}
	
	// 아이디 찾기 기능 수행
	@RequestMapping("/common/findId.do")
	public ModelAndView findIdProcess(@ModelAttribute UsersDto user)
	{
		String userId = commonDao.findId(user);		
		return new ModelAndView("common/findIdResult", "userId", userId);
	}
	
	// 패스워드 찾기 기능 수행
	@RequestMapping("/common/findPw.do")
	public ModelAndView findPwProcess(@ModelAttribute UsersDto user) throws AddressException, MessagingException
	{
		int result = commonDao.findPw(user);
		
		if(result == 1)
		{
			String newPassword = new RandomPasswordUtil().getRandomPassword();
			user.setUserPassword(newPassword);
			commonDao.updatePw(user);
			MailSendUtil mailSendUtil = new MailSendUtil();
			mailSendUtil.mailSender(user);
		}
		
		return new ModelAndView("common/findPwResult", "result", result);
	}
	
	// 로그인 ---------------------------------------------------------------------------------------------------------
	@RequestMapping(value="/common/login.do", method=RequestMethod.GET)
	public String loginView()
	{
		return "common/login";
	}
	
	// 로그인 기능 수행(세션 userType에서 1 - 일반회원, 2 - 관리자, 3 - WePOS 관리자)
	@RequestMapping(value="/common/login.do", method=RequestMethod.POST)
	public String loginProcess(HttpSession session,
			@RequestParam("id") String id, @RequestParam("password") String password)
	{
		Map<String, String> loginInfo = new HashMap<String, String>();
		loginInfo.put("id", id);
		loginInfo.put("password", password);
		
		String result = "";
		int count = commonDao.userLogin(loginInfo);
		
		if(count == 0)
		{
			count = commonDao.mgrLogin(loginInfo);
			if(count == 0)
			{
				result = "/common/loginFail";
			}
			else
			{
				MgrLoginDto mgrLoginDto = new MgrLoginDto();
				mgrLoginDto.setMgrId(id);
				mgrLoginDto.setMgrLoginState('1');
				commonDao.mgrLoginLog(mgrLoginDto);
				
				session.setAttribute("id", id);
				session.setAttribute("userType", 2);				
				
				result = "/common/main";	
			}
		}
		else
		{
			UserLoginDto userLoginDto = new UserLoginDto();
			userLoginDto.setUserId(id);
			userLoginDto.setUserLoginState('1');
			commonDao.userLoginLog(userLoginDto);
			
			session.setAttribute("id", id);
			if("admin".equals(id))
			{
				session.setAttribute("userType", 3);
			}
			else
			{
				session.setAttribute("userType", 1);
			}
			
			result = "/common/main";	
		}
		
		return result;
	}
	
	// 로그아웃 기능 수행
	@RequestMapping("/common/logout.do")
	public String logoutProcess(HttpSession session)
	{
		String id = (String)session.getAttribute("id");
		int userType = (Integer) session.getAttribute("userType");
		
		if(userType == 1)
		{
			UserLoginDto userLoginDto = new UserLoginDto();
			userLoginDto.setUserId(id);
			userLoginDto.setUserLoginState('0');
			commonDao.userLoginLog(userLoginDto);			
		}
		else if(userType == 2)
		{
			MgrLoginDto mgrLoginDto = new MgrLoginDto();
			mgrLoginDto.setMgrId(id);
			mgrLoginDto.setMgrLoginState('0');
			commonDao.mgrLoginLog(mgrLoginDto);
		}
				
		session.removeAttribute("id");
		session.removeAttribute("userType");
		/*session.invalidate();*/
		
		return  "/common/main";
	}
	
	// 회원정보 수정
	@RequestMapping(value="/common/showUserInfo.do")
	public ModelAndView showUserInfoView(@ModelAttribute UsersDto users)
	{
		ModelAndView mav=new ModelAndView();
		UsersDto userInfo=commonDao.showUserInfo(users);
		mav.addObject("userInfo",userInfo);
		mav.setViewName("common/updateUserInfo");	
		
		return mav;
	}
	
	@RequestMapping(value="/common/updateUserInfo.do")
	public ModelAndView updateUserInfoProcess(@ModelAttribute UsersDto users){
		ModelAndView mav=new ModelAndView();
		int result=commonDao.updateUserInfo(users);
		System.out.println("수정결과 = "+result);
		mav.addObject("result", result);
		
		if(result==1){			
			mav.setViewName("common/main");
		}
			
		if(result==0){
			mav.setViewName("common/updateUserInfo");
		}		
		return mav;
	}
	
	// 회원탈퇴
	@RequestMapping(value="/common/deleteUserInfoView.do")
	public ModelAndView deleteUserInfoView(HttpSession session)
	{
		ModelAndView mav=new ModelAndView();
		mav.setViewName("common/deleteUserInfo");
		return mav;
	}
	
	@RequestMapping(value="/common/deleteUserInfoProcess.do")
	public ModelAndView deleteUserInfoProcess(HttpSession session)
	{
		ModelAndView mav=new ModelAndView();
		int userType=(Integer)session.getAttribute("userType");
		System.out.println("userType="+userType);
		if(userType==1){
			int deleteFromUserLogin=commonDao.deleteUserInfoFromUserLogin((String)session.getAttribute("id"));
			if(deleteFromUserLogin==1){
				int deleteFromUsers=commonDao.deleteUserInfoFromUsers((String)session.getAttribute("id"));
				System.out.println("회원탈퇴 성공 여부 = "+deleteFromUsers);
				if(deleteFromUsers==1){
					int deletedId=commonDao.deletedId((String)session.getAttribute("id"));
					if(deletedId==1)
						System.out.println("삭제 아이디 등록성공");
					session.removeAttribute("id");
					session.removeAttribute("userType");
					mav.setViewName("common/main");
				}
			}else{
				System.out.println("에러");
				mav.setViewName("common/deleteUserInfo");
			}
		}
		if(userType==2){
			int deleteFromMgrLogin=commonDao.deleteUserInfoFromMgrLogin((String)session.getAttribute("id"));
			if(deleteFromMgrLogin==1){
				int deleteFromMgr=commonDao.deleteUserInfoFromMgr((String)session.getAttribute("id"));
				System.out.println("회원탈퇴 성공 여부 = "+deleteFromMgr);
				if(deleteFromMgr==1){
					int deletedId=commonDao.deletedId((String)session.getAttribute("id"));
					if(deletedId==1)
						System.out.println("삭제 아이디 등록성공");
					session.removeAttribute("id");
					session.removeAttribute("userType");
					mav.setViewName("common/main");
				}
			}else{
				System.out.println("에러");
				mav.setViewName("common/deleteUserInfo");
			}
		}
		
		return mav;
	}

}








