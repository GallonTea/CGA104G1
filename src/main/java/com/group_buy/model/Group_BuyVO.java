package com.group_buy.model;

import java.sql.Timestamp;

public class Group_BuyVO implements java.io.Serializable{
	private Integer gb_id;
	private Integer mem_id;
	private Integer gbitem_id;
	private Integer gb_min;
	private Integer gb_amount;
	private Timestamp gbstart_date;
	private Timestamp gbend_date;
	private Integer gb_status;
	
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
	public Integer getGbitem_id() {
		return gbitem_id;
	}
	public void setGbitem_id(Integer gbitem_id) {
		this.gbitem_id = gbitem_id;
	}
	public Integer getGb_min() {
		return gb_min;
	}
	public void setGb_min(Integer gb_min) {
		this.gb_min = gb_min;
	}
	public Integer getGb_amount() {
		return gb_amount;
	}
	public void setGb_amount(Integer gb_amount) {
		this.gb_amount = gb_amount;
	}
	public Timestamp getGbstart_date() {
		return gbstart_date;
	}
	public void setGbstart_date(Timestamp gbstart_date) {
		this.gbstart_date = gbstart_date;
	}
	public Timestamp getGbend_date() {
		return gbend_date;
	}
	public void setGbend_date(Timestamp gbend_date) {
		this.gbend_date = gbend_date;
	}
	public Integer getGb_status() {
		return gb_status;
	}
	public void setGb_status(Integer gb_status) {
		this.gb_status = gb_status;
	}
	
	
	


}
