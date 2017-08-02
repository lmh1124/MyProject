package com.spring.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
public class JoinController {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@RequestMapping("/joinForm")
	public String joinForm(){
		return "/join/joinForm.jsp";
	}
	@RequestMapping("/joinResult")
	public String joinResult(){
		return "/join/joinResult.jsp";
	}
	@RequestMapping(value="/join", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView joinIn(GuestVO vo){
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		int result = dao.execInsert(vo); 
		ModelAndView mv = new ModelAndView();
		mv.addObject("result", result);
		mv.setViewName("/join/joinResult.jsp");
		
		return mv;
	}
	
	@RequestMapping("/EmailCk")
	public void loginCheck(HttpServletResponse res, @RequestParam(value="email") String email){
		
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		
		int result = dao.execEmailCk(email);
		try {
			res.getWriter().print(result);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/searchPost")
	public String searchP(){
		return "/join/search.jsp";
	}
}
