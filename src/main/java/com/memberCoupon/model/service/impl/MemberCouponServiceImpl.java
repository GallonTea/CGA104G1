package com.memberCoupon.model.service.impl;

import com.memberCoupon.model.dao.impl.MemberCouponDAOImpl;
import com.memberCoupon.model.dao.MemberCouponDAO;
import com.memberCoupon.model.entity.MemberCoupon;
import com.memberCoupon.model.service.MemberCouponService;
import org.json.JSONArray;

import java.sql.Timestamp;
import java.util.List;

public class MemberCouponServiceImpl implements MemberCouponService {

    private MemberCouponDAO dao;


    @Override
    public boolean getCoupon(MemberCoupon memberCoupon) {
        MemberCouponDAO memberCouponDAO = new MemberCouponDAOImpl();
        return memberCouponDAO.insert(memberCoupon) > 0;
    }

    @Override
    public boolean updateCouponStatus(MemberCoupon memberCoupon) {
        return dao.updateById(memberCoupon) > 0;
    }

    @Override
    public MemberCoupon getCouponById(Integer couponId) {
        return dao.getByCouponId(couponId);
    }

    @Override
    public JSONArray getOwnCoupon(Integer memId) {
        MemberCouponDAO memberCouponDAO = new MemberCouponDAOImpl();
        return memberCouponDAO.listById(memId);
    }

    @Override
    public List<MemberCoupon> getOwnCoupon(Integer memId, Integer couponId) {
        return dao.getByMemIdCouponId(memId, couponId);
    }

    @Override
    public List<MemberCoupon> listAllCoupon() {
        return dao.selectAll();
    }

    @Override
    public List<MemberCoupon> listOwnCoupon(Integer memId) {
        MemberCouponDAO memberCouponDAO = new MemberCouponDAOImpl();
        return memberCouponDAO.getDetail(memId);
    }

    @Override
    public Integer getNewsCount() {
        return null;
    }

    @Override
    public MemberCoupon updateCouponStatus(Integer memberId, Integer couponId) {
        MemberCouponDAO memberCouponDAO = new MemberCouponDAOImpl();
        MemberCoupon memberCoupon = new MemberCoupon();
        List<MemberCoupon> list = memberCouponDAO.getByMemIdCouponId(memberId, couponId);

        Timestamp date = null;
        for (MemberCoupon coupon : list) {
            date = coupon.getMcpnGettime();
        }

        memberCoupon.setCouponId(couponId);
        memberCoupon.setMemId(memberId);
        memberCoupon.setMcpnGettime(date);
        memberCoupon.setMcpnUse((byte) 1);
        return memberCoupon;
    }
}
