package com.yzy.test;

import com.yzy.dao.ProductMapper;
import com.yzy.pojo.Product;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring-mybatis.xml")
public class ProductTest {
    @Autowired
    private ProductMapper productMapper;

    @Test
    public void getProductTest(){
        List<Product> p=productMapper.getProductBypname("人");
        System.out.println(p);
    }

}
