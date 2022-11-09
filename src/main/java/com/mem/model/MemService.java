package com.mem.model;


	
	import java.sql.Date;
import java.util.List;



	public class MemService {
	private MemDAO_interface dao;

		public MemService() {
			dao = new MemJDBCDAO();

		}

		public MemVO addMem(String mem_account ,String mem_password,String mem_name, String mem_address, String mem_phone,
				String mem_uid, String mem_email, String mem_sex,Date mem_dob) {

			MemVO memVO = new MemVO();
			
			memVO.setMem_account(mem_account);
			memVO.setMem_password(mem_password);
			memVO.setMem_name(mem_name);
			memVO.setMem_address(mem_address);
			memVO.setMem_phone(mem_phone);
			memVO.setMem_uid(mem_uid);
			memVO.setMem_email(mem_email);
			memVO.setMem_sex(mem_sex);
			memVO.setMem_dob(mem_dob);
			dao.insert(memVO);

			return memVO;
		}

		//預留給 Struts 2 或 Spring MVC 用
		public void addMem(MemVO memVO) {
			dao.insert(memVO);
		}
		
		public MemVO updateMem(Integer mem_id, String mem_password,String mem_name, String mem_address,
				String mem_phone, String mem_uid, String mem_email, String mem_sex,Date mem_dob,Integer mem_status) {

			MemVO memVO = new MemVO();

			memVO.setMem_id(mem_id);
//			memVO.setMem_account(mem_account);
			memVO.setMem_password(mem_password);
			memVO.setMem_name(mem_name);
			memVO.setMem_address(mem_address);
			memVO.setMem_phone(mem_phone);
			memVO.setMem_uid(mem_uid);
			memVO.setMem_email(mem_email);
			memVO.setMem_sex(mem_sex);
			memVO.setMem_dob(mem_dob);
			memVO.setMem_status(mem_status);
			dao.update(memVO);

			return dao.findByPrimaryKey(mem_id);
		}
		
		//預留給 Struts 2 用的
		public void updateMem(MemVO memVO) {
			dao.update(memVO);
		}
		
		public MemVO register(String mem_account ,String mem_password,String mem_name, String mem_address, String mem_phone,
				String mem_uid, String mem_email, String mem_sex,Date mem_dob) {

			MemVO memVO = new MemVO();
			
			memVO.setMem_account(mem_account);
			memVO.setMem_password(mem_password);
			memVO.setMem_name(mem_name);
			memVO.setMem_address(mem_address);
			memVO.setMem_phone(mem_phone);
			memVO.setMem_uid(mem_uid);
			memVO.setMem_email(mem_email);
			memVO.setMem_sex(mem_sex);
			memVO.setMem_dob(mem_dob);
			dao.insert(memVO);

			return memVO;
		}


		public void deleteMem(Integer mem_id) {
			dao.delete(mem_id);
		}

		public MemVO getOneMem(Integer mem_id) {
			return dao.findByPrimaryKey(mem_id);
		}
		
		public MemVO getOneMemAc(String mem_account) {
			return dao.findByAccount(mem_account);
		}
		
		public MemVO getMemUser(String mem_account,String mem_password) {
			return dao.findByMemUser(mem_account,mem_password);
		}

		public List<MemVO> getAll() {
			return dao.getAll();
		}
}

