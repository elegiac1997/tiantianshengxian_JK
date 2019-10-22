package com.qf.dao;

import com.qf.pojo.User;

public interface UserDAO {
    Integer insertUser(User user);
    User findByUserName(String username);
    User findByEmail(String email);

}
