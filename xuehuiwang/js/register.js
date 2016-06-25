/**
 * Created by Administrator on 2016/6/23.
 */
$(function(){
    var login=$(".login-view");
    $(".forget-password").click(function(){
        login.hide();
        login.eq(1).show()
    });
    $(".xh-sms").click(function(){
        login.hide();
        login.eq(2).show()
    });
    $(".xh-email").click(function(){
        login.hide();
        login.eq(3).show()
    });
    $(".left").eq(0).click(function(){
        login.hide();
        login.eq(0).show()
    })
    $(".left").eq(1).click(function(){
        login.hide();
        login.eq(1).show()
    })
    $(".left").eq(2).click(function(){
        login.hide();
        login.eq(1).show()
    })
    $(".submit").find(".btn").click(function(){
        $(".register-view").eq(0).hide();
        $(".register-view").eq(1).show();
        if(top.location != this.location){
            top.location.replace("index2.html");
        }
    })
});