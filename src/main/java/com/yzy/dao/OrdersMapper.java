package com.yzy.dao;

import com.yzy.pojo.Orderitem;
import com.yzy.pojo.Orders;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface OrdersMapper {

    void addOrders(Orders order);

    void updateOrders(Orders order);

    void updateOrderState(@Param("oid") String r6_order);

    List<Orders> findAllOrders(String uid);

    List<Map<String, Object>> findAllOrderItemByOid(String oid);
}