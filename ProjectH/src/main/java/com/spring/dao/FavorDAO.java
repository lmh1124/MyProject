package com.spring.dao;

import java.util.ArrayList;

import com.spring.vo.FavorVO;

public interface FavorDAO {
	public ArrayList<FavorVO> selectFavorB(String guest_id);
	public ArrayList<FavorVO> selectFavorD(String guest_id);
	public ArrayList<FavorVO> selectFavorS(String guest_id);
	public int insertFavor(FavorVO vo);
	public void deleteFavor(FavorVO vo);
}
