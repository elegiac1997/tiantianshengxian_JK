<%--
  Created by IntelliJ IDEA.
  User: Shinelon
  Date: 2019/10/21
  Time: 17:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>天天生鲜-首页</title>
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
<div id="index_top">

</div>



<div class="center_con clearfix">
    <div id="goodsType_div">

    </div>

    <div class="slide fl">
        <ul class="slide_pics">
            <li><img src="${pageContext.request.contextPath}/images/slide.jpg" alt="幻灯片"></li>
            <li><img src="${pageContext.request.contextPath}/images/slide02.jpg" alt="幻灯片"></li>
            <li><img src="${pageContext.request.contextPath}/images/slide03.jpg" alt="幻灯片"></li>
            <li><img src="${pageContext.request.contextPath}/images/slide04.jpg" alt="幻灯片"></li>
        </ul>
        <div class="prev"></div>
        <div class="next"></div>
        <ul class="points"></ul>
    </div>
    <div class="adv fl">
        <a href="#"><img src="${pageContext.request.contextPath}/images/adv01.jpg"></a>
        <a href="#"><img src="${pageContext.request.contextPath}/images/adv02.jpg"></a>
    </div>
</div>
<div id="goods_list">

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
<script type="text/javascript" src="js/slideshow.js"></script>
<script type="text/javascript">
    $("#goodsType_div").load("${pageContext.request.contextPath}/goods/typelist");
    $("#goods_list").load("${pageContext.request.contextPath}/goods/sgoods");
    $("#index_top").load("${pageContext.request.contextPath}/cart/cartnum");
</script>
<script type="text/javascript">
    BCSlideshow('focuspic');
    var oFruit = document.getElementById('fruit_more');
    var oShownum = document.getElementById('show_count');

    var hasorder = localStorage.getItem('order_finish');

    if(hasorder)
    {
        oShownum.innerHTML = '2';
    }

    oFruit.onclick = function(){
        window.location.href = 'list.html';
    }
</script>
</body>
</html>