package com.spring.dao;

import java.util.ArrayList;

import com.spring.vo.BoardVO;
import com.spring.vo.FoodInfVO;
import com.spring.vo.MenuVO;

public interface MenuDAO {

	
	public int menuInsert_B(MenuVO vo);
	
	public int menuInsert_D(MenuVO vo);
	
	public int menuInsert_S(MenuVO vo);
	
	public ArrayList<MenuVO> menuList_B();
	
	public ArrayList<MenuVO> menuList_D();
	
	public ArrayList<MenuVO> menuList_S();
	
	public FoodInfVO execContent(String fno);
	
}
