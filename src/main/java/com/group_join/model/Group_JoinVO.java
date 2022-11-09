package com.group_join.model;

public class Group_JoinVO implements java.io.Serializable{
	
	private Integer gb_id;
	private Integer mem_id;
	private Integer gbpay_status;
	private Integer pickup_status;
	private Integer deliver_status;
	
	public Integer getGb_id() {
		return gb_id;
	}
	public void setGb_id(Integer gb_id) {
		this.gb_id = gb_id;
	}
	public Integer getMem_id() {
		return mem_id;
	}
	public void setMem_id(Integer mem_id) {
		this.mem_id = mem_id;
	}
	public Integer getGbpay_status() {
		return gbpay_status;
	}
	public void setGbpay_status(Integer gbpay_status) {
		this.gbpay_status = gbpay_status;
	}
	public Integer getPickup_status() {
		return pickup_status;
	}
	public void setPickup_status(Integer pickup_status) {
		this.pickup_status = pickup_status;
	}
	public Integer getDeliver_status() {
		return deliver_status;
	}
	public void setDeliver_status(Integer deliver_status) {
		this.deliver_status = deliver_status;
	}
	
	
	

}
