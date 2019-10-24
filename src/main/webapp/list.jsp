 <%@page import="java.util.List"%>
 <%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page isELIgnored="false" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>天天生鲜-商品列表</title>
	<%
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName() + ":" +
				request.getServerPort() + path + "/";
	%>
	<base href="<%=basePath%>">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/reset.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/main.css">
<%--	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css">--%>
<%--	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">--%>
	<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="js/slide.js"></script>
	<style>
		#fenye {
			display: block;
			height: 500px;
		}
	</style>
</head>
<body>
	<div class="header_con">
		<div class="header">
			<div class="welcome fl">欢迎来到天天生鲜!</div>
			<div class="fr">
				<div class="login_info fl">
					欢迎您：<em>张 山</em>
				</div>
				<div class="login_btn fl">
					<a href="login.jsp">登录</a>
					<span>|</span>
					<a href="register.html">注册</a>
				</div>
				<div class="user_link fl">
					<span>|</span>
					<a href="user_center_info.html">用户中心</a>
					<span>|</span>
					<a href="cart.html">我的购物车</a>
					<span>|</span>
					<a href="user_center_order.html">我的订单</a>
				</div>
			</div>
		</div>		
	</div>

	<div class="search_bar clearfix">
		<a href="index.html" class="logo fl"><img src="images/logo.png"></a>
		<div class="search_con fl">
			<input type="text" class="input_text fl" name="" placeholder="搜索商品">
			<input type="button" class="input_btn fr" name="" value="搜索">
		</div>
		<div class="guest_cart fr">
			<a href="#" class="cart_name fl">我的购物车</a>
			<div class="goods_count fl">1</div>
		</div>
	</div>

	<div class="navbar_con">
		<div class="navbar clearfix">
			<div class="subnav_con fl">
				<h1>全部商品分类</h1>	
				<span></span>			
				<ul class="subnav">
					<li><a href="#" class="fruit">新鲜水果</a></li>
					<li><a href="#" class="seafood">海鲜水产</a></li>
					<li><a href="#" class="meet">猪牛羊肉</a></li>
					<li><a href="#" class="egg">禽类蛋品</a></li>
					<li><a href="#" class="vegetables">新鲜蔬菜</a></li>
					<li><a href="#" class="ice">速冻食品</a></li>
				</ul>
			</div>
			<ul class="navlist fl">
				<li><a href="">首页</a></li>
				<li class="interval">|</li>
				<li><a href="">手机生鲜</a></li>
				<li class="interval">|</li>
				<li><a href="">抽奖</a></li>
			</ul>
		</div>
	</div>

	<div class="breadcrumb">
		<a href="#">全部分类</a>
		<span>></span>
		<a href="#">新鲜水果</a>
	</div>

	<div class="main_wrap clearfix">
		<div class="l_wrap fl clearfix">
			<div class="new_goods">
				<h3>新品推荐</h3>
				<ul>
					<li>
						<a href="#"><img src="images/goods/goods001.jpg"></a>
						<h4><a href="#">进口柠檬</a></h4>
						<div class="prize">￥3.90</div>
					</li>
					<li>
						<a href="#"><img src="images/goods/goods002.jpg"></a>
						<h4><a href="#">玫瑰香葡萄</a></h4>
						<div class="prize">￥16.80</div>
					</li>
				</ul>
			</div>
		</div>

		<div class="r_wrap fr clearfix">
			<div class="sort_bar">
				<a id="time_change">默认</a>
				<a id="price_change">价格</a>
				<a >人气</a>
			</div>

			<div id="fylist">
				<div id="fenye">
					<ul id="goods_ul" class="goods_type_list clearfix">
						<c:forEach items="${fylist}" var="fylist" varStatus="sta">
							<li id="goods_asc" class="goods_li">
								<a href="detail.html"><img src="${fylist.imgpath}"></a>
								<h4><a href="detail.html">${fylist.gtitle}</a></h4>
								<div class="operate">
									<span class="prize">￥${fylist.price}</span>
									<span class="unit">${fylist.unitprice}</span>
									<a href="#" class="add_goods" title="加入购物车"></a>
								</div>
							</li>

						</c:forEach>


						<c:forEach var="fylists"  items="${fylist}" varStatus="status">
							<c:set var="startIndex" value="${fn:length(fylist) }"></c:set>

						<li id="goods_desc" style="display: none;" class="goods_li">
							<a href="detail.html"><img src="${fylist[startIndex - status.count].imgpath}"></a>
							<h4><a href="detail.html">${fylist[startIndex - status.count].gtitle}</a></h4>
							<div class="operate">
								<span class="prize">￥${fylist[startIndex - status.count].price}</span>
								<span class="unit">${fylist[startIndex - status.count].unitprice}</span>
								<a href="#" class="add_goods" title="加入购物车"></a>
							</div>
						</li>
						</c:forEach>

					</ul>
				</div>

				<div class="pagenation">
					<c:if test="${page.hasPreviousPage}">
						<a href="${pageContext.request.contextPath}/goods/list?pageNum=${page.prePage}">上一页</a>
					</c:if>
					<c:if test="${! page.hasPreviousPage}">
						上一页
					</c:if>
					<a href="${pageContext.request.contextPath}/goods/list?pageNum=1" class="active">1</a>
					<a href="${pageContext.request.contextPath}/goods/list?pageNum=2">2</a>
					<a href="${pageContext.request.contextPath}/goods/list?pageNum=3">3</a>
					<a href="${pageContext.request.contextPath}/goods/list?pageNum=4">4</a>
					<a href="${pageContext.request.contextPath}/goods/list?pageNum=5">5</a>

					<c:if test="${page.hasNextPage}">
						<a href="${pageContext.request.contextPath}/goods/list?pageNum=${page.nextPage}">下一页></a>
					</c:if>
					<c:if test="${! page.hasNextPage}">下一页</c:if>

				</div>
				<script>

				</script>
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
	<script type="text/javascript">
		// var timestatus =
		<%--var t1='<%=request.getAttribute("fylist")%>';--%>
		<%--var t2 = [];--%>
		// var num = 0;
		// var timechange = "desc";
		$("#time_change").click(
				function () {
					$("#time_change").attr("class","active");
					$("#price_change").attr("class","");
					var timechange="<%=session.getAttribute("timechange")%>";
					// alert(timechange+"1");
					if (timechange == "asc") {

						$.ajax({
							url:"${pageContext.request.contextPath}/goods/list",
							data:"timechange="+"desc",
							type:"get",
							success:function () {
								window.location.replace("${pageContext.request.contextPath}/goods/list?timechange=desc");
							}
						})
						<%--timechange="<%=session.setAttribute("timechange","asc")%>";--%>
						// timechange="asc";
						// alert(timechange+"2");
					}else {
						$.ajax({
							url:"${pageContext.request.contextPath}/goods/list",
							data:"timechange="+"asc",
							type:"get",
							success:function () {
								window.location.replace("${pageContext.request.contextPath}/goods/list?timechange=asc");
							}
						})
						// timechange="desc";
						// alert(timechange+"3");
					}
				}
		)
		$("#price_change").click(
				function () {
					$("#time_change").attr("class","");
					$("#price_change").attr("class","active");
					var timechange="<%=session.getAttribute("timechange")%>";
					// alert(timechange+"1");
					if (timechange == "price_asc") {

						$.ajax({
							url:"${pageContext.request.contextPath}/goods/list",
							data:"timechange="+"price_desc",
							type:"get",
							success:function () {
								window.location.replace("${pageContext.request.contextPath}/goods/list?timechange=price_desc");
							}
						})
						<%--timechange="<%=session.setAttribute("timechange","asc")%>";--%>
						// timechange="asc";
						// alert(timechange+"2");
					}else {
						$.ajax({
							url:"${pageContext.request.contextPath}/goods/list",
							data:"timechange="+"price_asc",
							type:"get",
							success:function () {
								window.location.replace("${pageContext.request.contextPath}/goods/list?timechange=price_asc");
							}
						})
						// timechange="desc";
						// alert(timechange+"3");
					}
				}
		)
	</script>
<%--<script type="text/javascript">--%>
<%--	//$("#fylist").load("${pageContext.request.contextPath}/goods/fylist");--%>
<%--</script>--%>
	
</body>
</html>