package com.orderBuy.model.service.impl;

import com.orderBuy.model.dao.impl.OrderBuyDAOImpl;
import com.orderBuy.model.dao.OrderBuyDAO;
import com.orderBuy.model.entity.OrderBuy;
import com.orderBuy.model.service.OrderBuyService;

import java.util.List;

public class OrderBuyServiceImpl implements OrderBuyService {

    private OrderBuyDAO dao;

    public OrderBuyServiceImpl() {
        dao = new OrderBuyDAOImpl();
    }

    @Override
    public boolean newOrder(OrderBuy orderBuy) {
        return dao.insert(orderBuy) > 0;
    }

    @Override
    public boolean removeOrder(Integer orderId) {
        return dao.deleteById(orderId) > 0;
    }

    @Override
    public boolean updateOrder(OrderBuy orderBuy) {
        return dao.updateById(orderBuy) > 0;
    }

    @Override
    public OrderBuy getOrderById(Integer orderId) {
        return dao.selectById(orderId);
    }

    @Override
    public List<OrderBuy> listAllOrder() {
        return dao.selectAll();
    }

    @Override
    public Integer getNewsCount() {
        return null;
    }
}
