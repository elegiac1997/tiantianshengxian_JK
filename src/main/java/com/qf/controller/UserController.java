package com.qf.controller;

import com.mchange.lang.ShortUtils;
import com.qf.constant.MyConstant;
import com.qf.pojo.User;
import com.qf.service.userService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.Sha256Hash;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.servlet.SimpleCookie;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private userService userService;

    private String kkk = "2";

    Map<String,String> map = new HashMap<String,String>();

    @GetMapping("/index")
    public String indexPage(){
        System.out.println("跳转到主页——————————————");
        return "index";
    }

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

    @GetMapping("/login")
    public String loginPage(String checkboxr){
        System.out.println("跳转到登录界面------");
        return "login";
    }

    @PostMapping("/login")
    public String login(String checkboxr,User user) throws Exception{
        if (checkboxr!=null){
            kkk = checkboxr;
            System.out.println("------------"+kkk);
        }
        String u = user.getUsername();
        String regExp = "^[a-z0-9][\\w\\.\\-]*@[a-z0-9\\-]+(\\.[a-z]{2,5}){1,2}$";
//        Pattern p = Pattern.compile(regExp);
//        Matcher m = p.matcher(u);
//        if (m.matches()){
        if (Pattern.compile(regExp).matcher(u).matches()){
            System.out.println(kkk+"-------------------------------");
            System.out.println("使用邮箱登录-------");
            //获取subject 调用login
            Subject subject = SecurityUtils.getSubject();
            // 创建用于登录的令牌
            UsernamePasswordToken token = new UsernamePasswordToken(userService.checkEmail(user.getUsername()).getUsername(), user.getPassword());

            if (kkk.equals("1")) {
                System.out.println("开启记住我");
                //记住我
                token.setRememberMe(true);
                SimpleCookie simpleCookie =new SimpleCookie("remembershiro");
                simpleCookie.setHttpOnly(true);
                simpleCookie.setMaxAge(3*60*60);
            }
            // 登录失败会抛出异常，则交由异常解析器处理
            subject.login(token);
            return "index";
        }else {
            System.out.println(kkk+"-------------------------------");
            System.out.println("使用用户名登录-------");
            //获取subject 调用login
            Subject subject = SecurityUtils.getSubject();
            // 创建用于登录的令牌
            UsernamePasswordToken token = new UsernamePasswordToken(user.getUsername(), user.getPassword());
            if (kkk.equals("1")) {
                System.out.println("开启记住我");
                //记住我
                token.setRememberMe(true);
                SimpleCookie simpleCookie =new SimpleCookie("remembershiro");
                simpleCookie.setHttpOnly(true);
                simpleCookie.setMaxAge(3*60*60);
            }

            // 登录失败会抛出异常，则交由异常解析器处理
            try {
                subject.login(token);
            }catch (Exception e){
                return "login";
            }
            return "index";
        }
//        Subject subject = SecurityUtils.getSubject();
//        //创建登录用的令牌
//        UsernamePasswordToken token = new UsernamePasswordToken(username,password);
//        token.setRememberMe(true);//记住我
//
//        subject.login(token);
//        return "index";
    }


    @RequestMapping("/logout")
    public String logout(){
        SecurityUtils.getSubject().logout();
        return "login";
    }





    @RequestMapping(value = "/checkusername")
    @ResponseBody
    public Map<String, String> checkusername(String username){
        User user = userService.checkUserName(username);

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
        User user = userService.checkEmail(email);
        Map<String,String> emailMap = new HashMap<String,String>();
        if (user!=null){
            map.put("emailMap","1");
        }else {
            map.put("emailMap","0");
        }
        return map;
    }

    @RequestMapping("/checkcode")
    @ResponseBody
    public Map<String,String> captcha(String captchainput,HttpSession session){
        String captcha = (String) session.getAttribute("captcha");
        System.out.println("--------captcha:"+captcha);
        System.out.println("captcha_input:--------"+captchainput);
        System.out.println(captchainput.equalsIgnoreCase(captcha));
        if (captchainput.equalsIgnoreCase(captcha)){
            System.out.println("验证码正确");
            map.put("captcha_check","1");
        }else {
            System.out.println("验证码错误");
            map.put("captcha_check","0");
        }
        return map;
    }

}
