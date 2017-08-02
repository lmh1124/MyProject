package com.spring.controller;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dao.GuestDAO;
import com.spring.vo.GuestVO;

@Controller
public class AdminController {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@RequestMapping("/admin.do")
	public String admin(){
		return "/admin/admin_login.jsp";
	}
	
	@RequestMapping(value="/admin_login.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String admin_main(GuestVO vo){
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		String result = "";
		
		if("admin@naver.com".equals(vo.getEmail()) && "qwer1234".equals(vo.getPass())){
			
			int val = dao.execLogin(vo);
			
			if(val == 1){
				result = "/admin/admin_main.jsp";
			}
		}else{
			//로그인 실패
		}
		return result;
	}
	
	@RequestMapping("/admin_member.do")
	public ModelAndView admin_member(){
		
		ModelAndView mv = new ModelAndView();
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		ArrayList<GuestVO> list = dao.execSelectList();
		mv.addObject("list", list);
		mv.setViewName("/admin/admin_member_list.jsp");
		
		return mv;
	}
}
