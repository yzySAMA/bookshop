package com.yzy.service;

import com.github.pagehelper.PageInfo;
import com.yzy.pojo.Product;

import java.util.List;


public interface ProductService {
    //返回商品列表的分页信息
    PageInfo<Product> getProducts(Integer pn);

    /**根据pid查找商品的信息，用于更新商品的数据展示*/
    Product findProductByPid(String pid);

    //更新商品
    void productUpdate(Product product);

    /**删除商品*/
    void productDel(String pid);

    /**添加商品*/
    void productAdd(Product product);

    /**首页商品展示*/
    List<Product> findHotProduct();

    /**同种类型的商品展示*/
    List<Product> productInfoByCid(String cid);
}
