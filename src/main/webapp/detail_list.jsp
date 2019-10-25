<%--
  Created by IntelliJ IDEA.
  User: Shinelon
  Date: 2019/10/24
  Time: 15:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>




<c:forEach items="${goodsmessage}" var="goodsmessage" >
    <div class="goods_detail_con clearfix">
        <div class="goods_detail_pic fl"><img src="${goodsmessage.imgpath}"></div>

        <div class="goods_detail_list fr">
            <h3>${goodsmessage.gtitle}</h3>
            <p>草莓浆果柔软多汁，味美爽口，适合速冻保鲜贮藏。草莓速冻后，可以保持原有的色、香、味，既便于贮藏，又便于外销。</p>
            <div class="prize_bar">
                <span class="show_pirze">¥<em>${goodsmessage.price}</em></span>
                <span class="show_unit">单  位：500g</span>
            </div>
            <div class="goods_num clearfix">
                <div class="num_name fl">数 量：</div>
                <div class="num_add fl">
                    <input type="text" class="num_show fl" value="1">
                    <a href="javascript:;" class="add fr">+</a>
                    <a href="javascript:;" class="minus fr">-</a>
                </div>
            </div>
            <div class="total">总价：<em>16.80元</em></div>
            <div class="operate_btn">
                <a href="javascript:;" class="buy_btn">立即购买</a>
                <a href="javascript:;" class="add_cart" id="add_cart">加入购物车</a>
            </div>
        </div>
    </div>
</c:forEach>

