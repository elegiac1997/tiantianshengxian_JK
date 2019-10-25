package com.qf.service;

import com.qf.pojo.Cart;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CartService {
    List<Cart> selectCartByUsername(String username);
    void insertGoodsToCart(@Param("uid") Integer uid, @Param("number") Integer number, @Param("g_id") Integer g_id);
}
