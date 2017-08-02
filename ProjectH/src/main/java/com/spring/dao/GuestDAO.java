package com.spring.dao;

import java.util.ArrayList;

import com.spring.vo.GuestVO;

public interface GuestDAO {
	
	//Join 
	public int execInsert(GuestVO vo);
	
	//Email Check
	public int execEmailCk(String email);
	
	//Login
	public int execLogin(GuestVO vo);
	
	//회원 정보 출력
	public GuestVO execSelect(String email);
	
	//비밀번호 변경
	public int execPassUpdate(GuestVO vo);
	
	//회원 정보 수정
	public int execUpdate(GuestVO vo);
	
	//회원 탈퇴
	public int execDelete(String email);
	
	//아이디 찾기
	public String execfindID(GuestVO vo);
	
	//비밀번호 찾기
	public String execfindPass(GuestVO vo);
	
	//비밀번호 변경
	public void execChangePass(GuestVO vo);
	
	//관리자 회원리스트 출력
	public ArrayList<GuestVO> execSelectList();
}
