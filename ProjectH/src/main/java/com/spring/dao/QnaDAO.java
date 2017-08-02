package com.spring.dao;

import java.util.ArrayList;

import com.spring.vo.QnaVO;

public interface QnaDAO {
	
	public ArrayList<QnaVO> execSelect();
	public QnaVO execContent(String no);
	public void execHitsUpdate(String no);
	public int execInsert(QnaVO vo);
	public int execDelete(String no);
	public int execUpdate(QnaVO vo);
}