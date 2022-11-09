package com.emp.model;

import java.util.List;

public class EmpService {

	private EmpDAO_interface dao;
	
	public EmpService() {
		dao = new EmpJDBCDAO();
	}
	
	public List<EmpVO> login(String account , String password) {
		return dao.login(account, password);
		
	}

	public EmpVO addEmp(String emp_name, String account,String password, java.sql.Date onjob_date,
			 Integer emp_status) {

		EmpVO empVO = new EmpVO();

		empVO.setEmp_name(emp_name);
		empVO.setAccount(account);
		empVO.setPassword(password);
		empVO.setOnjob_date(onjob_date);
		empVO.setEmp_status(emp_status);
		dao.insert(empVO);

		return empVO;
	}

	public EmpVO updateEmp(Integer emp_id, String emp_name, String account,String password, java.sql.Date onjob_date,
			 Integer emp_status) {

		EmpVO empVO = new EmpVO();

		empVO.setEmp_id(emp_id);
		empVO.setEmp_name(emp_name);
		empVO.setAccount(account);
		empVO.setPassword(password);
		empVO.setOnjob_date(onjob_date);
		empVO.setEmp_status(emp_status);
		dao.update(empVO);

		return empVO;
	}

	public void deleteEmp(Integer emp_id) {
		dao.delete(emp_id);
	}

	public EmpVO getOneEmp(Integer emp_id) {
		return dao.findBypk(emp_id);
	}
	

	public List<EmpVO> getAll() {
		return dao.getAll();
	}
	
	

}