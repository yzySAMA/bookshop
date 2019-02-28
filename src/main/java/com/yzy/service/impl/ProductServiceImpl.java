package com.yzy.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yzy.dao.ProductMapper;
import com.yzy.pojo.Product;
import com.yzy.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductMapper productMapper;

    /**获得所有商品信息，并返回分页信息*/
    @Override
    public PageInfo<Product> getProducts(Integer pn) {
        PageHelper.startPage(pn,5);
        List<Product> list = productMapper.findAllProduct();
        PageInfo<Product> page = new PageInfo(list,5);
        return page;

    }

    /**根据pid查找商品的信息，用于更新商品的数据展示*/
    @Override
    public Product findProductByPid(String pid) {
        Product product = productMapper.selectByPrimaryKey(pid);
        return product;
    }

    /**更新商品*/
    @Override
    public void productUpdate(Product product) {
        productMapper.updateByPrimaryKeySelective(product);
    }

    /**删除商品*/
    @Override
    public void productDel(String pid) {
        productMapper.deleteByPrimaryKey(pid);
    }


}
