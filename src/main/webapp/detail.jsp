<%--
  Created by IntelliJ IDEA.
  User: Shinelon
  Date: 2019/10/21
  Time: 17:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>天天生鲜-商品详情</title>
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
<div id="detail_top">

</div>

<div class="breadcrumb">
    <a href="#">全部分类</a>
    <span>></span>
    <a href="#">新鲜水果</a>
    <span>></span>
    <a href="#">商品详情</a>
</div>

<div id="detail_list">

    <c:forEach items="${goodsmessage}" var="goodsmessage" >
        <div class="goods_detail_con clearfix">
            <div class="goods_detail_pic fl"><img src="${goodsmessage.imgpath}"></div>

            <div class="goods_detail_list fr">
                <h3>${goodsmessage.gtitle}</h3>
                <p>草莓浆果柔软多汁，味美爽口，适合速冻保鲜贮藏。草莓速冻后，可以保持原有的色、香、味，既便于贮藏，又便于外销。</p>
                <div class="prize_bar">
                    <span class="show_pirze">¥<em id="price_">${goodsmessage.price}</em></span>
                    <span class="show_unit">单  位：500g</span>
                </div>
                <div class="goods_num clearfix">
                    <div class="num_name fl">数 量：</div>
                    <div class="num_add fl">
                        <input type="text" id="price_num" class="num_show fl" value="1">
                        <a href="javascript:;" id="price_add" class="add fr">+</a>
                        <a href="javascript:;" id="price_del" class="minus fr">-</a>
                    </div>
                </div>
                <div class="total">总价：<em><span id="price_change">${goodsmessage.price}</span>元</em></div>
                <div class="operate_btn">
                    <a href="javascript:;" class="buy_btn">立即购买</a>
                    <a class="add_cart" id="add_cart">加入购物车</a>
                    <input id="input_gid" style="display:none;" value="${goodsmessage.id}">
                </div>
            </div>
        </div>
    </c:forEach>
</div>

<div class="main_wrap clearfix">
    <div class="l_wrap fl clearfix">
        <div class="new_goods">
            <h3>新品推荐</h3>
            <ul>
                <li>
                    <a href="#"><img src="${pageContext.request.contextPath}/images/goods/goods001.jpg"></a>
                    <h4><a href="#">进口柠檬</a></h4>
                    <div class="prize">￥3.90</div>
                </li>
                <li>
                    <a href="#"><img src="${pageContext.request.contextPath}/images/goods/goods002.jpg"></a>
                    <h4><a href="#">玫瑰香葡萄</a></h4>
                    <div class="prize">￥16.80</div>
                </li>
            </ul>
        </div>
    </div>

    <div class="r_wrap fr clearfix">
        <ul class="detail_tab clearfix">
            <li class="active">商品介绍</li>
            <li>评论</li>
        </ul>

        <div class="tab_content">
            <dl>
                <dt>商品详情：</dt>
                <dd>草莓采摘园位于北京大兴区 庞各庄镇四各庄村 ，每年1月-6月面向北京以及周围城市提供新鲜草莓采摘和精品礼盒装草莓，草莓品种多样丰富，个大香甜。所有草莓均严格按照有机标准培育，不使用任何化肥和农药。草莓在采摘期间免洗可以直接食用。欢迎喜欢草莓的市民前来采摘，也欢迎各大单位选购精品有机草莓礼盒，有机草莓礼盒是亲朋馈赠、福利送礼的最佳选择。 </dd>
            </dl>
        </div>

    </div>
</div>

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
<div class="add_jump"></div>

<%--<script type="text/javascript" src="js/jquery-1.12.2.js"></script>--%>
<%--<script type="text/javascript">--%>
<%--    var $add_x = $('#add_cart').offset().top;--%>
<%--    var $add_y = $('#add_cart').offset().left;--%>

<%--    var $to_x = $('#show_count').offset().top;--%>
<%--    var $to_y = $('#show_count').offset().left;--%>

<%--    $(".add_jump").css({'left':$add_y+80,'top':$add_x+10,'display':'block'})--%>
<%--    $('#add_cart').click(function(){--%>
<%--        $(".add_jump").stop().animate({--%>
<%--                'left': $to_y+7,--%>
<%--                'top': $to_x+7},--%>
<%--            "fast", function() {--%>
<%--                $(".add_jump").fadeOut('fast',function(){--%>
<%--                    $('#show_count').html(2);--%>
<%--                });--%>

<%--            });--%>
<%--    })--%>
<%--</script>--%>
<script type="text/javascript">
    $("#detail_top").load("${pageContext.request.contextPath}/cart/cartnum");
</script>
<script type="text/javascript">

            $("#price_add").click(
                function () {
                    var pricenum = $("#price_num").val()*1;
                    pricenum += 1;
                    $("#price_num").val(pricenum);
                    //location.reload([true])
                    var num = $("#price_").text()*1;
                    var pricechange = pricenum*num;
                    $("#price_change").text(pricechange);
                }
            )
            $("#price_del").click(
                function () {
                    var pricenum = $("#price_num").val()*1;
                    if (pricenum > 1){
                        pricenum -= 1;
                        $("#price_num").val(pricenum);
                        var num = $("#price_").text()*1;
                        var pricechange = pricenum*num;
                        $("#price_change").text(pricechange);
                    }
                })
    $("#add_cart").click(
        function () {
            var gid = $("#input_gid").val();
            var number = $("#price_num").val()*1;
            window.location.replace("${pageContext.request.contextPath}/cart/insertcart?g_id="+gid+"&number="+number);
            <%--$.ajax({--%>
            <%--    url:"${pageContext.request.contextPath}/cart/insertcart?gid="+gid+"&number="+number,--%>
            <%--})--%>
        }
    )


</script>

</body>
</html>
