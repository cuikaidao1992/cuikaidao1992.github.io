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
/*搜索*/
$(function(){
    $(".toplayer-close").click(function(){
        $(".site-adv").remove()
    });
    $("#search").focus(function(){
        $(".search-form").addClass("search-form-focus");
        $(".search-hot-words").fadeOut(100);
        $(".keyword-list").removeClass("hide")
    }).blur(function(){
        $(".search-form").removeClass("search-form-focus");
        $(".keyword-list").addClass("hide");
        $(".search-hot-words").fadeIn(100);
    });
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
    /*横导航*/
    var f, a = $("#nav-list").find(".cur").size() > 0 ? $("#nav-list").find(".cur") : 0,
        b = 0,
        c = 58,
        d = 0,
        e = $("#nav-list").offset().left;
    a && (b = a.offset().left - e, c = a.width(), d = 1, $("#nav_line").css({
        left: b,
        width: 58
    }).animate({
        opacity: 1
    }, 300)), $("#nav-list .nav-item").on("mouseenter", function () {
        var d = $(this).offset().left - e,
            f = $(this).width();
        a || (b = d, c = f), $("#nav_line").stop().animate({
            left: d,
            width: 58,
            opacity: 1
        }, 500)
    }), $("#nav-list").mouseleave(function () {
        $("#nav_line").stop().animate({
            left: b,
            width: 58,
            opacity: d
        }, 500)
    }), f = 0, $(window).on("scroll", function () {
        $(window).scrollTop() > 50 && !f ? ($("#header-nav").addClass("min"), f = 1) : $(window).scrollTop() < 50 && f && ($("#header-nav").removeClass(), f = 0)
    }), $(window).resize(function () {
        e = $("#nav-list").offset().left
    })
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
            width:58,
            opacity: d
        }, 500);
        navSubMenu.removeClass("header-nav-menu-active");
        navSubMenu.animate({
            height:0
        },200)
    });
//nav
    $('#category').css({'z-index': '99', 'position': 'absolute'});
    $('.small_type').find('li').mouseover(function () {
        $(this).addClass('current')
    }).mouseout(function () {
        $(this).removeClass('current')
    });
    subMenu();
    function subMenu() {
        var $eachLi = $('.each_classify'), h0 = $eachLi.outerHeight();
        var maxL = $eachLi.length;
        var h1 = $('.classify_all').outerHeight(), h2 = $('.classify_inner').outerHeight();
        //h1是ul实际高度；h2是banner高度394
        //二级菜单显示：
        $eachLi.mouseenter(function () {
            if ($(this).find('em').length !== 0) {
                var $thirdBlock = $(this).find('.two_menu');
                $thirdBlock.fadeIn(100);
                thridMenu($thirdBlock);
            } else {
                return false;
            }
            $(this).find('.each_classify_inner h4 a').addClass('red');
            //$(this).find('.each_classify_inner h4 .angle_right').remove();
            $(this).find('.each_classify_inner h4 .angle_right').addClass('angle_right_hover');
        }).mouseleave(function () {
            $(this).find('.two_menu').fadeOut(100);
            $(this).find('.each_classify_inner h4 a').removeClass('red');
            $(this).find('.each_classify_inner h4 .angle_right').removeClass('angle_right_hover');
            //$(this).find('.each_classify_inner h4').append('<i class="angle_right"></i>');
        });
        //设置三级菜单位置和背景图
        function thridMenu(block) {
            var h = block.outerHeight();
            var pT = block.closest('.each_classify').position().top;
            var leftH = maxL > 8 ? h1 : h2;
            var cT = pT + h0 / 2 - h / 2;
            if (cT < 0) {
                blockCss(0);
            }
            else if (cT + h > leftH) {
                blockCss(leftH - h);
            }
            else {
                blockCss(cT);
            }
            function blockCss(t) {
                block.css({'top': t, 'backgroundPosition': '-220px' + ' ' + (-t) + 'px'});
            }
        }
    }
    /*home*/
    $(".nav-item a").mouseenter(function(){
        $(this).find("em").animate({"top":"0"}, 100);
        $(this).find("em").animate({"top":"14px"}, 100);
    });
    /*畅销好课*/
    var cxTimer=null;
    function autoPlay(){
        cxTimer=setInterval(function(){
            if($("#mainbox").position().left){
                if($("#mainbox").position().left==0){
                    $("#mainbox").animate({
                        left:-1215
                    },600);
                    $(".btn-next").addClass("control-disabled");
                    $(".btn-prev").removeClass("control-disabled");
                }else {
                    $(".btn-prev").addClass("control-disabled");
                    $(".btn-next").removeClass("control-disabled");
                    $("#mainbox").animate({
                        left:0
                    });
                }
            }
        },5000);
    }
    autoPlay();
    $(".btn-next").mouseover(function(){
        clearInterval(cxTimer);
    });
    $(".btn-next").mouseout(function(){
        autoPlay()
    });

    $(".btn-prev").mouseover(function(){
        clearInterval(cxTimer);
    })
    $(".btn-prev").mouseout(function(){
        autoPlay()
    })
    $(".btn-next").click(function(){
        $("#mainbox").animate({
            left:-1200
        });
        $(this).prev().removeClass("control-disabled");
        $(this).addClass("control-disabled")
    })
    $(".btn-prev").click(function(){
        $("#mainbox").animate({
            left:0
        });
        $(this).next().removeClass("control-disabled");
        $(this).addClass("control-disabled")
    });


    /*教育模块*/
    $(".brick-item").hover(function(){
        $(this).addClass("brick-item-active");
    },function(){
        $(this).removeClass("brick-item-active");
    })
    var c=0;
    $(".collect-btn").click(function(){
        $(this).toggleClass("active");
        c++;
        if(c==0){
            $(".loader").text("收藏中还没有课程，赶紧选课吧！")
        }else {
            $(".loader").text("您收藏了"+c+"个课程，赶紧登录学习吧")
        }
    });


    /*热门小组*/
    $(".group-item").hover(function(){
        $(this).find(".control").css({
            opacity: 1
        })
    },function(){
        $(".control").css({
            opacity: 0
        })
    });
    var iNow0=0;
    var iNow1=0;
    var iNow2=0;
    var iNow3=0;
    var iwidth=$(".item-list li").width();
    $(".group-list .control-next").click(function(){
        var i=$(this).parent().parent().index();
       if(i==0){
           if(iNow0<3){
               iNow0++;
               $(".item-list").eq(i).animate({
                   left:-iwidth*iNow0
               });
               $(".xm-pagers").eq(i).find("li").removeClass("pager-active").eq(iNow0).addClass("pager-active")
           }
       }else if(i==1){
           if(iNow1<3){
               iNow1++;
               $(".item-list").eq(i).animate({
                   left:-iwidth*iNow1
               });
               $(".xm-pagers").eq(i).find("li").removeClass("pager-active").eq(iNow1).addClass("pager-active")
           }
       }else if(i==2){
           if(iNow2<3){
               iNow2++;
               $(".item-list").eq(i).animate({
                   left:-iwidth*iNow2
               });
               $(".xm-pagers").eq(i).find("li").removeClass("pager-active").eq(iNow2).addClass("pager-active")
           }
       }else {
           if(iNow3<3){
               iNow3++;
               $(".item-list").eq(i).animate({
                   left:-iwidth*iNow3
               });
               $(".xm-pagers").eq(i).find("li").removeClass("pager-active").eq(iNow3).addClass("pager-active")
           }
       }
    });
    $(".group-list .control-prev").click(function(){
        var i=$(this).parent().parent().index();
        if(i==0){
            if(iNow0>0){
                iNow0--;
                $(".item-list").eq(i).animate({
                    left:-iwidth*iNow0
                });
                $(".xm-pagers").eq(i).find("li").removeClass("pager-active").eq(iNow0).addClass("pager-active")
            }
        }else if(i==1){
            if(iNow1>0){
                iNow1--;
                $(".item-list").eq(i).animate({
                    left:-iwidth*iNow1
                });
                $(".xm-pagers").eq(i).find("li").removeClass("pager-active").eq(iNow1).addClass("pager-active")
            }
        }else if(i==2){
            if(iNow2>0){
                iNow2--;
                $(".item-list").eq(i).animate({
                    left:-iwidth*iNow2
                });
                $(".xm-pagers").eq(i).find("li").removeClass("pager-active").eq(iNow2).addClass("pager-active")
            }
        }else {
            if(iNow3>0){
                iNow3--;
                $(".item-list").eq(i).animate({
                    left:-iwidth*iNow3
                });
                $(".xm-pagers").eq(i).find("li").removeClass("pager-active").eq(iNow3).addClass("pager-active")
            }
        }
    });
    var cur="";
    $(".xm-pagers li").click(function(){
        var n=$(this).index();
        var i=$(this).parent().parent().parent().index();
        $(this).parent().parent().prev().find(".item-list").animate({
            left:-iwidth*n
        });
        $(this).parent().find("li").removeClass("pager-active");
        $(this).addClass("pager-active");
        if(i==0){
            iNow0=n;
        }else if(i==1){
            iNow1=n;
        }else if(i==2){
            iNow2=n;
        }else if(i==3){
            iNow3=n;
        }
    });
    /*导航tab*/
    $(".hightbg").each(function(){
        $(this).find(".tab_item").mouseover(function() {
            var e = $(this).parent().find(".moving_bg");
            w=$(this).width();
            $(this).siblings().removeClass("active");
            $(this).addClass("active");
            $(e).stop().animate({
                    left: $(this).position().left+10,
                    width:$(this).width()
                },
                {
                    duration: 300
                });
        })
    })
    /*溢出显示省略号*/
    $(".dynamic-item .over-ellipsis").wordLimit(45);
    $(".evaluate-item .over-ellipsis").wordLimit(13);
    /*学慧网大家庭*/
    var itemOverTimer;
    $(".site-family").on({
        mouseleave:function(){
            $("#js-family-mask").show().stop().animate({opacity:0.6},200);
            $("#js-family-text").show().stop().animate({opacity:1},200);
        },
        mouseenter:function(){
            $("#js-family-mask").stop().animate({opacity:0},200,function(){ $("#js-family-mask").hide(); });
            $("#js-family-text").stop().animate({opacity:0},200,function(){ $("#js-family-text").hide(); });
        }
    }).on("mouseenter",".js-family-item",function(){
        var _this=this;
        clearTimeout(itemOverTimer);
        itemOverTimer=setTimeout(function(){
            showItemInfo(_this);
        },800);
    }).on("mouseleave",".js-family-item",function(){
        clearTimeout(itemOverTimer);
        $(this).find(".js-family-info").fadeOut("fast");
    });

    function showItemInfo(el){
        $(el).find(".js-family-info").fadeIn("fast");
    }
    //回到顶部
    function showScroll(){
        $(window).scroll( function() {
            var scrollValue=$(window).scrollTop();
            scrollValue > 200 ? $('#backTop').css("display","block"):$('#backTop').fadeOut();
        });
        $('#backTop').click(function(){
            $("html,body").animate({scrollTop:0},500);
        });
    }
    showScroll();
    /*登录*/
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
});
