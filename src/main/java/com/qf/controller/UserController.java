package com.qf.controller;

import com.qf.pojo.User;
import com.qf.service.userService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private userService userService;

    Map<String,String> map = new HashMap<String,String>();
    @GetMapping("/register")
    public String registerPage(){
        System.out.println("跳转到注册页面-----");
        return "register";
    }

    @PostMapping("/register")
    public String register(User user){
        userService.insertUser(user);

        return "redirect:index.jsp";
    }

    @RequestMapping(value = "/checkusername")
    @ResponseBody
    public Map<String, String> checkusername(String username){
        System.out.println(username+"=================");
        User user = userService.checkUserName(username);
        System.out.println(user+"------------------");

        if (user!=null){
            map.put("result","1");
        }else {
            map.put("result","0");
        }
        return map;
    }


    @RequestMapping("/checkemail")
    @ResponseBody
    public Map<String, String> checkemail(String email){
        System.out.println("================="+email);
        User user = userService.checkEmail(email);
        System.out.println("------------------"+user);
        Map<String,String> emailMap = new HashMap<String,String>();
        if (user!=null){
            map.put("emailMap","1");
        }else {
            map.put("emailMap","0");
        }
        return map;
    }

}
