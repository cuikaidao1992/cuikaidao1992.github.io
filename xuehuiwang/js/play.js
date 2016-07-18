/**
 * Created by Administrator on 2016/7/11.
 */
var h=$(window).height()-60;
var w=$(window).width()-360;
$(".js-box-wrap").css({
    height:h,
    width:"100%"
});
$(".playlist-none").find("img").css({
    height:h-50
});
$(window).resize(function(){
    var h=$(window).height()-60;
    $(".js-box-wrap").css({
        height:h
    });
});
function onOff(_this){
    if($(_this).attr("status")=="close"){
        $(".section-list").css({
            right:0
        });
        $(".js-box-wrap").css({
            width:w
        });
        $(".op").attr("status","close");
        $(_this).attr("status","open");
        $(_this).data("onOff",false);
        $(_this).addClass("active");
    }else {
        $(_this).removeClass("active");
        $(".js-box-wrap").css({
            width:"100%"
        });
        $(".section-list").css({
            right:-360
        });
        $(_this).attr("status","close");
    }
}
$(".chapter").attr("status","close").click(function(){
    $(".nano").hide();
    $("#course-item-list").show();
    onOff(this)
});
$(".data").attr("status","close").click(function(){
    $(".nano").hide();
    $("#data-item-list").show();
    onOff(this)
});
$(".task").attr("status","close").click(function(){
    $(".nano").hide();
    $("#task-item-list").show();
    onOff(this)
});
$(".lesson-item").click(function(){
    $(".lesson-item").removeClass("item-active");
    $(this).addClass("item-active")
});

$(".notes").click(function(){
    $("#note-publist").show()
});

$(".questions").click(function(){
    $("#discus-publish").show()
});

$(".evaluate").click(function(){
    $("#evaluate-publish").show()
});
$(".close").click(function(){
    $("#note-publist").hide();
    $("#discus-publish").hide();
    $("#evaluate-publish").hide()
});

$("#js-note-textarea").focus(function(){
    $(this).parent().addClass("fake-focus")
}).blur(function(){
    $(this).parent().removeClass("fake-focus")
});
$(".scan").click(function(){
    $(this).toggleClass("open")
})
/*评价*/
var ratingBtn=document.getElementById("rating-btn");
var aImg=ratingBtn.getElementsByTagName("img");
var k=-1;
for (var i=0;i<aImg.length;i++) {
    aImg[i].index = i;
    aImg[i].onmouseover = function () {
        for (var i = 0; i < aImg.length; i++) {
            if (i <= this.index) {
                $(aImg[i]).attr("src","images/star-on.png");
            } else {
                $(aImg[i]).attr("src","images/star-off.png");
            }
        }
    };
    aImg[i].onmouseout=function (){
        if(k>=0){
            for(var i=0;i<aImg.length;i++){
                if(i<=k){
                    $(aImg[i]).attr("src","images/star-on.png");
                }else{
                    $(aImg[i]).attr("src","images/star-off.png");
                }
            }

        }else {
            $("#rating-btn").find("img").attr("src","images/star-off.png");
        }
    };
    aImg[i].onclick=function (){
        k=this.index;
    }
}

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
});
$(".all-course-item").click(function(){
    $(this).siblings().removeClass("active");
    $(this).addClass("active")
})

$(".period-list").find(".header").data("onOff",true).click(function(){
    if($(this).data("onOff")){
        $(this).siblings().hide();
        $(this).data("onOff",false)
    }else {
        $(this).siblings().show();
        $(this).data("onOff",true)
    }
});