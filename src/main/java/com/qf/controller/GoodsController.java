package com.qf.controller;

import com.qf.pojo.Goods;
import com.qf.pojo.GoodsList;
import com.qf.pojo.ShowGoods;
import com.qf.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/goods")
public class GoodsController {

    @Autowired
    private GoodsService goodsService;

    @GetMapping("/typelist")
    public String selectGoodsType(HttpServletRequest request){
        List<Goods> goodslist = goodsService.selectGoodsList();
        for (Goods goods : goodslist) {
            System.out.println(goods);
        }
        request.setAttribute("goodslist",goodslist);
        return "goodslist";
    }

    @GetMapping("/sgoods")
    public String selecyALL(HttpServletRequest request){
        List<Goods> goods = goodsService.selectALL();
//        System.out.println("-----------------=====");
//
//
//        for (Goods good : goods) {
//            List<ShowGoods> showGoods = good.getShowGoods();
//            request.setAttribute("showgoods",showGoods);
//            for (ShowGoods showGood : showGoods) {
//                System.out.println(showGood);
//                System.out.println("111111111111");
//            }
//        }


        //request.setAttribute("goods",goods);
        //request.setAttribute("showgoods",showGoods);

        List<GoodsList> showgoods = goodsService.selectA();
        request.setAttribute("goods",goods);
        return "showgoods";
    }

}
