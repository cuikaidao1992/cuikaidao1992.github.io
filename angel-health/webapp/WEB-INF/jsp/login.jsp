<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="${ctx}/home/login/reset.css">
    <link rel="stylesheet" href="${ctx}/home/login/login.css">
    <script src="${ctx}/dep/jquery-2.0.3.min.js"></script>
    <script src="${ctx}/home/login/login.js"></script>
   
</head>
<body>
    <div class="header">
        <div class="login">
            <h1>天使健康云管理平台</h1>
        </div>
    </div>
    <div class="main-login">
        <div class="login-bg"></div>
        <div class="container">
            <div class="login-box-warp">
                <div class="login-view">
                    <div class="login-head">
                        <h2>登录</h2>
                    </div>
                    <div class="login-body">
                        <div class="login-type">
                            <ul class="clearfix">
                                <li class="active">
                                    <i class="service"></i>
                                    <a href="#">客服</a>
                                </li>
                                <li>
                                    <i class="physician"></i>
                                    <a href="#">医师</a>
                                </li>
                                <li class="last">
                                    <i class="administrator"></i>
                                    <a href="#">管理员</a>
                                </li>
                            </ul>
                        </div>
                        <form action="${ctx}/sysUser/login" method="post" class="form-text">
                            <div class="field username-field">
                                <i></i>
                                <input type="text" class="login-text" name="loginName" placeholder="E-meil | 手机号">
                                <span class="ts-flag">
                                	${map.code=="0"?map.msg:""}
                                </span>
                            </div>
                            <div class="field pwd-field">
                                <i></i>
                                <input type="text" class="login-text" name="password" placeholder="密码">
                                <span class="ts-flag">
                                	${map.code=="1"?map.msg:""}
                                </span>
                            </div>
                            <div class="login-links">
                                <p class="no-account">还没有账号，请联系<a href="#">管理员</a></p>
                                <a href="${ctx}/sysUser/forgetPwd" class="forget-pwd">忘记密码？</a>
                            </div>
                            <div class="submit">
                                <button class="btn" type="submit" id="btn">立即登录</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer">
            <p>Copyright © 2016 广东省东芜市天使健康管理有限公司 All Rights Reserved.</p>
        </div>
    </div>
</body>
</html>