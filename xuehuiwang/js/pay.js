/**
 * Created by Administrator on 2016/6/25.
 */

$(".affirm-btn").click(function(){
    window.location="pay2.html"
})
$(".submit-order").click(function(){
    window.open("pay3.html")
});
$(".code-btn").click(function(){
    $(this).hide();
    $(this).next().show()
});
$(".close").click(function(){
    $(this).parent().hide()
})
/*登陆后显示*/
var timerUser=null;
$(".user").mouseenter(function(){
    $(".user-menu").slideDown("fast");
    $(this).addClass("user-active")
}).mouseleave(function(){
    timerUser=setTimeout(function(){
        $(".user-menu").slideUp("fast");
        $(".user").removeClass("user-active")
    },200)
});
$(".user-menu").mouseenter(function(){
    clearTimeout(timerUser)
}).mouseleave(function() {
    $(".user-menu").slideUp("fast");
    $(".user").removeClass("user-active")
})