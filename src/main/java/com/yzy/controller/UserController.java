package com.yzy.controller;

import com.yzy.pojo.User;
import com.yzy.service.UserService;
import com.yzy.utils.CommonsUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Vector;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/{page}")
    public String page(@PathVariable String page){
        return page;
    }

    /**无法直接访问后台网页*/
    @RequestMapping("admin")
    public String adminError(){
        return "error";
    }

    /**登陆*/
    @RequestMapping("/login.do")
    public String login(User u, Model model, HttpSession session){
        User user=userService.login(u);
        if(user==null){
            //登陆失败
            String loginInfo="用户名或密码错误";
            model.addAttribute("loginInfo",loginInfo);
            return "login";
        }else {
            //登陆成功
        session.setAttribute("user",user);
        return "redirect:/index.jsp";
        }
    }

    /**注册*/
    @RequestMapping("/register.do")
    public String register(User user){
        String uid= CommonsUtils.getUUID();
        user.setUid(uid);
        Boolean isRegister=userService.register(user);
        if(isRegister){
            return "success";
        }else{
            return "register";
        }
    }

    /**检验用户名是否存在*/
    @RequestMapping("/checkUsername")
    public @ResponseBody
    Boolean checkUsername(  String username){
        System.out.println(username);
        Boolean isExist=userService.checkUsername(username);
        System.out.println(isExist);
        return isExist;
    }

    @RequestMapping("/adminLogin.do")
    public String adminLogin( User u,Model model){
        User user=userService.login(u);
        if(user!=null&&"admin".equals(user.getUsername())&&"123456".equals(user.getPassword())){

            return "redirect:productInfo.do";
        }else{
            //登陆失败
            String loginInfo="用户名或密码错误";
            model.addAttribute("loginInfo",loginInfo);
            return "admin_login";
        }
    }
}
