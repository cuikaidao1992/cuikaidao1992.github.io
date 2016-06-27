/**
 * Created by Administrator on 2016/6/25.
 */
$(".order-actions").find("a").click(function(){
    $("#modal").fadeIn();
    $(".modal-backdrop").fadeIn()
})
$(".modal-header .close").click(function(){
    $("#modal").fadeOut();
    $(".modal-backdrop").fadeOut()
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