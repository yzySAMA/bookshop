package com.yzy.service;

import com.yzy.pojo.Orders;

import java.util.List;
import java.util.Map;

public interface OrderService {
    void submitOrder(Orders order);

    void confirmOrder(Orders order);

    void updateOrderState(String r6_order);

    List<Orders> findAllOrders(String uid);

    List<Map<String, Object>> findAllOrderItemByOid(String oid);
}
