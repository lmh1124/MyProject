package com.spring.dao;

import java.util.ArrayList;

import com.spring.vo.OrderVO;

public interface OrderDAO {

	public OrderVO orderTable(String guest_id);
	
	public int orderInsert(OrderVO vo);
	
	public ArrayList<OrderVO> orderList(String guest_id);
	
	public ArrayList<OrderVO> orderDetail(OrderVO vo);
}
