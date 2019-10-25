<%--
  Created by IntelliJ IDEA.
  User: Shinelon
  Date: 2019/10/25
  Time: 10:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
--------------
<c:forEach items="${cartlist}" var="cartlist">
    <ul class="cart_list_td clearfix">
        <li class="col01"><input type="checkbox" name="" checked></li>
        <li class="col02"><img src="${cartlist.showGoods[0].imgpath}"></li>
        <li class="col03">${cartlist.showGoods[0].gtitle}<br><em>${cartlist.showGoods[0].unitprice}</em></li>
        <li class="col04">500g</li>
        <li class="col05">${cartlist.showGoods[0].price}元</li>
        <li class="col06">
            <div class="num_add">
                <a href="javascript:;" class="add fl">+</a>
                <input type="text" class="num_show fl" value="${cartlist.number}">
                <a href="javascript:;" class="minus fl">-</a>
            </div>
        </li>
        <li class="col07">${cartlist.zongjia}元</li>
        <li class="col08"><a href="javascript:;">删除</a></li>
    </ul>
</c:forEach>
