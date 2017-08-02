package com.spring.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dao.BoardDAO;
import com.spring.service.PageVO;
import com.spring.vo.BoardReplyVO;
//import org.springframework.web.servlet.mvc.Controller;
import com.spring.vo.BoardVO;

@Controller
public class BoardController{
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@RequestMapping(value="/board.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView board(PageVO pageVO){
		
		ModelAndView mv = new ModelAndView();
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);

		pageVO.pageCalculate(dao.execPageCount());
		ArrayList<BoardVO> list = dao.execSelect(pageVO);
		mv.addObject("list", list);
		mv.addObject("pageVO", pageVO);
		mv.setViewName("/board/board_list.jsp");		
		
		return mv;
	}		

	
	@RequestMapping("/board_form.do")
	public String board_form(){
		
		return "/board/board_form.jsp";
	}
	
	@RequestMapping("/board_content.do")
	public ModelAndView board_content(HttpServletRequest request, String rno){
		
		String no = request.getParameter("no");
		
		ModelAndView mv = new ModelAndView(); 
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		BoardVO vo = dao.execContent(no);
		dao.execHitsUpdate(no);
		
		
		ArrayList<BoardReplyVO> replylist = dao.execSelectReply(no);
		
		mv.addObject("vo", vo);
		mv.addObject("rno", rno);
		mv.addObject("replylist", replylist);
		mv.setViewName("/board/board_content.jsp");
		
		return mv;
	}
	
	@RequestMapping(value="/board_save.do", method=RequestMethod.POST)
	public String board_save(BoardVO vo){
	
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		int result = dao.execInsert(vo);
		
		return "redirect:/board.do";
	}
	
	@RequestMapping("/board_result.do")
	public ModelAndView board_result(String no, String rno){
		
		ModelAndView mv = new ModelAndView(); 
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		BoardVO vo = dao.execContent(no);
		
		mv.addObject("vo", vo);
		mv.addObject("rno", rno);
		mv.setViewName("/board/board_Result.jsp");
		
		return mv;
	}
	
	@RequestMapping(value="/board_reply_save.do", method=RequestMethod.POST)
	public String board_reply_save(HttpServletRequest request, BoardReplyVO vo){
		
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		dao.execReplyInsert(vo);	       
		
		return "redirect:/board_content.do?no=" + vo.getNo();
	}
	
	

	
	
	@RequestMapping("/board_delete.do")
	public ModelAndView board_delete(String no){
		ModelAndView mv = new ModelAndView();
		mv.addObject("no", no);
		mv.setViewName("/board/board_delete.jsp");
		
		return mv;
	}
	
	@RequestMapping("/board_delete_complete.do")
	public String board_delete_complete(String no){
		
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		dao.execDelete(no);
		
		return "redirect:/board.do";
	}
	
	
	@RequestMapping("/board_update_form.do")
	public ModelAndView board_update_form(String no, String rno){
		ModelAndView mv = new ModelAndView();
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		BoardVO vo = dao.execContent(no);
		
		mv.addObject("vo", vo);
		mv.addObject("rno", rno);
		mv.setViewName("/board/board_update_form.jsp");
		
		return mv;
	}
	
	@RequestMapping("/board_reply_update_form.do")
	public ModelAndView board_reply_update_form(String no, String reno){
		ModelAndView mv = new ModelAndView();
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		
		ArrayList<BoardReplyVO> replylist = dao.execSelectReply(no);
		
		mv.addObject("reno", reno);
		mv.addObject("replylist", replylist);
		mv.setViewName("/board/board_reply_update_form.jsp");
		
		return mv;
	}
	
	@RequestMapping(value="/board_update_save.do", method=RequestMethod.POST)
	public String board_update_save(BoardVO vo){
		
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		dao.execUpdate(vo);
		
		return "redirect:/board_content.do?no=" + vo.getNo();
	}
		
	@RequestMapping("/board_update_result.do")
	public String board_update_result(){
		
		return "/board/board_Update_Result.jsp";
	}

    @RequestMapping(value = "/board_reply_delete.do")
    public String board_reply_delete(HttpServletRequest request, BoardReplyVO vo) {
        
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
        dao.execReplyDelete(vo.getReno());

		return "redirect:/board_content.do?no=" + vo.getNo();
    }
	
}
