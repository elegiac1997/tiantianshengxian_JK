<%--
  Created by IntelliJ IDEA.
  User: Shinelon
  Date: 2019/10/21
  Time: 17:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>天天生鲜-注册</title>
    <link rel="stylesheet" type="text/css" href="css/reset.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="js/register.js"></script>
    <script type="text/javascript">
        $(
            function () {
                var usernametrue =false;
                var pwdtrue = false;
                var repwdtrue = false;
                var emailtrue = false;
                $("#user_name").blur(
                    function () {
                        var username = $("#user_name").val();
                        if (username.length>7 && username.length<21){
                            $.ajax({
                                url:"user/checkusername",
                                type:"post",
                                data:"username="+username,
                                dataType:"json",
                                success:function (data) {
                                    if (data.result==0){
                                        $("#username_check").text("用户名可用");
                                        $("#username_check").css({"color":"green"});
                                        $("#username_check").show();
                                        usernametrue = true;
                                    } else {
                                        $("#username_check").text("用户名已存在");
                                        $("#username_check").css({"color":"red"});
                                        $("#username_check").show();
                                    }
                                }
                            })

                        }else {
                            $("#username_check").text("用户名最少5位，最长20位");
                            $("#username_check").css({"color":"red"});
                            $("#username_check").show();
                        }

                    }
                )
                $("#pwd").blur(
                    function () {
                        var password = $("#pwd").val();
                        if (password.length>7 && password.length<21){
                            $("#pwd_check").text("密码可用");
                            $("#pwd_check").css({"color":"green"});
                            $("#pwd_check").show();
                            pwdtrue = true;
                        }else{
                            $("#pwd_check").text("密码最少8位，最长20位");
                            $("#pwd_check").css({"color":"red"});
                            $("#pwd_check").show();
                        }
                    }
                )
                $("#cpwd").blur(
                    function () {
                        var password = $("#pwd").val();
                        var cpassword = $("#cpwd").val();
                        if (password == cpassword){
                            $("#cpwd_check").text("密码可用");
                            $("#cpwd_check").css({"color":"green"});
                            $("#cpwd_check").show();
                            repwdtrue = true;
                        }else{
                            $("#cpwd_check").text("两次密码不一致");
                            $("#cpwd_check").css({"color":"red"});
                            $("#cpwd_check").show();
                        }
                    }
                )
                $("#email").blur(
                    function () {
                        var email = $("#email").val();
                        var isemail =/^[a-z0-9][\w\.\-]*@[a-z0-9\-]+(\.[a-z]{2,5}){1,2}$/;

                        if (isemail.test(email)){
                            $.ajax({
                                url:"user/checkemail",
                                type:"post",
                                data:"email="+email,
                                dataType:"json",
                                success:function (data) {
                                    if (data.emailMap==0){
                                        $("#email_check").text("邮箱可用");
                                        $("#email_check").css({"color":"green"});
                                        $("#email_check").show();
                                        emailtrue = true;
                                    } else {
                                        $("#email_check").text("邮箱已存在");
                                        $("#email_check").css({"color":"red"});
                                        $("#email_check").show();
                                    }
                                }
                            })

                        }else{
                            $("#email_check").text("邮箱错误");
                            $("#email_check").css({"color":"red"});
                            $("#email_check").show();
                        }
                    }
                )
                $("#submit_check").click(
                    function () {
                        if (usernametrue && pwdtrue && repwdtrue && emailtrue){
                            $("#form_check").submit();
                        } else {
                            return false;
                        }
                    }
                )
            }
        )
    </script>

</head>
<body>
<div class="register_con">
    <div class="l_con fl">
        <a class="reg_logo"><img src="images/logo02.png"></a>
        <div class="reg_slogan">足不出户  ·  新鲜每一天</div>
        <div class="reg_banner"></div>
    </div>

    <div class="r_con fr">
        <div class="reg_title clearfix">
            <h1>用户注册</h1>
            <a href="login.jsp">登录</a>
        </div>
        <div class="reg_form clearfix">
            <form id="form_check" action="${pageContext.request.contextPath}/user/register" method="post">
                <ul>
                    <li>
                        <label>${data}:</label>
                        <input type="text" name="username" id="user_name">
                        <span id="username_check" style="display: none"></span>
                    </li>
                    <li>
                        <label>密码:</label>
                        <input type="password" name="password" id="pwd">
                        <span class="error_tip" id="pwd_check">提示信息</span>
                    </li>
                    <li>
                        <label>确认密码:</label>
                        <input type="password" name="cpwd" id="cpwd">
                        <span class="error_tip" id="cpwd_check">提示信息</span>
                    </li>
                    <li>
                        <label>邮箱:</label>
                        <input type="text" name="email" id="email">
                        <span class="error_tip" id="email_check">提示信息</span>
                    </li>
                    <li class="agreement">
                        <input type="checkbox" name="allow" id="allow" checked="checked">
                        <label>同意”天天生鲜用户使用协议“</label>
                        <span class="error_tip2">提示信息</span>
                    </li>
                    <li class="reg_sub">
                        <input type="submit" id="submit_check" value="注 册" name="">
                    </li>
                </ul>
            </form>
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

</body>
</html>
