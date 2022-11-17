package com.memberCoupon.model.service;

import com.memberCoupon.model.entity.MemberCoupon;
import org.json.JSONArray;

import java.sql.SQLException;
import java.util.List;

public interface MemberCouponService {

    boolean getCoupon(MemberCoupon memberCoupon);


    boolean updateCouponStatus(MemberCoupon memberCoupon);

    MemberCoupon getCouponById(Integer couponId);

    JSONArray getOwnCoupon(Integer memId);

    List<MemberCoupon> getOwnCoupon(Integer memId, Integer couponId);

    List<MemberCoupon> listAllCoupon();

    List<MemberCoupon> listOwnCoupon(Integer memId);

    Integer getNewsCount();

    MemberCoupon updateCouponStatus(Integer memberId, Integer couponId, byte status);
}
