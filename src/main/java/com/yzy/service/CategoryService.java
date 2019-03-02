package com.yzy.service;

import com.yzy.pojo.Category;

import java.util.List;

public interface CategoryService {
    List<Category> findCategorys();

    Category findCategoryByCid(String cid);
}
