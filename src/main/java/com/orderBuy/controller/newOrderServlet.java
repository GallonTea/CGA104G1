package com.orderBuy.controller;

import com.commodityDetails.model.entity.CommodityDetails;
import com.commodityDetails.model.service.CommodityDetailsService;
import com.commodityDetails.model.service.impl.CommodityDetailsServiceImpl;
import com.coupon.model.entity.Coupon;
import com.coupon.model.service.CouponService;
import com.coupon.model.service.impl.CouponServiceImpl;
import com.item.model.ItemVO;
import com.memberCoupon.model.service.impl.MemberCouponServiceImpl;
import com.memberCoupon.model.service.MemberCouponService;
import com.orderBuy.model.entity.OrderBuy;
import com.orderBuy.model.service.impl.OrderBuyServiceImpl;
import com.orderBuy.model.service.OrderBuyService;
import com.item.model.ItemService;
import org.json.JSONArray;
import org.json.JSONObject;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import static java.lang.System.out;

@WebServlet(name = "newOrderServlet", value = "/newOrderServlet")
public class newOrderServlet extends HttpServlet {


    private OrderBuyService service;

    @Override
    public void init() throws ServletException {
        service = new OrderBuyServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        doPost(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {


        Integer memberId = null;
        memberId = Integer.valueOf(req.getParameter("memberId"));

        Integer couponId = null;
        couponId = Integer.valueOf(req.getParameter("couponId"));


        Byte orderPaying = null;
        orderPaying = Byte.valueOf(req.getParameter("orderPaying"));

        Byte orderSend = null;
        orderSend = Byte.valueOf(req.getParameter("orderSend"));

        String orderOther = req.getParameter("orderOther");

        String receiverName = req.getParameter("receiverName");

        String receiverAddress = req.getParameter("receiverAddress");

        String receiverPhone = req.getParameter("receiverPhone");


        JSONArray jsonArr;
        String dataArr = req.getParameter("dataArr");

        Map<Integer, Integer> items = new HashMap<Integer, Integer>();
        Map<Integer, Integer> orderItems = new HashMap<Integer, Integer>();
        Map<Integer, Integer> itemPrices = new HashMap<Integer, Integer>();
        Map<Integer, String> itemNames = new HashMap<Integer, String>();

        ItemService itemSvc = new ItemService();

        Double originalPrice = 0.0;
        Double discountPrice;
        Double finalPrice = 0.0;

        CouponService couponSvc = new CouponServiceImpl();
        Coupon coupon = couponSvc.getCouponById(couponId);
        discountPrice = coupon.getCouponVal();

        try {
            jsonArr = new JSONArray(dataArr);
            for (int i = 0; i < jsonArr.length(); i++) {

                JSONObject tmp = (JSONObject) jsonArr.get(i);

                Integer itemId = tmp.getInt("itemId");

                Integer cdAmount = tmp.getInt("cdAmount");
                ItemVO item = itemSvc.getItem(itemId);

                Integer itemPrice = item.getItemPrice();
                String itemName = item.getItemName();

                items.put(itemId, itemId);
                orderItems.put(itemId, cdAmount);
                itemPrices.put(itemId, itemPrice);
                itemNames.put(itemId, itemName);

                /**
                 * 計算訂單金額
                 * @param itemId: 商品編號
                 * @param itemPrice: 商品價格
                 * @param cdAmount: 商品數量
                 * @param originalPrice: 原始總價
                 * @param discountPrice: 折扣價格
                 * @param finalPrice: 最終價格
                 */
                originalPrice += itemPrice * cdAmount;
            }

        } catch (Exception e) {
            out.println("ERROR: " + e.getMessage());
        }
        try {
            finalPrice = originalPrice - discountPrice;
        } catch (Exception e) {
            out.println("ERROR: " + e.getMessage());
        }
        Long datetime = System.currentTimeMillis();

        Timestamp timestamp = new Timestamp(datetime);


        // 寫入資料庫

        OrderBuy orderBuy = new OrderBuy();
        orderBuy.setMemId(memberId);
        orderBuy.setOriginalPrice(originalPrice);
        orderBuy.setDiscountPrice(discountPrice);
        orderBuy.setFinalPrice(finalPrice);
        orderBuy.setOrderDate(timestamp);
        orderBuy.setOrderPaying(orderPaying);
        orderBuy.setOrderSend(orderSend);
        orderBuy.setOrderStatus((byte) 0);
        orderBuy.setOrderOther(orderOther);
        orderBuy.setReceiverName(receiverName);
        orderBuy.setReceiverAddress(receiverAddress);
        orderBuy.setReceiverPhone(receiverPhone);

        // 新增商品訂單
        OrderBuyService orderBuySvc = new OrderBuyServiceImpl();
        orderBuySvc.newOrder(orderBuy);
        Integer orderId = orderBuy.getOrderId();

        MemberCouponService memberCouponSvc = new MemberCouponServiceImpl();
        // 將優惠券切換為 1: 已使用
        memberCouponSvc.updateCouponStatus(1, memberId);

        Integer itemId;
        String itemName;
        Integer itemPrice;
        Integer cdAmount;

        CommodityDetails commodityDetails = new CommodityDetails();

        for (Integer i : itemNames.keySet()) {

            itemId = items.get(i);
            itemName = itemNames.get(i);
            itemPrice = itemPrices.get(i);
            cdAmount = orderItems.get(i);

            commodityDetails.setOrderId(orderId);
            commodityDetails.setItemId(itemId);
            commodityDetails.setItemName(itemName);
            commodityDetails.setCdAmount(cdAmount);
            commodityDetails.setItemPrice(Double.valueOf(itemPrice));

            CommodityDetailsService commodityDetailsSvc = new CommodityDetailsServiceImpl();
            commodityDetailsSvc.addDetails(commodityDetails);

        }

    }
}

