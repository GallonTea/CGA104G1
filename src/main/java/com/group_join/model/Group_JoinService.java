package com.group_join.model;

import java.util.List;


public class Group_JoinService {

	private Group_JoinDAO_interface dao;
	
	public Group_JoinService() {
		dao = new Group_JoinDAO();
	}
	
	public Group_JoinVO addGroup_Join(Integer gb_id, Integer mem_id, 
			Integer gbpay_status, Integer pickup_status, Integer deliver_status) {
		
		Group_JoinVO gjVO = new Group_JoinVO();
		gjVO.setGb_id(gb_id);
		gjVO.setMem_id(mem_id);
		gjVO.setGbpay_status(gbpay_status);
		gjVO.setPickup_status(pickup_status);
		gjVO.setDeliver_status(deliver_status);
		dao.insert(gjVO);
		
		return gjVO;
	}
	
	public Group_JoinVO updateGroup_Join(Integer gb_id, Integer mem_id, 
			Integer gbpay_status, Integer pickup_status, Integer deliver_status) {
		
		Group_JoinVO gjVO = new Group_JoinVO();
		gjVO.setGb_id(gb_id);
		gjVO.setMem_id(mem_id);
		gjVO.setGbpay_status(gbpay_status);
		gjVO.setPickup_status(pickup_status);
		gjVO.setDeliver_status(deliver_status);
		dao.update(gjVO);
		
		return gjVO;
	}
	
	public void deleteEmp(Integer gb_id) {
		dao.delete(gb_id);
	}

	public Group_JoinVO getOneEmp(Integer gb_id) {
		return dao.findByPrimaryKey(gb_id);
	}

	public List<Group_JoinVO> getAll() {
		return dao.getAll();
	}
}
