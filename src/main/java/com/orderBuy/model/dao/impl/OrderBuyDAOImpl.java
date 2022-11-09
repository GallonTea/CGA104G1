package com.orderBuy.model.dao.impl;

import com.orderBuy.model.dao.OrderBuyDAO;
import com.orderBuy.model.entity.OrderBuy;
import org.hibernate.Session;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional(readOnly = true)
public class OrderBuyDAOImpl implements OrderBuyDAO {

    public OrderBuyDAOImpl() {

    }

    @Override
    @Transactional(readOnly = false, propagation = Propagation.REQUIRED)
    public int insert(OrderBuy orderBuy) {
        try {
            beginTransaction();
            getSession().persist(orderBuy);
            commit();
            return 1;
        } catch (Exception e) {
            rollback();
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    @Transactional(readOnly = false, propagation = Propagation.REQUIRED)
    public int deleteById(Integer orderId) {
        try {
            beginTransaction();
            Session session = getSession();
            OrderBuy orderBuy = session.load(OrderBuy.class, orderId);
            session.remove(orderBuy);
            commit();
            return 1;
        } catch (Exception e) {
            rollback();
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    @Transactional(readOnly = false, propagation = Propagation.REQUIRED)
    public int updateById(OrderBuy orderBuy) {
        try {
            beginTransaction();
            Session session = getSession();
            session.merge(orderBuy);
            commit();
            return 1;
        } catch (Exception e) {
            rollback();
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    @Transactional(readOnly = true)
    public OrderBuy selectById(Integer orderId) {
        beginTransaction();
        OrderBuy orderBuy = getSession().get(OrderBuy.class, orderId);
        commit();
        return orderBuy;
    }

    @Override
    @Transactional(readOnly = true)
    public List<OrderBuy> selectAll() {
        List<OrderBuy> list = null;
        try {
            beginTransaction();
            final String sql = "SELECT * FROM order_buy";
            list = getSession()
                    .createNativeQuery(sql, OrderBuy.class)
                    .list();
            commit();
        } catch (Exception e) {
            rollback();
            e.printStackTrace();
        }
        return list;
    }
}
