package com.coupon.controller;

import com.coupon.model.service.CouponService;
import com.coupon.model.service.impl.CouponServiceImpl;
import org.json.JSONArray;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "listAllCouponServlet", value = "/listAllCouponServlet")
public class listAllCouponServlet extends HttpServlet {

    private CouponService service;

    @Override
    public void init() throws ServletException {
        service = new CouponServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        res.setCharacterEncoding("UTF-8");

        req.setCharacterEncoding("UTF-8");

        res.setContentType("text/html;charset=utf-8");

        PrintWriter pw = res.getWriter();

        CouponService couponService = new CouponServiceImpl();
        JSONArray array = couponService.listAllCouponJSON();

        pw.println(array);
    }
}
