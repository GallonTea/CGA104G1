package com.group_buy.model;

import java.util.*;

public interface Group_BuyDAO_interface {

	public void insert(Group_BuyVO Group_BuyVO);

	public void update(Group_BuyVO Group_BuyVO);

	public void delete(Integer gb_id);

	public Group_BuyVO findByPrimaryKey(Integer gb_id);

	public List<Group_BuyVO> getAll();
}
