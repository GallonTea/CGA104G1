 package com.group_buy_order.model;


//import java.sql.Date;
import java.sql.Timestamp;
import java.util.Date;

public class Group_Buy_OrderVO implements java.io.Serializable{

	private Integer gborder_id;
	private Integer gbitem_id;
	private Integer gb_id;
	private Integer gbitem_amount;
	private Integer gboriginal_price;
	private Integer discount_id;
	private Integer gb_endprice;
	private Timestamp gborder_date;
	private Integer gborder_paying;
	private Integer gborder_send;
	private Integer gborder_status;
	private String gborder_other;
	private String tracking_num;
	private String receiver_name;
	private String receiver_address;
	private String receiver_phone;
	private Timestamp pickup_time;
	
	public Integer getGborder_id() {
		return gborder_id;
	}
	public void setGborder_id(Integer gborder_id) {
		this.gborder_id = gborder_id;
	}
	public Integer getGbitem_id() {
		return gbitem_id;
	}
	public void setGbitem_id(Integer gbitem_id) {
		this.gbitem_id = gbitem_id;
	}
	public Integer getGb_id() {
		return gb_id;
	}
	public void setGb_id(Integer gb_id) {
		this.gb_id = gb_id;
	}
	public Integer getGbitem_amount() {
		return gbitem_amount;
	}
	public void setGbitem_amount(Integer gbitem_amount) {
		this.gbitem_amount = gbitem_amount;
	}
	public Integer getGboriginal_price() {
		return gboriginal_price;
	}
	public void setGboriginal_price(Integer gboriginal_price) {
		this.gboriginal_price = gboriginal_price;
	}
	public Integer getDiscount_id() {
		return discount_id;
	}
	public void setDiscount_id(Integer discount_id) {
		this.discount_id = discount_id;
	}
	public Integer getGb_endprice() {
		return gb_endprice;
	}
	public void setGb_endprice(Integer gb_endprice) {
		this.gb_endprice = gb_endprice;
	}
	public Timestamp getGborder_date() {
		return gborder_date;
	}
	public void setGborder_date(Timestamp gborder_date) {
		this.gborder_date = gborder_date;
	}
	public Integer getGborder_paying() {
		return gborder_paying;
	}
	public void setGborder_paying(Integer gborder_paying) {
		this.gborder_paying = gborder_paying;
	}
	public Integer getGborder_send() {
		return gborder_send;
	}
	public void setGborder_send(Integer gborder_send) {
		this.gborder_send = gborder_send;
	}
	public Integer getGborder_status() {
		return gborder_status;
	}
	public void setGborder_status(Integer gborder_status) {
		this.gborder_status = gborder_status;
	}
	public String getGborder_other() {
		return gborder_other;
	}
	public void setGborder_other(String gborder_other) {
		this.gborder_other = gborder_other;
	}
	public String getTracking_num() {
		return tracking_num;
	}
	public void setTracking_num(String tracking_num) {
		this.tracking_num = tracking_num;
	}
	public String getReceiver_name() {
		return receiver_name;
	}
	public void setReceiver_name(String receiver_name) {
		this.receiver_name = receiver_name;
	}
	public String getReceiver_address() {
		return receiver_address;
	}
	public void setReceiver_address(String receiver_address) {
		this.receiver_address = receiver_address;
	}
	public String getReceiver_phone() {
		return receiver_phone;
	}
	public void setReceiver_phone(String receiver_phone) {
		this.receiver_phone = receiver_phone;
	}
	public Timestamp getPickup_time() {
		return pickup_time;
	}
	public void setPickup_time(Timestamp pickup_time) {
		this.pickup_time = pickup_time;
	}
	
	
	
	
	
}
