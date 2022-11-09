package com.orderBuy.model.service;

import com.coupon.model.entity.Coupon;
import com.orderBuy.model.entity.OrderBuy;

import java.util.List;

public interface OrderBuyService {

    boolean newOrder(OrderBuy orderBuy);

    boolean removeOrder(Integer orderId);

    boolean updateOrder(OrderBuy orderBuy);

//    boolean computedTotalPrice();

    OrderBuy getOrderById(Integer orderId);

    List<OrderBuy> listAllOrder();


    Integer getNewsCount();

}
