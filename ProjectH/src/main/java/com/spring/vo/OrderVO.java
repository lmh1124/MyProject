package com.spring.vo;

import java.util.StringTokenizer;

public class OrderVO {
	
	String guest_id, guest_addr, addr1, addr2, addr3, guest_phone, phone1, phone2, phone3, order_name;
	int rno,order_no, order_count, order_cost, order_number, order_tot;
	
	String odate, oname;
	int ocount;
	
	
	public String getOdate() {
		return odate;
	}

	public void setOdate(String odate) {
		this.odate = odate;
	}

	public String getOname() {
		return oname;
	}

	public void setOname(String oname) {
		this.oname = oname;
	}

	public int getOcount() {
		return ocount;
	}

	public void setOcount(int ocount) {
		this.ocount = ocount;
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
	public String getGuest_phone() {
		guest_phone = phone1 + "-" + phone2 + "-" + phone3;
		return guest_phone;
	}
	public void setGuest_phone(String guest_phone) {
		
		StringTokenizer str = new StringTokenizer(guest_phone, "-");
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
	public String getGuest_addr() {
		guest_addr = addr1 + "#" + addr2 + "#" + addr3;
		
		return guest_addr;
	}
	public void setGuest_addr(String guest_addr) {

		StringTokenizer str = new StringTokenizer(guest_addr, "#");
		
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
	public int getOrder_tot() {
		return order_tot;
	}
	public void setOrder_tot(int order_tot) {
		this.order_tot = order_tot;
	}
	public int getOrder_number() {
		return order_number;
	}
	public void setOrder_number(int order_number) {
		this.order_number = order_number;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getGuest_id() {
		return guest_id;
	}
	public void setGuest_id(String guest_id) {
		this.guest_id = guest_id;
	}
	public String getOrder_name() {
		return order_name;
	}
	public void setOrder_name(String order_name) {
		this.order_name = order_name;
	}
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
	public int getOrder_count() {
		return order_count;
	}
	public void setOrder_count(int order_count) {
		this.order_count = order_count;
	}
	public int getOrder_cost() {
		return order_cost;
	}
	public void setOrder_cost(int order_cost) {
		this.order_cost = order_cost;
	}
	
	
	
}
