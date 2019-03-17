package com.yzy.test;

import com.yzy.dao.OrderitemMapper;
import com.yzy.dao.OrdersMapper;
import com.yzy.dao.ProductMapper;
import com.yzy.pojo.Orderitem;
import com.yzy.pojo.Orders;
import com.yzy.pojo.Product;
import com.yzy.pojo.User;
import com.yzy.service.OrderService;
import com.yzy.utils.CommonsUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring-mybatis.xml")
public class ProductTest {
    @Autowired
    private ProductMapper productMapper;
    @Autowired
    private OrderitemMapper orderitemMapper;
    @Autowired
    private OrdersMapper ordersMapper;
    @Autowired
    private OrderService orderService;
    @Test
    public void getProductTest(){
        List<Product> p=productMapper.getProductBypname("人");
        System.out.println(p);
    }

    @Test
    public void orderTest(){
        Orders order=new Orders();
        User user=new User();
        List<Orderitem> orderitems=new ArrayList<>();


        Orderitem orderitem =new Orderitem();
        orderitem.setItemid(CommonsUtils.getUUID());
        Orderitem orderitem2=new Orderitem();
        orderitem2.setItemid(CommonsUtils.getUUID());
        Orderitem orderitem3=new Orderitem();
        orderitem3.setItemid(CommonsUtils.getUUID());
        orderitems.add(orderitem);
        orderitems.add(orderitem2);
        orderitems.add(orderitem3);


        user.setUid(CommonsUtils.getUUID());
        order.setOid(CommonsUtils.getUUID());
        order.setUser(user);
        order.setTelephone(null);
        order.setName(null);
        order.setAddress(null);
        order.setState(0);
        order.setTotal(100.0);
        order.setOrdertime(new Date());
        order.setOrderitems(orderitems);
        orderService.submitOrder(order);
    }

}
