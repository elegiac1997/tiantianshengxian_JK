<%--
  Created by IntelliJ IDEA.
  User: Shinelon
  Date: 2019/10/23
  Time: 10:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page isELIgnored="false" %>



<c:forEach items="${goods}" var="goods">
    <div class="list_model">
        <div class="list_title clearfix">
            <h3 class="fl" id="${goods.banner}">${goods.title}</h3>
            <div class="subtitle fl">
                <span>|</span>
                <a href="#">鲜芒</a>
                <a href="#">加州提子</a>
                <a href="#">亚马逊牛油果</a>
            </div>
            <a class="goods_more fr" id="fruit_more" href="${pageContext.request.contextPath}/goods/list">查看更多 &gt;</a>
        </div>

        <div class="goods_con clearfix">
            <div class="goods_banner fl"><img src="${goods.showGoods[0].bannerpath}"></div>
            <ul class="goods_list fl">
                <li>
                    <h4><a href="#">${goods.showGoods[0].gtitle}</a></h4>
                    <a href="detail.html"><img src="${goods.showGoods[0].imgpath}"></a>
                    <div class="prize">¥ ${goods.showGoods[0].price}</div>
                </li>
                <li>
                    <h4><a href="#">${goods.showGoods[1].gtitle}</a></h4>
                    <a href="detail.html"><img src="${goods.showGoods[1].imgpath}"></a>
                    <div class="prize">¥ ${goods.showGoods[1].price}</div>
                </li>
                <li>
                    <h4><a href="#">${goods.showGoods[2].gtitle}</a></h4>
                    <a href="detail.html"><img src="${goods.showGoods[2].imgpath}"></a>
                    <div class="prize">¥ ${goods.showGoods[2].price}</div>
                </li>
                <li>
                    <h4><a href="#">${goods.showGoods[3].gtitle}</a></h4>
                    <a href="detail.html"><img src="${goods.showGoods[3].imgpath}"></a>
                    <div class="prize">¥ ${goods.showGoods[3].price}</div>
                </li>
            </ul>
        </div>
    </div>
</c:forEach>

