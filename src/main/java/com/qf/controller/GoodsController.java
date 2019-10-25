package com.qf.controller;

import com.alibaba.druid.util.StringUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.qf.pojo.Goods;
import com.qf.pojo.GoodsList;
import com.qf.pojo.ShowGoods;
import com.qf.service.GoodsService;
import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import javax.servlet.http.HttpServletRequest;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

@Controller
@RequestMapping("/goods")
public class GoodsController {

    @Autowired
    private GoodsService goodsService;
//
//    private Integer timestatus = 0;

    @GetMapping("/typelist")
    public String selectGoodsType(HttpServletRequest request){
        List<Goods> goodslist = goodsService.selectGoodsList();
        request.setAttribute("goodslist",goodslist);
        return "goodslist";
    }

    @GetMapping("/sgoods")
    public String selecyALL(HttpServletRequest request){
        List<Goods> goods = goodsService.selectALL();
        List<GoodsList> showgoods = goodsService.selectA();
        request.setAttribute("goods",goods);
        return "showgoods";
    }

    @GetMapping("/goodsmessage")
    public String selectGoodsMessage(String sendgtitle,HttpServletRequest request){
        System.out.println(sendgtitle+"-----------===========-----------======");
        System.out.println(goodsService.selectByGtitle(sendgtitle));
        List<ShowGoods> goodsmessage = goodsService.selectByGtitle(sendgtitle);
        request.setAttribute("goodsmessage",goodsmessage);
        return "detail";
    }


    @GetMapping("/list")
    public String selectAll_fruit(String timechange,HttpServletRequest request){
//        System.out.println(timechange+"--------------------------");
//        System.out.println(request.getUserPrincipal().getName()+"获取用户名------------");


        if (timechange==null){
            timechange = "desc";
        }
        String _pageNum = request.getParameter("pageNum");
        String _pageSize = request.getParameter("pageSize");

        int pageNum = 1;
        int pageSize = 10;

        if (!StringUtils.isEmpty(_pageNum)){
            pageNum = Integer.parseInt(_pageNum);
            if (pageNum<1){
                pageNum = 1;
            }
        }
        if (!StringUtils.isEmpty(_pageSize)){
            pageSize = Integer.parseInt(_pageSize);
            if (pageSize<1){
                pageSize = 10;
            }
        }


        PageHelper.startPage(pageNum,pageSize);
//        System.out.println("====================="+timechange);
//        PageHelper.orderBy("creattime "+timechange);
        if (timechange.equals("asc")){
            PageHelper.orderBy("creattime asc");
//            System.out.println("-------------------"+"asc");
            request.getSession().setAttribute("timechange","asc");
        }
        if (timechange.equals("desc")){
            PageHelper.orderBy("creattime desc");
//            System.out.println("=================desc");
            request.getSession().setAttribute("timechange","desc");
        }
        if (timechange.equals("price_asc")){
            PageHelper.orderBy("price asc");
            request.getSession().setAttribute("timechange","price_asc");
        }
        if (timechange.equals("price_desc")){
            PageHelper.orderBy("price desc");
            request.getSession().setAttribute("timechange","price_desc");
        }

        List<ShowGoods> goodsLists = goodsService.selectAll_fruit();

        PageInfo<ShowGoods> pageInfo = new PageInfo<ShowGoods>(goodsLists);


        System.out.println(goodsLists);
        request.setAttribute("page",pageInfo);

        request.setAttribute("fylist",goodsLists);

        return "list";
    }

}
