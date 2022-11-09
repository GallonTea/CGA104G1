package com.group_buy.model;

import java.sql.Timestamp;
import java.util.List;

public class Group_BuyService {
	
	private Group_BuyDAO_interface dao;
	
	public Group_BuyService() {
		dao = new Group_BuyDAO();
	}
	
	public Group_BuyVO addGroup_Buy(Integer mem_id, Integer gbitem_id, Integer gb_min,
			Integer gb_amount, Timestamp gbstart_date, Timestamp gbend_date, Integer gb_status) {
		
		Group_BuyVO gbVO = new Group_BuyVO();
		gbVO.setMem_id(mem_id);
		gbVO.setGbitem_id(gbitem_id);
		gbVO.setGb_min(gb_min);
		gbVO.setGb_amount(gb_amount);
		gbVO.setGbstart_date(gbstart_date);
		gbVO.setGbend_date(gbend_date);
		gbVO.setGb_status(gb_status);
		dao.insert(gbVO);
		
		return gbVO;
	}
	
	public Group_BuyVO updateGroup_Buy(Integer gb_id, Integer mem_id, Integer gbitem_id, Integer gb_min,
			Integer gb_amount, Timestamp gbstart_date, Timestamp gbend_date, Integer gb_status) {
		
		Group_BuyVO gbVO = new Group_BuyVO();
		gbVO.setGb_id(gb_id);
		gbVO.setMem_id(mem_id);
		gbVO.setGbitem_id(gbitem_id);
		gbVO.setGb_min(gb_min);
		gbVO.setGb_amount(gb_amount);
		gbVO.setGbstart_date(gbstart_date);
		gbVO.setGbend_date(gbend_date);
		gbVO.setGb_status(gb_status);
		dao.update(gbVO);
		
		return gbVO;
	}
	
	public void deleteEmp(Integer gb_id) {
		dao.delete(gb_id);
	}

	public Group_BuyVO getOneEmp(Integer gb_id) {
		return dao.findByPrimaryKey(gb_id);
	}

	public List<Group_BuyVO> getAll() {
		return dao.getAll();
	}
}
