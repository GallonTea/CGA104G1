package com.group_buy_order.model;

import java.util.*;

public interface Group_Buy_OrderDAO_interface {

	public void insert(Group_Buy_OrderVO Group_Buy_OrderVO);

	public void update(Group_Buy_OrderVO Group_Buy_OrderVO);

	public void delete(Integer gborder_id);

	public Group_Buy_OrderVO findByPrimaryKey(Integer gborder_id);

	public List<Group_Buy_OrderVO> getAll();
}
