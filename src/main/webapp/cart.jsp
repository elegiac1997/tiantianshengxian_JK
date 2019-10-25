<%--
  Created by IntelliJ IDEA.
  User: Shinelon
  Date: 2019/10/21
  Time: 17:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>天天生鲜-购物车</title>
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
</head>
<body>
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
                <a href="user_center_info.html">用户中心</a>
                <span>|</span>
                <a href="${pageContext.request.contextPath}/cart/cartlist">我的购物车</a>
                <span>|</span>
                <a href="user_center_order.html">我的订单</a>
            </div>
        </div>
    </div>
</div>

<div class="search_bar clearfix">
    <a href="index.jsp" class="logo fl"><img src="images/logo.png"></a>
    <div class="sub_page_name fl">|&nbsp;&nbsp;&nbsp;&nbsp;购物车</div>
    <div class="search_con fr">
        <input type="text" class="input_text fl" name="" placeholder="搜索商品">
        <input type="button" class="input_btn fr" name="" value="搜索">
    </div>
</div>

<div class="total_count">全部商品<em>2</em>件</div>
<ul class="cart_list_th clearfix">
    <li class="col01">商品名称</li>
    <li class="col02">商品单位</li>
    <li class="col03">商品价格</li>
    <li class="col04">数量</li>
    <li class="col05">小计</li>
    <li class="col06">操作</li>
</ul>


<c:forEach items="${cartlist}" var="cartlist" varStatus="status" >
    <ul class="cart_list_td clearfix">
        <li class="col01"><input type="checkbox" name="" checked></li>
        <li class="col02"><img src="${cartlist.showGoods[0].imgpath}"></li>
        <li class="col03">${cartlist.showGoods[0].gtitle}<br><em>${cartlist.showGoods[0].unitprice}</em></li>
        <li class="col04">500g</li>
        <li class="col05">${cartlist.showGoods[0].price}元</li>
        <li class="col06">
            <div class="num_add">
                <a href="javascript:;" id="${cartlist.showGoods[0].id}s" class="add fl">+</a>
                <input type="text" id="${cartlist.showGoods[0].id}u" class="num_show fl" value="${cartlist.number}">
                <a href="javascript:;" id="${cartlist.showGoods[0].id}m" class="minus fl">-</a>
            </div>
        </li>
            <li class="col07" id="${cartlist.showGoods[0].id}n">${cartlist.zongjia}元</li>


        <li class="col08"><a href="javascript:;">删除</a></li>
    </ul>
    <script type="text/javascript">
        // var num_show = 0;
        // var num_price = 0;
        $("#${cartlist.showGoods[0].id}s").click(
            function () {
                var num = $("#${cartlist.showGoods[0].id}u").val()*1;
                //var nnn = $("#num_show").val();
                //if (nnn)
                // alert(num);
                var n = num+1;
                // alert(n+"nnnnn");
                var price_num = parseFloat(${cartlist.showGoods[0].price}).toFixed(2)*n;
                // alert("price----"+price_num);
                $("#${cartlist.showGoods[0].id}n").text(price_num+"元");
                <%--alert("${cartlist.showGoods[0].gtitle}s");--%>
                $("#${cartlist.showGoods[0].id}u").val(n);


                var num_show = $("#num_show").text()*1;
                var num_price = $("#num_price").text()*1;
                num_show +=1;
                num_price += ${cartlist.showGoods[0].price};
                num_price = parseFloat(num_price).toFixed(2);
                $("#num_price").text(num_price);
                $("#num_show").text(num_show);
            }
        )
        $("#${cartlist.showGoods[0].id}m").click(
            function () {
                var num = $("#${cartlist.showGoods[0].id}u").val()*1;
                if (num>0) {
                    // alert(num);
                    var n = num-1;
                    // alert(n+"nnnnn");
                    var price_num = parseFloat(${cartlist.showGoods[0].price}).toFixed(2)*n;
                    $("#${cartlist.showGoods[0].id}n").text(price_num+"元");
                    <%--alert("${cartlist.showGoods[0].gtitle}s");--%>
                    $("#${cartlist.showGoods[0].id}u").val(n);
                    var num_show = $("#num_show").text()*1;
                    var num_price = $("#num_price").text()*1;
                    num_show -=1;
                    num_price -= ${cartlist.showGoods[0].price};
                    num_price = parseFloat(num_price).toFixed(2);
                    $("#num_price").text(num_price);
                    $("#num_show").text(num_show);
                }

            }
        )
    </script>
<%--</c:forEach>--%>


    <c:if test="${status.last}">

<ul class="settlements">
    <li class="col01"><input type="checkbox" name="" checked=""></li>
    <li class="col02">全选</li>
<%--    <c:forEach  items="${cartlist}" var="cart_num" varStatus="status">--%>

        <li class="col03">合计(不含运费)：<span>¥</span><em id="num_price">${cartlist.zongjia_num}</em><br>共计<b id="num_show">${cartlist.numeber_num}</b>件商品</li>


    <li class="col04"><a href="place_order.html">去结算</a></li>
</ul>

    </c:if>
</c:forEach>


<div class="footer">
    <div class="foot_link">
        <a href="#">关于我们</a>
        <span>|</span>
        <a href="#">联系我们</a>
        <span>|</span>
        <a href="#">招聘人才</a>
        <span>|</span>
        <a href="#">友情链接</a>
    </div>
    <p>CopyRight © 2016 北京天天生鲜信息技术有限公司 All Rights Reserved</p>
    <p>电话：010-****888    京ICP备*******8号</p>
</div>
<script type="text/javascript">
    // $(".add").click(
    //
    //     function () {
    //         alert("---");
    //         var input_num = $("#input_num").val()*1;
    //         alert(input_num);
    //         var num = input_num+1;
    //         alert(num);
    //         $("#input_num").val(num);
    //     }
    // )
</script>

</body>
</html>