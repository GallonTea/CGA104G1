package com.member_coupon.model;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;


public interface Member_couponDAO_interface  {
	
    public void insert(Member_couponVO member_couponVO);
    public void update(Member_couponVO member_couponVO);
    public void delete(Integer coupon_id);
    public Member_couponVO findByPrimaryKey(Integer coupon_id);
    public List<Member_couponVO> getAll();
    //萬用複合查詢(傳入參數型態Map)(回傳 List)
//  public List<EmpVO> getAll(Map<String, String[]> map); 


}
