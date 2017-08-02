package com.spring.vo;

import java.util.ArrayList;
import java.util.Random;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class MenuVO {
	int rno, sno, mno, mcost;
	String mname, fname, pfname;
	CommonsMultipartFile file;
	
	
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public CommonsMultipartFile getFile() {
		return file;
	}
	public void setFile(CommonsMultipartFile file) {
		
		String filename = file.getOriginalFilename();
		System.out.println("filename = " + filename);
		if(!filename.equals("") && !filename.equals(null)){
			int index = filename.lastIndexOf(".");
			String tmpext = filename.substring(index);
			this.file = file;
			setFname(filename);
			setPfname(sno+"_"+new Random().nextInt(10000000)+tmpext);
		}else{
			setFname("null");
			setPfname("null");
		}
		
	}
	
	public String getPfname() {
		return pfname;
	}
	
	public void setPfname(String pfname) {
		this.pfname = pfname;
	}
	
	public int getSno() { 				// 메뉴 종류 구문 1-berger, 2-drink, 3-side, 4-set
		return sno;
	}
	public void setSno(int sno) { 
		this.sno = sno;
	}
	public int getMno() {				 // 메뉴의 순서
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getMcost() {
		return mcost;
	}
	public void setMcost(int mcost) {
		this.mcost = mcost;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	
}
