package com.spring.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dao.FavorDAO;
import com.spring.dao.MenuDAO;
import com.spring.vo.FavorVO;
import com.spring.vo.MenuVO;



@Controller		//해당 코드를 입력하면 이후에 자동으로 매핑해줌
public class MainController{
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@RequestMapping("/main.do")
	public ModelAndView newDelivery(HttpSession session){
		
		ModelAndView mv = new ModelAndView();
		MenuDAO mDao = sqlSession.getMapper(MenuDAO.class);
		ArrayList<MenuVO> list = new ArrayList<MenuVO>();
		
		ArrayList<FavorVO> list2 = new ArrayList<FavorVO>();
		FavorDAO fdao = sqlSession.getMapper(FavorDAO.class);
		
		@SuppressWarnings("unchecked")
		String guest_id = (String)session.getAttribute("email");
		if(guest_id != null){
			list2 = fdao.selectFavorB(guest_id);
			mv.addObject("bList2",list2);
			list2 = fdao.selectFavorD(guest_id);
			mv.addObject("dList2",list2);
			list2 = fdao.selectFavorS(guest_id);
			mv.addObject("sList2",list2);
		}
		
		
		list = mDao.menuList_B(); // berger List
		
		mv.addObject("bList",list);
		list = mDao.menuList_D(); //drink List
		mv.addObject("dList",list);
		
		list = mDao.menuList_S(); //side List
		mv.addObject("sList",list);
		mv.setViewName("newDelivery.jsp");
		
		return mv;
	}
	
	@RequestMapping("/home.do")
	public String home(){
		
		return "home.jsp";
	}	
	
}
