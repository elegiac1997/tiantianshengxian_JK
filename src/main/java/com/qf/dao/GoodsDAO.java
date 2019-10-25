package com.qf.dao;

import com.qf.pojo.Cart;
import com.qf.pojo.Goods;
import com.qf.pojo.GoodsList;
import com.qf.pojo.ShowGoods;

import java.util.List;

public interface GoodsDAO {
    List<Goods> selectGoodsList();
    List<Goods> selectALL();
    List<GoodsList> selectA();
    List<ShowGoods> selectAll_fruit();
    List<ShowGoods> selectByGtitle(String gtitle);
    List<Cart> selectForCart(String gtitle);


}
