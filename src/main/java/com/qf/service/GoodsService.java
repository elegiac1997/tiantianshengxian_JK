package com.qf.service;

import com.qf.pojo.Goods;
import com.qf.pojo.GoodsList;
import com.qf.pojo.ShowGoods;

import java.util.List;

public interface GoodsService {
    List<Goods> selectGoodsList();
    List<Goods> selectALL();
    List<GoodsList> selectA();
    List<ShowGoods> selectAll_fruit();
}
