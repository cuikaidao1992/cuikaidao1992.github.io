/**
 * Created by Administrator on 2016/6/14.
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

    /*横导航*/
    var f, a = $("#nav-list").find(".cur").size() > 0 ? $("#nav-list").find(".cur") : 0,
        b = 0,
        c = 0,
        d = 0,
        e = $("#nav-list").offset().left;
    a && (b = a.offset().left - e, c = a.width(), d = 1, $("#nav_line").css({
        left: b,
        width: c
    }).animate({
        opacity: 1
    }, 300)), $("#nav-list .nav-item").on("mouseenter", function () {
        var d = $(this).offset().left - e,
            f = $(this).width();
        a || (b = d, c = f), $("#nav_line").stop().animate({
            left: d,
            width: f,
            opacity: 1
        }, 500)
    }), $("#nav-list").mouseleave(function () {
        $("#nav_line").stop().animate({
            left: b,
            width: c,
            opacity: d
        }, 500)
    }), f = 0, $(window).on("scroll", function () {
        $(window).scrollTop() > 50 && !f ? ($("#header-nav").addClass("min"), f = 1) : $(window).scrollTop() < 50 && f && ($("#header-nav").removeClass(), f = 0)
    }), $(window).resize(function () {
        e = $("#nav-list").offset().left
    })
    /*搜索*/
    $("#search").focus(function(){
        $(".search-form").addClass("search-form-focus");
        $(".search-hot-words").fadeOut(100);
        $(".keyword-list").removeClass("hide")
    }).blur(function(){
        $(".search-form").removeClass("search-form-focus");
        $(".keyword-list").addClass("hide");
        $(".search-hot-words").fadeIn(100);
    });
    /*二级导航*/
    var subTimer1=null;
    var navSubMenu=$(".header-nav-menu");
    $(".course-select").mouseenter(function(){
        clearTimeout(subTimer1);
        navSubMenu.addClass("header-nav-menu-active");
        navSubMenu.animate({
            height:190
        },250);
    }).mouseleave(function(){
        subTimer1=setTimeout(function(){
            navSubMenu.removeClass("header-nav-menu-active");
            navSubMenu.animate({
                height:0
            },150)
        },300);
    });
    navSubMenu.mouseenter(function(){
        clearTimeout(subTimer1);
        $("#nav_line").stop().css({
            left:86
        })
    }).mouseleave(function(){
        $("#nav_line").stop().animate({
            left: b,
            width: c,
            opacity: d
        }, 500);
        navSubMenu.removeClass("header-nav-menu-active");
        navSubMenu.animate({
            height:0
        },200)
    });

    $(".brick-item").hover(function(){
        $(this).addClass("brick-item-active");
    },function(){
        $(this).removeClass("brick-item-active");
    });
    $(".tool-btn").click(function(){
        $(this).addClass("act");
        $(this).siblings().removeClass("act");
        $(".viewModule").hide();
        $(".viewModule").eq($(this).index()).show()
    })
    /*课程列表下拉菜单*/
    $(".course-category").mouseenter(function(){
        $(this).find("div").fadeIn()
    }).mouseleave(function(){
        $(this).find("div").fadeOut()
    })
    /*溢出显示省略号*/
    $(".subtitle").wordLimit(50);

    /*登录注册*/
    $(".login").click(function(){
        $("iframe")[0].src="logn.html";
        $(".over-mask").css({
            display:"block"
        });
        $("iframe").css({
            display:"block"
        });
    })
    $(".reginster").click(function(){
        $("iframe")[0].src="register.html";
        $(".over-mask").css({
            display:"block"
        });
        $("iframe").css({
            display:"block"
        });
    })
    $(".over-mask").css({
        height:$(document).height()
    })
})

