package com.spring.controller;

import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dao.GuestDAO;
import com.spring.dao.MenuDAO;
import com.spring.dao.OrderDAO;
import com.spring.vo.GuestVO;
import com.spring.vo.MenuVO;
import com.spring.vo.OrderVO;

@Controller
public class OrderController {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@RequestMapping("/orderTable")
	public ModelAndView orderTable(HttpSession session){
		
		ModelAndView mv = new ModelAndView();
		OrderDAO dao = sqlSession.getMapper(OrderDAO.class);
		
		String guest_id = (String)session.getAttribute("email");
		
		OrderVO vo = dao.orderTable(guest_id);
		
		mv.addObject("vo",vo);
		mv.setViewName("order/orderTable.jsp");
		
		return mv;
	}
	
	@RequestMapping("/orderTest")
	public ModelAndView orderMain(){
		ModelAndView mv = new ModelAndView();
		MenuDAO mDao = sqlSession.getMapper(MenuDAO.class);
		ArrayList<MenuVO> list = new ArrayList<MenuVO>();
	
		list = mDao.menuList_B(); // berger List
		mv.addObject("bList",list);
		list = mDao.menuList_D(); //drink List
		mv.addObject("dList",list);
		
		list = mDao.menuList_S(); //side List
		mv.addObject("sList",list);
		
		mv.setViewName("/order/orderTest.jsp");
		return mv;
	}
	
	@RequestMapping("/orderMain")
	public ModelAndView orderTest(){
		ModelAndView mv = new ModelAndView();
		MenuDAO mDao = sqlSession.getMapper(MenuDAO.class);
		ArrayList<MenuVO> list = new ArrayList<MenuVO>();
	
		list = mDao.menuList_B(); // berger List
		mv.addObject("bList",list);
		list = mDao.menuList_D(); //drink List
		mv.addObject("dList",list);
		
		list = mDao.menuList_S(); //side List
		mv.addObject("sList",list);
		
		mv.setViewName("/order/orderMain.jsp");
		return mv;
	}
	
	@RequestMapping(value="/basketSave",method=RequestMethod.POST)
	@ResponseBody
	public void baskSave(OrderVO vo, HttpSession session){
		
		@SuppressWarnings("unchecked")
		ArrayList<OrderVO> list = (ArrayList<OrderVO>)session.getAttribute("baskList");
		if(list == null){
			list = new ArrayList<OrderVO>();
			session.setAttribute("baskList", list);
		}
		list.add(vo);
	}
	@RequestMapping(value="/basketDelete",method=RequestMethod.POST)
	@ResponseBody
	public void orderDelete(OrderVO vo, HttpSession session){
		int count = 0;
		@SuppressWarnings("unchecked")
		ArrayList<OrderVO> list = (ArrayList<OrderVO>)session.getAttribute("baskList");
		
		for(Iterator<OrderVO> it = list.iterator() ; it.hasNext();){
			OrderVO value = it.next();
			if(value.getOrder_number() == vo.getOrder_number()){
				it.remove();
			}
		}
		
	}
	@RequestMapping("/basketReset")
	@ResponseBody
	public void orderReset(HttpSession session){
		session.removeAttribute("baskList");
	}
	
	@RequestMapping(value="/basketInsert", method=RequestMethod.POST)
	@ResponseBody
	public String orderAdd(@RequestBody OrderVO vo, HttpSession session) throws Exception{
		
		String email = (String)session.getAttribute("email");		
		
		return "redirect:/main.do";
		 
	}
	
	@RequestMapping("/orderPage")
	public ModelAndView orderPage(HttpSession session){
		
		@SuppressWarnings("unchecked")
		ArrayList<OrderVO> list = (ArrayList<OrderVO>)session.getAttribute("baskList");
		ModelAndView mv = new ModelAndView();


		String email = (String)session.getAttribute("email");
		GuestDAO gdao = sqlSession.getMapper(GuestDAO.class);
		if(email == null){}else{
			GuestVO vo =  gdao.execSelect(email);
			mv.addObject("gvo",vo);
		}
		mv.addObject("baskList", list);
		

		mv.setViewName("/order/orderPage.jsp");
		
		return mv;
	}
	
	@RequestMapping(value="/orderInsert", method=RequestMethod.POST)
	@ResponseBody
	public String orderInsert(OrderVO vo, HttpSession session){
		OrderDAO dao = sqlSession.getMapper(OrderDAO.class);
		
		int result = dao.orderInsert(vo);
		session.removeAttribute("baskList");
		String res = "";
		if(result > 0){
			res = "suc";
		}else{
			res="fail";
		}
		return res;
	}

}
