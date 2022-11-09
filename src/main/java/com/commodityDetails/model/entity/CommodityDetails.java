package com.commodityDetails.model.entity;

import javax.persistence.*;

@Entity
@Table(name = "commodity_details", schema = "ba_rei", catalog = "")
@IdClass(CommodityDetailsPK.class)
public class CommodityDetails {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "ORDER_ID")
    private Integer orderId;
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "ITEM_ID")
    private Integer itemId;
    @Basic
    @Column(name = "ITEM_NAME")
    private String itemName;
    @Basic
    @Column(name = "CD_AMOUNT")
    private Integer cdAmount;
    @Basic
    @Column(name = "ITEM_PRICE")
    private Double itemPrice;

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getItemId() {
        return itemId;
    }

    public void setItemId(Integer itemId) {
        this.itemId = itemId;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public Integer getCdAmount() {
        return cdAmount;
    }

    public void setCdAmount(Integer cdAmount) {
        this.cdAmount = cdAmount;
    }

    public Double getItemPrice() {
        return itemPrice;
    }

    public void setItemPrice(Double itemPrice) {
        this.itemPrice = itemPrice;
    }

}
