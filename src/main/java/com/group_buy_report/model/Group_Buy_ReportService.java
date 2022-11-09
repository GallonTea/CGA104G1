package com.group_buy_report.model;

import java.util.List;


public class Group_Buy_ReportService {
	
	private Group_Buy_ReportDAO_interface dao;
	
	public Group_Buy_ReportService() {
		dao = new Group_Buy_ReportDAO();
	}
	
	public Group_Buy_ReportVO addGroup_Buy_Report(Integer mem_id, String frep_content,
			Integer frep_status, Integer frep_result, Integer emp_id) {
		
		Group_Buy_ReportVO gbrVO = new Group_Buy_ReportVO();
		gbrVO.setMem_id(mem_id);
		gbrVO.setFrep_content(frep_content);
		gbrVO.setFrep_status(frep_status);
		gbrVO.setFrep_result(frep_result);
		gbrVO.setEmp_id(emp_id);
		dao.insert(gbrVO);
		
		return gbrVO;
	}
	
	public Group_Buy_ReportVO updateGroup_Buy_Report(Integer gbfrep_id, Integer mem_id, String frep_content,
			Integer frep_status, Integer frep_result, Integer emp_id) {
		
		Group_Buy_ReportVO gbrVO = new Group_Buy_ReportVO();
		gbrVO.setGbfrep_id(gbfrep_id);
		gbrVO.setMem_id(mem_id);
		gbrVO.setFrep_content(frep_content);
		gbrVO.setFrep_status(frep_status);
		gbrVO.setFrep_result(frep_result);
		gbrVO.setEmp_id(emp_id);
		dao.update(gbrVO);
		
		return gbrVO;
	}
	
	public void deleteEmp(Integer gbfrep_id) {
		dao.delete(gbfrep_id);
	}

	public Group_Buy_ReportVO getOneEmp(Integer gbfrep_id) {
		return dao.findByPrimaryKey(gbfrep_id);
	}

	public List<Group_Buy_ReportVO> getAll() {
		return dao.getAll();
	}
}
