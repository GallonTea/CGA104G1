package com.coupon.model.entity;

import javax.persistence.*;
import java.sql.Date;

@Entity
public class Coupon {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "COUPON_ID")
    private Integer couponId;
    @Basic
    @Column(name = "COUPON_NAR")
    private String couponNar;
    @Basic
    @Column(name = "COUPON_VAL")
    private Double couponVal;
    @Basic
    @Column(name = "RECEIVE_START")
    private Date receiveStart;
    @Basic
    @Column(name = "RECEIVE_OVER")
    private Date receiveOver;
    @Basic
    @Column(name = "USE_START")
    private Date useStart;
    @Basic
    @Column(name = "USE_OVER")
    private Date useOver;
    @Basic
    @Column(name = "MINIMUM")
    private Double minimum;

    public Integer getCouponId() {
        return couponId;
    }

    public void setCouponId(Integer couponId) {
        this.couponId = couponId;
    }

    public String getCouponNar() {
        return couponNar;
    }

    public void setCouponNar(String couponNar) {
        this.couponNar = couponNar;
    }

    public Double getCouponVal() {
        return couponVal;
    }

    public void setCouponVal(Double couponVal) {
        this.couponVal = couponVal;
    }

    public Date getReceiveStart() {
        return receiveStart;
    }

    public void setReceiveStart(Date receiveStart) {
        this.receiveStart = receiveStart;
    }

    public Date getReceiveOver() {
        return receiveOver;
    }

    public void setReceiveOver(Date receiveOver) {
        this.receiveOver = receiveOver;
    }

    public Date getUseStart() {
        return useStart;
    }

    public void setUseStart(Date useStart) {
        this.useStart = useStart;
    }

    public Date getUseOver() {
        return useOver;
    }

    public void setUseOver(Date useOver) {
        this.useOver = useOver;
    }

    public Double getMinimum() {
        return minimum;
    }

    public void setMinimum(Double minimum) {
        this.minimum = minimum;
    }

}
