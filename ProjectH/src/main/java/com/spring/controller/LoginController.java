package com.spring.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dao.GuestDAO;
import com.spring.vo.GuestVO;

@Controller
public class LoginController {

	@Autowired
	SqlSessionTemplate sqlSession;

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public String login(GuestVO vo, HttpSession session) {
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		int result = dao.execLogin(vo);
		String res = "";
		if(result == 0){
			res = "N";
		}else{
			res = "Y";
			session.setAttribute("email", vo.getEmail());
			session.setAttribute("vo",vo);
		}

		return res;
	}
	
	@RequestMapping("/findIP")
	public String findIP(){
		return "/login/search.jsp";
	}
	
	@RequestMapping(value="/findID", method=RequestMethod.POST)
	@ResponseBody
	public String findID(HttpServletResponse res, GuestVO vo){
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		String result = dao.execfindID(vo);
		
		if(result==null){
			result = "fail";
		}
		return result;
	}
	
	@RequestMapping(value="/findPass", method=RequestMethod.POST)
	@ResponseBody
	public String findPass(GuestVO vo){
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		
		String result = dao.execfindPass(vo);
		return result;
	}
	
	@RequestMapping(value="/ChangePass", method=RequestMethod.POST)
	@ResponseBody
	public void changePass(GuestVO vo){
		
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		
		dao.execChangePass(vo);

	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session){
		
		session.invalidate();
		
		return "redirect:/main.do";
	}
			
}
