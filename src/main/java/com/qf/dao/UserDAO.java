package com.qf.dao;

import com.qf.pojo.User;
import org.apache.ibatis.annotations.Param;

public interface UserDAO {
    Integer insertUser(User user);
    User findByUserName(String username);
    User findByEmail(String email);
}
