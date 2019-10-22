package com.qf.service;

import com.qf.pojo.User;

public interface userService {
    Integer insertUser(User user);
    User checkUserName(String username);
    User checkEmail(String email);
}
