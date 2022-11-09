package com.member_coupon.model;

import java.sql.Timestamp;

public class Member_couponVO implements java.io.Serializable {
	
	private Integer coupon_id;
	private Integer mem_id;
	private Timestamp mcpn_gettime;
	private Integer mcpn_use;
	
	
	public Integer getCoupon_id() {
		return coupon_id;
	}
	public void setCoupon_id(Integer coupon_id) {
		this.coupon_id = coupon_id;
	}
	public Integer getMem_id() {
		return mem_id;
	}
	public void setMem_id(Integer mem_id) {
		this.mem_id = mem_id;
	}
	public Timestamp getMcpn_gettime() {
		return mcpn_gettime;
	}
	public void setMcpn_gettime(Timestamp mcpn_gettime) {
		this.mcpn_gettime = mcpn_gettime;
	}
	public Integer getMcpn_use() {
		return mcpn_use;
	}
	public void setMcpn_use(Integer mcpn_use) {
		this.mcpn_use = mcpn_use;
	}
	
	

}
