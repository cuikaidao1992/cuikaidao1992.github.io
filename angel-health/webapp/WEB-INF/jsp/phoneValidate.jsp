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
    <script type="text/javascript">
    	$(function(){
    		$("#getCode").click(function(){
    			$(".verCode-time").css("display","black");
    			$.ajax({
    				url : "${ctx}/sysUser/getCode",
	    			type : "POST",
	    			data : {"memPhone":"18201004591","type":"2"},
	    			dataType : "json",
	    			success : function(data) {
	    				$("#certPic").val($(data)[0]["data"]);
	    			}
    			})
    		})
    	})
    	function backStep(){
    		location.href = "${ctx}/sysUser/forgetPwd";
    	}
    </script>
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
                            <li>
                                <em></em>
                                <a href="#">重置密码</a>
                            </li>
                            <li class="last">
                                <em></em>
                                <a href="#">完成</a>
                            </li>
                        </ul>
                    </div>
                    <form action="${ctx}/sysUser/phoneValidate" method="post" class="form-text">
                        <div class="field phoneNumber-field">
                            <input type="text" class="" placeholder="请输入手机号" name="mobile">
                            <span class="ts-flag">
                            	${map.code=="0"?map.msg:""}
                            </span>
                        </div>
                        <div class="field verCode-field clearfix">
                            <input type="text" class="input-code" placeholder="请输入验证码" name="certPic">
                            <input type="hidden" name="sendCertPic" id="certPic">
                            <label class="verCode get-verCode" id="getCode">获取验证码</label>
                            <label class="verCode verCode-time" style="display: none" >60秒后重新获取</label>
                            <span class="ts-flag">
                            	${map.code=="1"?map.msg:""}
                            </span>
                        </div>
                        <div class="login-links">
                            <p class="no-account">还没有账号，请联系<a href="#">管理员</a></p>
                            <a href="${ctx}/sysUser/index" class="return-login">返回登录</a>
                        </div>
                        <div class="submit">
                            <button class="btn validate-btn prev-btn" type="button" onclick="backStep()">上一步</button>
                            <button class="btn validate-btn next-btn" type="submit">下一步</button>
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