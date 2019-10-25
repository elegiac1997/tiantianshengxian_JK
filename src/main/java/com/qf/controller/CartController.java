package com.qf.controller;

import com.qf.pojo.Cart;
import com.qf.pojo.ShowGoods;
import com.qf.service.CartService;
import com.qf.service.userService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/cart")
public class CartController {
    @Autowired
    private CartService cartService;

    @Autowired
    private userService userService;



    @GetMapping("cartlist")
    public String selectCartByUseranem(HttpServletRequest request){
        String username = request.getUserPrincipal().getName();
        System.out.println("cart ------------ -------- username -----------3" +
                "" +
                ""+username);
        List<Cart> cartList = cartService.selectCartByUsername(username);
        double zongjia_num = 0;
        Integer number_num = 0;
        for (Cart cart : cartList) {
            List<ShowGoods> showGoods = cart.getShowGoods();
            for (ShowGoods showGood : showGoods) {
                double price = Double.parseDouble(showGood.getPrice());
                Integer numeber = cart.getNumber();
                double zongjia = price * numeber;
                zongjia_num += zongjia;
                number_num += numeber;
                cart.setZongjia(zongjia);
            }
            cart.setZongjia_num(zongjia_num);
            cart.setNumeber_num(number_num);
        }
        System.out.println(cartList);
        request.setAttribute("cartlist",cartList);
        return "cart";
    }


    @GetMapping("/cartnum")
    public String cartnum(HttpServletRequest request){
        String username = request.getUserPrincipal().getName();
        List<Cart> cartList = cartService.selectCartByUsername(username);
        Integer number_num = 0;
        for (Cart cart : cartList) {
            List<ShowGoods> showGoods = cart.getShowGoods();
            for (ShowGoods showGood : showGoods) {
                double price = Double.parseDouble(showGood.getPrice());
                Integer numeber = cart.getNumber();
                double zongjia = price * numeber;
                number_num += numeber;
                cart.setZongjia(zongjia);
            }
            cart.setNumeber_num(number_num);
        }
        request.setAttribute("cartlist",cartList);
        return "top";
    }

    @RequestMapping("/insertcart")
    public String insertGoodsToCart(Integer g_id,Integer number,HttpServletRequest request){
        Integer uid = userService.checkUserName(request.getUserPrincipal().getName()).getUserid();
        System.out.println("userid"+"=========="+uid);
        System.out.println("number"+"=========="+number);
        System.out.println("g_id"+"=========="+g_id);
        cartService.insertGoodsToCart(uid,number,g_id);

        String username = request.getUserPrincipal().getName();

        List<Cart> cartList = cartService.selectCartByUsername(username);
        double zongjia_num = 0;
        Integer number_num = 0;
        for (Cart cart : cartList) {
            List<ShowGoods> showGoods = cart.getShowGoods();
            for (ShowGoods showGood : showGoods) {
                double price = Double.parseDouble(showGood.getPrice());
                Integer numeber = cart.getNumber();
                double zongjia = price * numeber;
                zongjia_num += zongjia;
                number_num += numeber;
                cart.setZongjia(zongjia);
            }
            cart.setZongjia_num(zongjia_num);
            cart.setNumeber_num(number_num);
        }
        System.out.println(cartList);
        request.setAttribute("cartlist",cartList);
        return "cart";
    }
}
