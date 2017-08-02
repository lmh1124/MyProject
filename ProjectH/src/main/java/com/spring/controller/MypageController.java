package com.spring.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dao.FavorDAO;
import com.spring.dao.GuestDAO;
import com.spring.dao.OrderDAO;
import com.spring.vo.FavorVO;
import com.spring.vo.GuestVO;
import com.spring.vo.OrderVO;


@Controller
public class MypageController {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@RequestMapping("/msearchPost")
	public String searchMP(){
		return "/mypage/search.jsp";
	}
	
	@RequestMapping("/mypageResult")
	public String mypageResult(){
		return "/mypage/mypageResult.jsp";
	}
	
	@RequestMapping(value="/logCheck", method = RequestMethod.POST)
	@ResponseBody
	public String logCk(GuestVO vo){
		System.out.println(vo.getEmail());
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		int result = dao.execLogin(vo);
		
		String res = "";
		if(result == 0){
			res = "N";
		}else{
			res = "Y";
		}

		return res;
	}
	
	@RequestMapping("/mypageInfo")
	public ModelAndView mypage(HttpSession session){
		ModelAndView mv = new ModelAndView();
		String email = (String)session.getAttribute("email");
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		if(email != null){
			GuestVO vo = dao.execSelect(email);
			mv.addObject("vo",vo);
		}
		
		
		mv.setViewName("/mypage/mypageForm.jsp");
		return mv;
	}
	
	@RequestMapping(value="/mypage_pass_update", method=RequestMethod.POST)
	@ResponseBody
	public String passUpdate(GuestVO vo){
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		int result = dao.execPassUpdate(vo);
		String res = "";
		if(result == 1){
			res = "Y";
		}else{
			res = "N";
		}
		return res;
	}
	
	@RequestMapping("/update_mypage")
	public String myPageUpdate(GuestVO vo){
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		dao.execUpdate(vo);
		
		return "/mypage/mypageResult.jsp";
	}
	
	@RequestMapping("/deleteGuest")
	public void deleteGuest(HttpSession session){
		
		String email = (String)session.getAttribute("email");
		
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		session.invalidate();
		dao.execDelete(email);
	}
	
	@RequestMapping("/mypage_orderList")
	public ModelAndView mypageOrderList(HttpSession session){
		String guest_id = (String)session.getAttribute("email");
		ModelAndView mv = new ModelAndView();
		OrderDAO dao =sqlSession.getMapper(OrderDAO.class);
		if(guest_id == null){
			
		}else{
			ArrayList<OrderVO> list = dao.orderList(guest_id); 
			mv.addObject("orList",list);
		}
		mv.setViewName("/mypage/mypage_orderList.jsp");
		
		return mv;
	}
	
	@RequestMapping(value="/mypage_orderDetail", method={ RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public Object mypageOrderDetail(String ordate,HttpSession session){
		
		String guest_id = (String)session.getAttribute("email");
		OrderDAO dao = sqlSession.getMapper(OrderDAO.class);
		
		OrderVO vo = new OrderVO();
		vo.setGuest_id(guest_id);
		vo.setOdate(ordate);
		ArrayList<OrderVO> list = dao.orderDetail(vo);
		HashMap<String, Object> retVal = new HashMap<String, Object>();
		
		retVal.put("deList", list);
		return retVal;
	}
	
	
	@RequestMapping("/mypage_favor")
	public ModelAndView mypageFavor(HttpSession session){
		ModelAndView mv = new ModelAndView();
		String guest_id = (String)session.getAttribute("email");
		FavorDAO dao =sqlSession.getMapper(FavorDAO.class);
		ArrayList<FavorVO> list = new ArrayList<FavorVO>();
		
		list = dao.selectFavorB(guest_id);
		mv.addObject("listB",list);
		
		list = dao.selectFavorD(guest_id);
		mv.addObject("listD", list);
		
		list = dao.selectFavorS(guest_id);
		mv.addObject("listS", list);
		
		mv.setViewName("/mypage/mypage_Favorite.jsp");
		return mv;
	}
	
	@RequestMapping(value="/mypage_favorInsert", method=RequestMethod.POST)
	@ResponseBody
	public void mypageFavorInsert(FavorVO vo){
		
			
		FavorDAO dao = sqlSession.getMapper(FavorDAO.class);	
		dao.insertFavor(vo);
	}
	
	@RequestMapping(value="/mypage_favorDelete", method=RequestMethod.POST)
	@ResponseBody
	public void mypageFavorDelete(FavorVO vo){
		
		FavorDAO dao = sqlSession.getMapper(FavorDAO.class);	
		dao.deleteFavor(vo);
		
	}
}