package com.spring.controller;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dao.QnaDAO;
import com.spring.vo.QnaVO;

@Controller
public class QnaController{
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@RequestMapping("/qna.do")
	public ModelAndView qna(){
		
		ModelAndView mv = new ModelAndView();
		QnaDAO dao = sqlSession.getMapper(QnaDAO.class);
		ArrayList<QnaVO> list = dao.execSelect();
		mv.addObject("list", list);
		mv.setViewName("/qna/qna_list.jsp");		
		
		return mv;
	}		
	
	@RequestMapping("/sendMail.do")
	public String sendMail(){
		
		return "/qna/sendMail.jsp";
	}	
	
	@RequestMapping("/qna_form.do")
	public String qna_form(){
		
		return "/qna/qna_form.jsp";
	}
	
	@RequestMapping("/qna_content.do")
	public ModelAndView qna_content(String no, String rno){
		ModelAndView mv = new ModelAndView(); 
		QnaDAO dao = sqlSession.getMapper(QnaDAO.class);
		QnaVO vo = dao.execContent(no);
		dao.execHitsUpdate(no);
		
		mv.addObject("vo", vo);
		mv.addObject("rno", rno);
		mv.setViewName("/qna/qna_content.jsp");
		
		return mv;
	}
	
	@RequestMapping(value="/qna_save.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String qna_save(QnaVO vo){
	
		QnaDAO dao = sqlSession.getMapper(QnaDAO.class);
		int result = dao.execInsert(vo);
		
		return "redirect:/main.do";
	}
	
	@RequestMapping("/qna_delete.do")
	public ModelAndView qna_delete(String no){
		ModelAndView mv = new ModelAndView();
		mv.addObject("no", no);
		mv.setViewName("/qna/qna_delete.jsp");
		
		return mv;
	}
	
	@RequestMapping("/qna_delete_complete.do")
	public String qna_delete_complete(String no){
		
		QnaDAO dao = sqlSession.getMapper(QnaDAO.class);
		dao.execDelete(no);
		
		return "redirect:/qna.do";
	}
	
	

	

		

}
