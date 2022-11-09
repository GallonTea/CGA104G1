package com.emp.model;

import java.util.*;

public interface EmpDAO_interface {
	public void insert(EmpVO empVO);
	public void update(EmpVO empVO);
	public void delete(Integer emp_id);
	public EmpVO findBypk(Integer emp_id);
	public List<EmpVO> getAll(); 
	
	public List<EmpVO> login(String account, String password);
}
