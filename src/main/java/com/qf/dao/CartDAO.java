package com.qf.dao;

import com.qf.pojo.Cart;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CartDAO {
    List<Cart> selectCartByUsername(String username);
    void insertGoodsToCart(@Param("uid") Integer uid,@Param("number") Integer number,@Param("g_id") Integer g_id);
}
