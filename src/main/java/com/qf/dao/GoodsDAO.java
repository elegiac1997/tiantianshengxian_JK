package com.qf.dao;

import com.qf.pojo.Goods;
import com.qf.pojo.GoodsList;

import java.util.List;

public interface GoodsDAO {
    List<Goods> selectGoodsList();
    List<Goods> selectALL();
    List<GoodsList> selectA();

}
