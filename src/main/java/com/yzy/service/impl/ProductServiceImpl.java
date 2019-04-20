package com.yzy.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yzy.dao.ProductMapper;
import com.yzy.pojo.Product;
import com.yzy.pojo.ProductExample;
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
        PageHelper.startPage(pn,10);
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

    /**添加商品*/
    @Override
    public void productAdd(Product product) {
        productMapper.insertSelective(product);
    }

    /**首页商品展示*/
    @Override
    public List<Product> findHotProduct() {
        return productMapper.findIndexProduct();
    }

    /**同种类型的商品展示*/
    @Override
    public List<Product> productInfoByCid(String cid) {
        ProductExample example=new ProductExample();
        ProductExample.Criteria criteria = example.createCriteria();
        criteria.andCidEqualTo(cid);
        List<Product> list = productMapper.selectByExample(example);
        return list;
    }

    /**根据商品名模糊查询*/
    @Override
    public List<Product> getProductBypname(String pname) {
        List<Product> products=productMapper.getProductBypname(pname);
        return products;
    }

    @Override
    public List<Product> findProductByPname(String pname) {
        ProductExample example=new ProductExample();
        ProductExample.Criteria criteria = example.createCriteria();
        pname="%"+pname+"%";
        criteria.andPnameLike(pname);
        List<Product> products = productMapper.selectByExample(example);
        return products;
    }

    @Override
    public PageInfo<Product> searchByPname(Integer pn, String pname) {
        /*PageHelper.startPage(pn,10);
        List<Product> list = productMapper.findAllProduct();
        PageInfo<Product> page = new PageInfo(list,5);
        return page;*/
        PageHelper.startPage(pn,5);
        ProductExample example=new ProductExample();
        ProductExample.Criteria criteria = example.createCriteria();
        criteria.andPnameLike("%"+pname+"%");
        List<Product> list = productMapper.selectByExample(example);
        PageInfo<Product> page = new PageInfo(list,5);
        return page;
    }


}
