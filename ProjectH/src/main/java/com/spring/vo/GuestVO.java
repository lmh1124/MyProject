package com.spring.vo;

import java.util.StringTokenizer;

public class GuestVO {
	String email, pass, gname, phone, phone1, phone2, phone3, addr, addr1, addr2, addr3, jdate;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getGname() {
		return gname;
	}

	public void setGname(String gname) {
		this.gname = gname;
	}

	public String getPhone1() {
		return phone1;
	}

	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}

	public String getPhone2() {
		return phone2;
	}

	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}

	public String getPhone3() {
		return phone3;
	}

	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getAddr3() {
		return addr3;
	}

	public void setAddr3(String addr3) {
		this.addr3 = addr3;
	}

	public String getJdate() {
		return jdate;
	}

	public void setJdate(String jdate) {
		this.jdate = jdate;
	}
	/* 나누어서 받은 값들을 합치거나 분배*/
	public String getAddr() {
		addr = addr1 + "#" + addr2 + "#" + addr3;
		
		return addr;
	}
	public void setAddr(String addr){
		StringTokenizer str = new StringTokenizer(addr, "#");
		
		if(str.hasMoreTokens()){
			setAddr1(str.nextToken());
		}
		if(str.hasMoreTokens()){
			setAddr2(str.nextToken());
		}
		if(str.hasMoreTokens()){
			setAddr3(str.nextToken());
		}
	}	
	public String getPhone(){
		phone = phone1 + "-" + phone2 + "-" + phone3;
		
		return phone;
	}
	
	public void setPhone(String phone){
		StringTokenizer str = new StringTokenizer(phone, "-");
		if(str.hasMoreTokens()){
			setPhone1(str.nextToken());
		}
		if(str.hasMoreTokens()){
			setPhone2(str.nextToken());
		}
		if(str.hasMoreTokens()){
			setPhone3(str.nextToken());
		}
	}
	
}
