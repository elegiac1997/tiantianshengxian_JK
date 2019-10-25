package com.qf.service.impl;

import com.qf.dao.CartDAO;
import com.qf.pojo.Cart;
import com.qf.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class CartServiceImpl implements CartService {

    @Autowired
    private CartDAO cartDAO;


    @Override
    public List<Cart> selectCartByUsername(String username) {
        return cartDAO.selectCartByUsername(username);
    }

    @Override
    public void insertGoodsToCart(Integer uid, Integer number, Integer g_id) {
        cartDAO.insertGoodsToCart(uid,number,g_id);
    }
}
