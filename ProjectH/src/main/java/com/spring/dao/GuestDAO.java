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
	
	//ȸ�� ���� ���
	public GuestVO execSelect(String email);
	
	//��й�ȣ ����
	public int execPassUpdate(GuestVO vo);
	
	//ȸ�� ���� ����
	public int execUpdate(GuestVO vo);
	
	//ȸ�� Ż��
	public int execDelete(String email);
	
	//���̵� ã��
	public String execfindID(GuestVO vo);
	
	//��й�ȣ ã��
	public String execfindPass(GuestVO vo);
	
	//��й�ȣ ����
	public void execChangePass(GuestVO vo);
	
	//������ ȸ������Ʈ ���
	public ArrayList<GuestVO> execSelectList();
}
