package com.yzy.service.impl;

import com.yzy.dao.OrderitemMapper;
import com.yzy.dao.OrdersMapper;
import com.yzy.pojo.Orderitem;
import com.yzy.pojo.Orders;
import com.yzy.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrdersMapper ordersMapper;

    @Autowired
    private OrderitemMapper orderitemMapper;

    @Override
    @Transactional(isolation = Isolation.REPEATABLE_READ,propagation = Propagation.REQUIRED,readOnly = false)
    public void submitOrder(Orders order) {
        ordersMapper.addOrders(order);

        List<Orderitem> orderitems = order.getOrderitems();
        for (Orderitem orderitem : orderitems) {
            orderitemMapper.addOrderitem(orderitem);
        }
    }

    @Override
    public void confirmOrder(Orders order) {
        ordersMapper.updateOrders(order);
    }

    @Override
    public void updateOrderState(String r6_order) {
        ordersMapper.updateOrderState(r6_order);
    }

    @Override
    public List<Orders> findAllOrders(String uid) {
        return ordersMapper.findAllOrders(uid);

    }

    @Override
    public List<Map<String, Object>> findAllOrderItemByOid(String oid) {

        return ordersMapper.findAllOrderItemByOid(oid);
    }
}
