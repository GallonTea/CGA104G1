package com.group_join.model;

import java.util.*;

public interface Group_JoinDAO_interface {

	public void insert(Group_JoinVO Group_JoinVO);

	public void update(Group_JoinVO Group_JoinVO);

	public void delete(Integer gb_id);
	
	public Group_JoinVO findByPrimaryKey(Integer gb_id);

	public List<Group_JoinVO> getAll();
}
