package com.spring.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.service.PageVO;
import com.spring.vo.BoardReplyVO;
import com.spring.vo.BoardVO;

public interface BoardDAO {

	public int execPageCount();
	public ArrayList<BoardVO> execSelect(PageVO pageVO);
	public BoardVO execContent(String no);
	public void execHitsUpdate(String no);
	public int execInsert(BoardVO vo);
	public int execDelete(String no);
	public int execUpdate(BoardVO vo);
	public void execReplyInsert(BoardReplyVO rvo);
	public void execReplyUpdate(BoardReplyVO rvo);
	public void execReplyDelete(String reno);
	public ArrayList<BoardReplyVO> execSelectReply(String no);
}