package com.yzy.test;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yzy.dao.CategoryMapper;
import com.yzy.dao.ProductMapper;
import com.yzy.dao.UserMapper;
import com.yzy.pojo.Category;
import com.yzy.pojo.Product;
import com.yzy.pojo.User;
import com.yzy.pojo.UserExample;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import java.util.ArrayList;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring-mybatis.xml")
public class MapperTest {
    @Autowired
    private UserMapper userMapper;

    @Autowired
    private ProductMapper productMapper;

    @Autowired
    private CategoryMapper categoryMapper;
    /*@Autowired
    SqlSession sqlSession;*/
    @Test
    public void test1(){
        UserExample example=new UserExample();
        UserExample.Criteria criteria = example.createCriteria();
        List<User> users = userMapper.selectByExample(null);
        for (User user : users) {
            System.out.println(user);
        }
    }

    @Test
    public void test2(){
        PageHelper.startPage(1,3);
        List<Category> list = categoryMapper.selectByExample(null);
        PageInfo page = new PageInfo(list);
        System.out.println(page);
    }

/*    @Test
    public void test3(){
        ProductMapper mapper = sqlSession.getMapper(ProductMapper.class);
        for (int i=0;i<100;i++){
            String uuid = CommonsUtils.getUUID()+i;
            mapper.insertSelective(new Product(uuid,"读物"+i,100.0,"/1.jpg","好看","1"));
        }

    }*/
}
