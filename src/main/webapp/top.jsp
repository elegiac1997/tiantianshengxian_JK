<%--
  Created by IntelliJ IDEA.
  User: Shinelon
  Date: 2019/10/25
  Time: 17:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" +
            request.getServerPort() + path + "/";
%>
<base href="<%=basePath%>">
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/reset.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/main.css">
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<script type="text/javascript" src="js/slide.js"></script>
<div class="header_con">
    <div class="header">
        <div class="welcome fl">
            <shiro:user>
                欢迎
                <shiro:principal/>
                来到天天生鲜!
            </shiro:user>
        </div>
        <div class="fr">
            <div class="login_info fl">
                欢迎您：<em>张 山</em>
            </div>
            <div class="login_btn fl">
                <shiro:user>
                    <shiro:principal/>
                    <a href="${pageContext.request.contextPath}/user/logout">登出</a>
                </shiro:user>
                <shiro:guest>
                    <a href="${pageContext.request.contextPath}/user/login">登录</a>
                    <span>|</span>
                    <a href="${pageContext.request.contextPath}/user/register">注册</a>
                </shiro:guest>

            </div>
            <div class="user_link fl">
                <span>|</span>
                <a href="user_center_info.jsp">用户中心</a>
                <span>|</span>
                <a href="${pageContext.request.contextPath}/cart/cartlist">我的购物车</a>
                <span>|</span>
                <a href="user_center_order.jsp">我的订单</a>
            </div>
        </div>
    </div>
</div>

<div class="search_bar clearfix">
    <a href="index.jsp" class="logo fl"><img src="${pageContext.request.contextPath}/images/logo.png"></a>
    <div class="search_con fl">
        <input type="text" class="input_text fl" name="" placeholder="搜索商品">
        <input type="button" class="input_btn fr" name="" value="搜索">
    </div>
    <div class="guest_cart fr">
        <a href="${pageContext.request.contextPath}/cart/cartlist" class="cart_name fl">我的购物车</a>
        <div class="goods_count fl" id="show_count">
            <c:forEach items="${cartlist}" var="cartlist" varStatus="status" >
                <c:if test="${status.last}">
                    ${cartlist.numeber_num}
                </c:if>
            </c:forEach>
        </div>
    </div>
</div>

<div class="navbar_con">
    <div class="navbar">
        <h1 class="fl">全部商品分类</h1>
        <ul class="navlist fl">
            <li><a href="">首页</a></li>
            <li class="interval">|</li>
            <li><a href="">手机生鲜</a></li>
            <li class="interval">|</li>
            <li><a href="">抽奖</a></li>
        </ul>
    </div>
</div>
