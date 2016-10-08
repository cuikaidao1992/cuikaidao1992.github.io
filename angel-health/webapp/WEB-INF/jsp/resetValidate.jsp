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
                    <h2>忘记密码</h2>
                </div>
                <div class="login-body">
                    <div class="validate-type">
                        <ul class="clearfix">
                            <li class="active">
                                <em></em>
                                <a href="#">账号验证</a>
                            </li>
                            <li class="active">
                                <em></em>
                                <a href="#">手机验证</a>
                            </li>
                            <li class="active">
                                <em></em>
                                <a href="#">重置密码</a>
                            </li>
                            <li class="last">
                                <em></em>
                                <a href="#">完成</a>
                            </li>
                        </ul>
                    </div>
                    <form action="${ctx}/sysUser/resetValidate" method="post" class="form-text">
                        <div class="field pwd-field1">
                            <input type="text" class="" placeholder="请设置新密码（由6-20位任意字符组成）" name="password">
                            <span class="ts-flag">
                            	${map.code=="0"?map.msg:""}
                            </span>
                        </div>
                        <div class="field pwd-field2 clearfix">
                            <input type="text" class="" placeholder="请再次输入密码" name="repassword">
                            <span class="ts-flag">
                            	${map.code=="1"?map.msg:""}
                            </span>
                        </div>
                        <div class="login-links">
                            <p class="no-account">还没有账号，请联系<a href="#">管理员</a></p>
                            <a href="${ctx}/sysUser/index" class="return-login">返回登录</a>
                        </div>
                        <div class="submit">
                            <button class="btn" type="submit">下一步</button>
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
<script>
	function checkForm(){
		location.href = "success-validate.html";
		return false;
	}
</script>
</body>
</html>