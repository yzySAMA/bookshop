package com.yzy.service.impl;

import com.yzy.dao.CategoryMapper;
import com.yzy.pojo.Category;
import com.yzy.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    private CategoryMapper categoryMapper;
    @Override
    public List<Category> findCategorys() {
        List<Category> list = categoryMapper.selectByExample(null);
        return list;
    }

    @Override
    public Category findCategoryByCid(String cid) {
        Category category = categoryMapper.selectByPrimaryKey(cid);
        return category;
    }
}
