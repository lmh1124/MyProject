package com.spring.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dao.BoardDAO;
import com.spring.dao.MenuDAO;
import com.spring.vo.FoodInfVO;
import com.spring.vo.MenuVO;

@Controller
public class MenuController {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@RequestMapping("/Menu")
	public String menu(){
		
		return "/menu/menuInsert.jsp";
	}
	
	@RequestMapping(value="/insertMenu", method=RequestMethod.POST)
	public String menuInsert(MenuVO vo, HttpServletRequest request) throws IOException{
		
		MenuDAO dao = sqlSession.getMapper(MenuDAO.class);
		String path = request.getSession().getServletContext().getRealPath("/menuImg");
		System.out.println("img path = "+path);
		
		CommonsMultipartFile file = vo.getFile();
		String fpath = path + "\\" + vo.getPfname();
		System.out.println("fpath = " + fpath);
		
		FileOutputStream fos = new FileOutputStream(fpath);
		fos.write(file.getBytes());
		fos.close();
		
		int select = vo.getSno();
		
		if(select == 1){
			dao.menuInsert_B(vo);
		}else if(select == 2){
			dao.menuInsert_D(vo);
		}else if(select == 3){
			dao.menuInsert_S(vo);
		}else{
			System.out.println("세트 메뉴 추가");
		}
		
		return "redirect:/Menu";
	}
	
	@RequestMapping("/menuList")
	public String menuList(){
		
		return "/menu/menuList.jsp";
	}
	
	@RequestMapping("/menuSelect")
	public void menuSelect(int select){
		System.out.println("select : " + select);
		MenuDAO dao = sqlSession.getMapper(MenuDAO.class);
		ArrayList<MenuVO> list = new ArrayList<MenuVO>();
		if(select == 1){
			System.out.println("Berger Menu");
			list = dao.menuList_B();
		}else if(select == 2){
			System.out.println("Drink Menu");
			list = dao.menuList_D();
		}else if(select == 3){
			System.out.println("Side Menu");
			list = dao.menuList_S();
		}else{
			System.out.println("세트 메뉴 목록");
		}
		
	}
	
	@RequestMapping("/practice3.do")
	public ModelAndView practice3(String fno){

		ModelAndView mv = new ModelAndView();
		MenuDAO dao = sqlSession.getMapper(MenuDAO.class);
		FoodInfVO fvo = dao.execContent(fno);
		
		mv.addObject("fvo", fvo);	
		mv.addObject("fno", fno);
		mv.setViewName("practice3.jsp");
		
		return mv;

	}
	
	@RequestMapping("/foodInfo.do")
	public String board_form(){
		
		return "/menu/foodInfo.jsp";
	}
	
}
