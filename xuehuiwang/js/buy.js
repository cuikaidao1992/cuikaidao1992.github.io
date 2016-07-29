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
    $(".piece-body .chapter").click(function(){
        $(this).next().slideToggle()
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
    $(".teacer-module").parent().hover(function(){
        $(".teacer-btn span").fadeIn()
    },function(){
        $(".teacer-btn span").fadeOut()
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
    $("textarea").focus(function(){
        $(this).parent().removeClass("has-error");
        $(this).next().hide()
    })
    $("textarea").blur(function(){
        if($(this).text()==""){
            $(this).parent().addClass("has-error");
            $(this).next().show()
        }
    })
    $("#save").click(function(){
        $(this).prev().show();
        $(this).parent().parent().hide();
        $(this).parent().parent().prev().show();
    })
    /*问答*/
    $("#ask").click(function(){
        $(this).parent().hide();
        $(this).parent().next().show()
    })
    /*详情*/
    $(".detail").click(function(){
        $("#modalMore").fadeIn();

        $(".modal-backdrop").fadeIn()
    })
    $(".modal-header .close").click(function(){
        $("#modalMore").fadeOut();
        $(".modal-backdrop").fadeOut()
    })

    /*溢出显示省略号*/
    $(".teacher-info").wordLimit(70);
    var data={
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
      });
     $(".dropdown-toggle").click(function(){
         $(this).next().toggle()
     });
    $(".btn_order").click(function(){
        $(this).next().show();
        $(".es-share").css({
            zIndex:1000
        });
        $(".es-share").animate({
            top:28,
            opacity:1
        },{
            duration:250,
            easing:"linear",
            complete:function(){
                $(".share-weixin").css({
                    opacity:1
                });
                $(".share-qq").css({
                    opacity:1
                });
                $(".share-weixin").animate({
                    left:15
                });
                $(".share-qq").animate({
                    left:85
                })
            }
        })
    })
    $(".down").hover(function(){
        $(this).removeClass("es-icon-keyboardarrowdown").addClass("es-icon-keyboardarrowup")
        $(this).css({
            opacity:1
        })
        $(".coupon-box").find("ul").addClass("hover");
        $(".total-num").hide()

    },function(){
        $(this).removeClass("es-icon-keyboardarrowup").addClass("es-icon-keyboardarrowdown")
        $(this).css({
            opacity:.4
        })
        $(".coupon-box").find("ul").removeClass("hover");
        $(".total-num").show()
    })
    /*直播预告*/
    var n=0;
    var noticeTimer=null;
    var x=$(".live-notice").find("li").length;
    function notice(){
        noticeTimer=setInterval(function(){
            n++;
            $(".live-notice").animate({
                top:-41*n
            },{
                duration:250,
                easing:"linear",
                complete:function(){
                    if(n==x){
                        $(".live-notice").css({
                            top:0
                        });
                        n=0
                    }
                }
            })
        },3000)
    }
    notice();
    $(".title").mouseover(function(){
        clearInterval(noticeTimer)
    })
    $(".title").mouseout(function(){
        notice();
    })
    /*二维码*/
    $(".intro-title").find(".es-qrcode").click(function(){
        $(this).toggleClass("open")
    });
    var t=0;
    var i=$(".teacher-list").find("li").length;
    $(".teacher-right").click(function(){
        if(t<i-1){
            t++;
            $(".teacher-list").animate({
                left:-240*t
            })
        }
    });
    $(".teacher-left").click(function(){
        if(t>0){
            t--;
            $(".teacher-list").animate({
                left:-240*t
            })
        }
    })
    /*登录注册*/
    $('#xs-pop-login-iframe').load(function() { //方法2
        var iframeHeight=$(this).contents().height();
        $(this).height(iframeHeight+'px');
        var h=$(window).height()/2-iframeHeight/2+$(window).scrollTop();
        var w=$(window).width()/2-185;
        $("iframe").css({
            left:w,
            top:h,
            zIndex:1001
        });
        $(window).scroll(function(){
            var h=$(window).height()/2-205+$(window).scrollTop();
            var w=$(window).width()/2-185;
            $("iframe").css({
                left:w,
                top:h,
                zIndex:1001
            });
        });
    });
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

});

