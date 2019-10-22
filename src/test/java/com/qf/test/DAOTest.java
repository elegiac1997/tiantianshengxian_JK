package com.qf.test;

import com.qf.dao.UserDAO;
import com.qf.pojo.User;
import com.qf.service.userService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class DAOTest {
    @Autowired
    private UserDAO userDAO;
    @Autowired
    private userService userService;
    @Test
    public void testDao(){
        //userDAO.insertUser(new User(null,"测试2","123","854914628@qq.com",new Date(),"aaa"));

    }

    @Test
    public void testservice(){
        //userService.insertUser(new User(null,"测试3","123","854914628@qq.com",new Date(),"aaa"));
        System.out.println(userService.checkUserName("demo02"));
        System.out.println(userService.checkEmail("854914628@qq.com"));
    }


}
