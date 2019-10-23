<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>天天生鲜-登录</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
	<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript">
	$(
			function () {
				var captcha = false;
				$("#captcha_input").blur(
						function () {
							var captchainput = $("#captcha_input").val();

							$.ajax({
								url:"${pageContext.request.contextPath}/user/checkcode",
								type:"post",
								data:"captchainput="+captchainput,
								dataType:"json",
								success:function (data) {
									console.log(data);
									if (data.captcha_check==1){
										$("#captcha_span").text("验证码正确");
										$("#captcha_span").css({"color":"green"});
										$("#captcha_span").show();
										captcha = true;
									} else {
										$("#captcha_span").text("验证码错误");
										$("#captcha_span").css({"color":"red"});
										$("#captcha_span").show();
									}
								}
							})
							
						}
				)
				$("#check_submit").click(
						function () {
							var checkboxr = $("#checkbox_r").val();
							$.ajax({
								url:"${pageContext.request.contextPath}/user/login",
								type:"post",
								data:"checkboxr="+checkboxr,
								dataType:"json",
							})
							if (captcha){
								$("#form_check").submit();

							} else {
								return false;
							}
						}
				)
				<%--$("#checkbox_r").click(--%>
				<%--		function () {--%>
				<%--			$.ajax({--%>
				<%--				url:"${pageContext.request.contextPath}/user/login",--%>
				<%--				type:"post",--%>
				<%--				data:"checkboxr="+"1",--%>
				<%--				dataType:"json",--%>
				<%--			})--%>
				<%--		}--%>
				<%--)--%>
			}
	)





	</script>
</head>
<body>
	<div class="login_top clearfix">
		<a href="index.jsp" class="login_logo"><img src="${pageContext.request.contextPath}/images/logo02.png"></a>
	</div>

	<div class="login_form_bg">
		<div class="login_form_wrap clearfix">
			<div class="login_banner fl"></div>
			<div class="slogan fl">日夜兼程 · 急速送达</div>
			<div class="login_form fr">
				<div class="login_title clearfix">
					<h1>用户登录</h1>
					<a href="register.jsp">立即注册</a>
				</div>
				<div class="form_input">
					<form action="${pageContext.request.contextPath}/user/login" method="post" id="form_check">
						<input type="text" id="uuu" name="username" class="name_input" value="<shiro:principal/>" placeholder="请输入用户名">
						<div class="user_error">输入错误</div>
						<input type="password" name="password" class="pass_input" placeholder="请输入密码">
						<div class="pwd_error">输入错误</div>
						<div style="position: absolute;left: 0;top: 120px;"> 
							<img src="${pageContext.request.contextPath}/captcha" style="width:85px;height: 25px" id="cap"> <input id="captcha_input" style="background: #fdfdfd;height: 25px;width: 100px;vertical-align: middle;">
							<span id="captcha_span" style="display:none;" >提示信息</span>
						</div>
						<div class="more_input clearfix">
							<input value="1" type="checkbox" id="checkbox_r" name="checkbox_r">
							<label>记住用户名</label>
							<a href="#">忘记密码</a>
						</div>
						<input id="check_submit" type="submit" name="" value="登录" class="input_submit">
					</form>
				</div>
			</div>
		</div>
	</div>

	<div class="footer no-mp">
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
	<script>
		$(function(){
			$("#cap").click(function(){
				//刷新验证码
				path = $(this).attr("src")+"?"+new Date().getTime();
				$(this).attr("src",path);
			});
		});
	</script>
	
</body>
</html>