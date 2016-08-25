/**
 * Created by Administrator on 2016/8/2.
 */
$(function(){
    var wait = 60;
    function getTime(btn){
        if (wait===0) {
            btn.removeAttribute("disabled");
            btn.innerHTML = "获取验证码";
            wait = 60;
            if($(btn).hasClass("verCode-time")){
                $(btn).removeClass("verCode-time").addClass("get-verCode");
            }
        }else{
            btn.setAttribute("disabled",true);
            btn.innerHTML = wait + "秒后重新获取";
            wait--;
            setTimeout(function(){
                getTime(btn);
            },1000);
        }
    }

    $(".login-type").find("li").click(function(){
        $(this).siblings().removeClass("active");
        $(this).addClass("active")
    });
    $("#getCode").click(function(){
        $(this).removeClass("get-verCode").addClass("verCode-time");
        getTime(this);
    });
    $(".container").css({
        height:$(window).height()-90
    });
    $(window).resize(function(){
        $(".container").css({
            height:$(window).height()-90
        });
    });
    var str="";
    $(".field").find("input").focus(function(){
        $(this).parent().addClass("onto").removeClass("err");
        str=$(this).attr("placeholder");
        $(this).removeAttr("placeholder")
    }).blur(function(){
        $(this).parent().removeClass("onto");
        $(this).attr("placeholder",str);
        str="";
    })
})
