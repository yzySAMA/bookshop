package com.yzy.service;

import com.yzy.pojo.User;

public interface UserService {
    //登陆
    User login(User u);

    //注册
    Boolean register(User user);

    //校验用户名是否存在
    Boolean checkUsername(String username);
}
