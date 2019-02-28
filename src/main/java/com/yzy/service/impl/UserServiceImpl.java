package com.yzy.service.impl;

import com.yzy.dao.UserMapper;
import com.yzy.pojo.User;
import com.yzy.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    //登陆
    @Override
    public User login(User u) {
        User user=userMapper.login(u);
        return user;
    }

    //注册
    @Override
    public Boolean register(User user) {
        Integer row=userMapper.insertUser(user);
        return row>0?true:false;
    }

    //校验用户名是否存在
    @Override
    public Boolean checkUsername(String username) {
        Integer count=userMapper.checkUsername(username);
        return count>0?true:false;
    }
}
