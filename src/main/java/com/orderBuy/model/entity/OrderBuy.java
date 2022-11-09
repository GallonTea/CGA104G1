package com.orderBuy.model.entity;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "order_buy", schema = "ba_rei", catalog = "")
public class OrderBuy {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "ORDER_ID")
    private Integer orderId;
    @Basic
    @Column(name = "MEM_ID")
    private Integer memId;
    @Basic
    @Column(name = "ORIGINAL_PRICE")
    private Double originalPrice;
    @Basic
    @Column(name = "DISCOUNT_PRICE")
    private Double discountPrice;
    @Basic
    @Column(name = "FINAL_PRICE")
    private Double finalPrice;
    @Basic
    @Column(name = "ORDER_DATE")
    private Timestamp orderDate;
    @Basic
    @Column(name = "ORDER_PAYING")
    private Byte orderPaying;
    @Basic
    @Column(name = "ORDER_SEND")
    private Byte orderSend;
    @Basic
    @Column(name = "ORDER_STATUS")
    private Byte orderStatus;
    @Basic
    @Column(name = "ORDER_OTHER")
    private String orderOther;
    @Basic
    @Column(name = "TRACKING_NUM")
    private String trackingNum;
    @Basic
    @Column(name = "RECEIVER_NAME")
    private String receiverName;
    @Basic
    @Column(name = "RECEIVER_ADDRESS")
    private String receiverAddress;
    @Basic
    @Column(name = "RECEIVER_PHONE")
    private String receiverPhone;
    @Basic
    @Column(name = "PICKUP_TIME")
    private Timestamp pickupTime;

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getMemId() {
        return memId;
    }

    public void setMemId(Integer memId) {
        this.memId = memId;
    }

    public Double getOriginalPrice() {
        return originalPrice;
    }

    public void setOriginalPrice(Double originalPrice) {
        this.originalPrice = originalPrice;
    }

    public Double getDiscountPrice() {
        return discountPrice;
    }

    public void setDiscountPrice(Double discountPrice) {
        this.discountPrice = discountPrice;
    }

    public Double getFinalPrice() {
        return finalPrice;
    }

    public void setFinalPrice(Double finalPrice) {
        this.finalPrice = finalPrice;
    }

    public Timestamp getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Timestamp orderDate) {
        this.orderDate = orderDate;
    }

    public byte getOrderPaying() {
        return orderPaying;
    }

    public void setOrderPaying(byte orderPaying) {
        this.orderPaying = orderPaying;
    }

    public byte getOrderSend() {
        return orderSend;
    }

    public void setOrderSend(byte orderSend) {
        this.orderSend = orderSend;
    }

    public byte getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(byte orderStatus) {
        this.orderStatus = orderStatus;
    }

    public String getOrderOther() {
        return orderOther;
    }

    public void setOrderOther(String orderOther) {
        this.orderOther = orderOther;
    }

    public String getTrackingNum() {
        return trackingNum;
    }

    public void setTrackingNum(String trackingNum) {
        this.trackingNum = trackingNum;
    }

    public String getReceiverName() {
        return receiverName;
    }

    public void setReceiverName(String receiverName) {
        this.receiverName = receiverName;
    }

    public String getReceiverAddress() {
        return receiverAddress;
    }

    public void setReceiverAddress(String receiverAddress) {
        this.receiverAddress = receiverAddress;
    }

    public String getReceiverPhone() {
        return receiverPhone;
    }

    public void setReceiverPhone(String receiverPhone) {
        this.receiverPhone = receiverPhone;
    }

    public Timestamp getPickupTime() {
        return pickupTime;
    }

    public void setPickupTime(Timestamp pickupTime) {
        this.pickupTime = pickupTime;
    }


}
