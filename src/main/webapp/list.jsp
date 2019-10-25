 <%@page import="java.util.List"%>
 <%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page isELIgnored="false" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
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
<div id="list_top">

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
								<a href="${pageContext.request.contextPath}/goods/goodsmessage?sendgtitle=${fylist.gtitle}"><img src="${fylist.imgpath}"></a>
								<h4 id="sendgtitle"><a href="${pageContext.request.contextPath}/goods/goodsmessage?sendgtitle=${fylist.gtitle}">${fylist.gtitle}</a></h4>
								<div class="operate">
									<span class="prize">￥${fylist.price}</span>
									<span class="unit">${fylist.unitprice}</span>
									<a href="${pageContext.request.contextPath}/cart/insertcart?gid=${fylist.gtitle}&number=1" class="add_goods" title="加入购物车"></a>
								</div>
							</li>

						</c:forEach>


<%--						<c:forEach var="fylists"  items="${fylist}" varStatus="status">--%>
<%--							<c:set var="startIndex" value="${fn:length(fylist) }"></c:set>--%>

<%--						<li id="goods_desc" style="display: none;" class="goods_li">--%>
<%--							<a href="detail.html"><img src="${fylist[startIndex - status.count].imgpath}"></a>--%>
<%--							<h4><a href="detail.html">${fylist[startIndex - status.count].gtitle}</a></h4>--%>
<%--							<div class="operate">--%>
<%--								<span class="prize">￥${fylist[startIndex - status.count].price}</span>--%>
<%--								<span class="unit">${fylist[startIndex - status.count].unitprice}</span>--%>
<%--								<a href="" class="add_goods" title="加入购物车"></a>--%>
<%--							</div>--%>
<%--						</li>--%>
<%--						</c:forEach>--%>

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
	$("#list_top").load("${pageContext.request.contextPath}/cart/cartnum");
</script>
	<script type="text/javascript">
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

	
</body>
</html>