package com.qf.service.impl;

import com.qf.dao.GoodsDAO;
import com.qf.pojo.Goods;
import com.qf.pojo.GoodsList;
import com.qf.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class GoodServiceImpl implements GoodsService {
    @Autowired
    private GoodsDAO goodsDAO;


    @Override
    public List<Goods> selectGoodsList() {
        return goodsDAO.selectGoodsList();
    }

    @Override
    public List<Goods> selectALL() {
        return goodsDAO.selectALL();
    }

    @Override
    public List<GoodsList> selectA() {
        return goodsDAO.selectA();
    }
}
