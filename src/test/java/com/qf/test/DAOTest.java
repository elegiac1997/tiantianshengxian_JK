package com.qf.test;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.qf.dao.CartDAO;
import com.qf.dao.GoodsDAO;
import com.qf.dao.UserDAO;
import com.qf.pojo.*;
import com.qf.service.GoodsService;
import com.qf.service.userService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class DAOTest {
    @Autowired
    private UserDAO userDAO;
    @Autowired
    private GoodsDAO goodsDAO;
    @Autowired
    private CartDAO cartDAO;

    @Autowired
    private userService userService;

    @Autowired
    private GoodsService goodsService;
    @Test
    public void testDao(){
        //userDAO.insertUser(new User(null,"测试2","123","854914628@qq.com",new Date(),"aaa"));
//        List<Goods> list = goodsDAO.selectGoodsList();
//        for (Goods goods : list) {
//            System.out.println(goods.toString());
//        }
//        System.out.println(goodsDAO.selectGoodsList().toString());
//        List<Goods> list = goodsDAO.selectALL();
//        for (Goods goods : list) {
//            System.out.println(goods);
//        }
//        for (Goods goods : list) {
//            for (ShowGoods showGood : goods.getShowGoods()) {
//                System.out.println(showGood);
//            }
//
//        }
        //System.out.println(goodsDAO.selectALL().toString());
//        List<Goods> goodsLists = goodsDAO.selectALL();
//        for (Goods goodsList : goodsLists) {
//            System.out.println(goodsList);
//        }

//        List<GoodsList> goodsLists = goodsDAO.selectAll_fruit();
//        for (GoodsList goodsList : goodsLists) {
//            System.out.println(goodsList);
//        }
        //System.out.println(goodsDAO.selectByGtitle("青苹果"));
//

        cartDAO.insertGoodsToCart(6,5,6);

//        System.out.println(cartDAO.selectCartByUsername("jiankun1997").toString());
    }

    @Test
    public void testservice(){
        //userService.insertUser(new User(null,"测试3","123","854914628@qq.com",new Date(),"aaa"));
        //System.out.println(userService.checkUserName("demo02"));
        //System.out.println(userService.checkEmail("854914628@qq.com"));
        List<Goods> list = goodsService.selectGoodsList();
        for (Goods goods : list) {
            System.out.println(goods);
        }
        System.out.println(goodsService.selectGoodsList());
    }
    @Test
    public void fenyetest(){
        PageHelper.startPage(1,3);
        PageHelper.orderBy("creattime");
        List<ShowGoods> showGoods = goodsDAO.selectAll_fruit();
        PageInfo<ShowGoods> p = new PageInfo<ShowGoods>(showGoods);
        for (ShowGoods showGood : showGoods) {
            System.out.println(showGood);
        }
        System.out.println("---------------------");
        System.out.println(p.getPages());
        System.out.println(p.getPageSize());
        System.out.println(p.getPageNum());

    }


}
