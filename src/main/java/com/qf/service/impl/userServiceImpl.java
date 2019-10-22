package com.qf.service.impl;

import com.qf.constant.MyConstant;
import com.qf.dao.UserDAO;
import com.qf.pojo.User;
import com.qf.service.userService;
import org.apache.shiro.crypto.hash.Sha256Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.UUID;

@Service
@Transactional
public class userServiceImpl implements userService {
    @Autowired
    private UserDAO userDAO;

    @Override
    public Integer insertUser(User user) {
        String salt = UUID.randomUUID().toString();
        user.setSalt(salt);
        String s = new Sha256Hash(user.getPassword(),salt, MyConstant.ITERCOUNT).toBase64();
        user.setPassword(s);
        return userDAO.insertUser(user);
    }

    @Override
    public User checkUserName(String username) {
        return userDAO.findByUserName(username);
    }

    @Override
    public User checkEmail(String email) {
        return userDAO.findByEmail(email);
    }
}
