/**
 * Created by Administrator on 2016/6/13.
 */
(function($){
    $.fn.wordLimit = function(num){
        this.each(function(){
            if(!num){
                var copyThis = $(this.cloneNode(true)).hide().css({
                    'position': 'absolute',
                    'width': 'auto',
                    'overflow': 'visible'
                });
                $(this).after(copyThis);
                if(copyThis.width()>$(this).width()){
                    $(this).text($(this).text().substring(0,$(this).text().length-4));
                    $(this).html($(this).html()+'...');
                    copyThis.remove();
                    $(this).wordLimit();
                }else{
                    copyThis.remove(); //清除复制
                    return;
                }
            }else{
                var maxwidth=num;
                if($(this).text().length>maxwidth){
                    $(this).text($(this).text().substring(0,maxwidth));
                    $(this).html($(this).html()+'...');
                }
            }
        });
    }
})(jQuery);
$(function(){
    /*头部*/
    var timerCart=null;
    $(".cart-mini").mouseover(function(){
        if(timerCart)return;
        $(this).css({
            "color":"#36d38c",
            "background": "#fff"
        });
        $(".topbar-cart").addClass("topbar-cart-active");
        $(".cart-menu").css({
            height:100,
            zIndex:1000
        })
    }).mouseout(function() {
        $(".topbar-cart").removeClass("topbar-cart-active");
        timerCart = setTimeout(function () {
            $(".cart-menu").css({
                height: 0
            });
            timerCart = null;
        }, 50);
        $(".topbar-cart")[0].addEventListener("webkitTransitionEnd", function (){
            if($(".cart-menu").height()==0){
                $(".cart-mini").css({
                    transition:"none",
                    color: "#fff",
                    background: "#424242"
                })
            }

        });
    });
    $(".cart-menu").mouseenter(function(){
        clearTimeout(timerCart)
    }).mouseleave(function(){
        $(".topbar-cart").removeClass("topbar-cart-active");
        $(".cart-menu").css({
            height:0
        });
        timerCart=null;
    });
    /*吊牌*/
    $(".intro_slide_pin").delay(300).animate({top:-25},500,function(){
        $(this).animate({top:-20},200);
    });
    /*固定导航*/
    var height=$("#intro-header").outerHeight();
        $(window).scroll(function(){
            if($(window).scrollTop()<height){
                $(".intro-nav-main").removeClass("fixed")
            }else {
                $(".intro-nav-main").addClass("fixed");
            }
            if($(".intro-nav-main").css("position")=="fixed"){
                $(".nav-price-box").show();
            }else {
                $(".nav-price-box").hide();
            }
        })
    /*选项卡*/
    $(".nav-list a").click(function(){
        $(this).siblings().removeClass("cur");
        $(this).addClass("cur");
        $(".course-detail-content").hide().eq($(this).index()).show();
        n=$(this).index()
    })
    /*课程*/
    $(".brick-item").hover(function(){
        $(this).addClass("brick-item-active");
    },function(){
        $(this).removeClass("brick-item-active");
    });
    var iNow=1;
    var listWidth=$(".box-wrap").outerWidth();
    len=$(".box-wrap").find("li").length/3;
    $(".bx-next").click(function(){
        iNow++;
        if(iNow>len-1){
            iNow=1
        }
        $(".mainbox").animate({
            left:-listWidth*iNow
        },{
            complete: function () {
                if (iNow >= len - 1) {
                    $(this).css("left", -listWidth);
                    iNow = 1;
                } else if (iNow <= 0) {
                    $(this).css("left", -(len - 2) * listWidth);
                    iNow = len - 2;
                }
            }
        })
    });
    $(".bx-prev").click(function(){
        iNow--;
        if(iNow<0){
            iNow=1
        }
        $(".mainbox").animate({
            left:-listWidth*iNow
        },{
            complete:function(){
                if( iNow >= len-1  ){
                    $(this).css("left",-listWidth);
                    iNow = 1;
                }else if(iNow <= 0){
                    $(this).css("left",-(len-2)*listWidth);
                    iNow = len-2;
                }

            }
        })
    })
    /*课程大纲*/
    var h=0;
    $(".piece-body .chapter").data("onOff",true).each(function(index,item){
        $(this).click(function(){
            if($(this).data("onOff")){
                h=$(".period-list").eq(index).outerHeight();
                $(".period-list").eq(index).animate({
                    height:0
                })
                $(".period-list").eq(index).css("overflow","hidden");
                $(this).data("onOff",false)
            }else {
                $(".period-list").eq(index).animate({
                    height:h
                })
                $(this).data("onOff",true)
            }
        })
    })
    /*评论*/
    var $reviews = $('.js-reviews');
    $reviews.on('click', '.show-full-btn', function(){
        var $review = $(this).parents('.media');
        $review.find('.short-content').slideUp('fast', function(){
            $review.find('.full-content').slideDown('fast');
        });
        $(this).hide();
        $review.find('.show-short-btn').show();
    });

    $reviews.on('click', '.show-short-btn', function(){
        var $review = $(this).parents('.media');
        $review.find('.full-content').slideUp('fast', function(){
            $review.find('.short-content').slideDown('fast');
        });
        $(this).hide();
        $review.find('.show-full-btn').show();
    });
    /*溢出显示省略号*/
    $(".teacher-info").wordLimit(25);
    var data={
        title:"提问必答",
        content:"对于提问做到有问必答，帮您扫清学习过程中的种种障碍"
    };
    var html=template("Popup",data);
  $("#container_class_feature").find("span").hover(function(){
      $(html).appendTo("body");
      var pw=$(".popover").width()/2-$(this).width()/2;
      var ph=$(".popover").height()+16;
      $(".popover").css({
          left:$(this).offset().left-pw,
          top:$(this).offset().top-ph
      })
  },function(){
      $(".popover").remove()
  })
});

