/**
 * Created by Administrator on 2016/6/23.
 */
$(function(){
    $(".login").click(function(){
        $(".pop_login").fadeIn();
        $(".login-content").animate({
            top:150,
            opacity: 1
        })
    });
    $(".poplogin_close").click(function(){
        $(".login-content").animate({
            top:0,
            opacity:0
        });
        $(".pop_login").fadeOut();
    });
    $("#btn").click(function(){
        window.location="index2.html";
    });
    $(".tab-btn").click(function(){
        $(this).siblings().removeClass("active");
        $(this).addClass("active");
        $(".tab-bd").addClass("xh-hide");
        $(".tab-bd").eq($(this).index()).removeClass("xh-hide");

    });
    $(".js-find-password").find("li").click(function(){
        $(this).siblings().removeClass("active");
        $(this).addClass("active");
        $(".form-wrap").hide();
        $(".form-wrap").eq($(this).index()).show()
    });
});