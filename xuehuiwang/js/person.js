/**
 * Created by Administrator on 2016/6/28.
 */
$(function() {
    $.sidebarMenu = function(menu) {
        var animationSpeed = 300;
        $(menu).on('click',".v-title", function(e) {
            var $this = $(this);
            var checkElement = $this.next();
            if (checkElement.is('.treeview-menu') && checkElement.is(':visible')) {
                checkElement.slideUp(animationSpeed, function() {
                    checkElement.removeClass('menu-open');
                });
                checkElement.parent("li").removeClass("active");
                $(this).children().css({
                    "transform": "rotate(0)"
                });
            }
            else if ((checkElement.is('.treeview-menu')) && (!checkElement.is(':visible'))) {
                var parent = $this.parents('ul').first();
                var ul = parent.find('ul:visible').slideUp(animationSpeed);
                ul.removeClass('menu-open');
                var parent_li = $this.parent("li");
                checkElement.slideDown(animationSpeed, function() {
                    checkElement.addClass('menu-open');
                    parent.find('li.active').removeClass('active');
                    parent_li.addClass('active');
                });
                $(this).children().css({
                    "transform": "rotate(180deg)"
                });
            }
            if (checkElement.is('.treeview-menu')) {
                e.preventDefault();
            }
        });
    }
    //左侧导航随屏滚
    var clienthight=document.body.clientHeight;//获取浏览器的高度
    var winheight=$(window).height() ;
    if (winheight> 100&&winheight<700) {
        $(window).on('scroll', function() {
            var start = 85; //临界点，大于此值时为fixed状态，小于此值时为absolute;
            var $elem = $('.slider');
            var curL = $('.wrap').offset().left;
            var curT = $(window).scrollTop();
            if (curT > start&&(curT-250)>0) {//判断滑动高度是否大于页底高度
                $elem.find('.img').addClass('suimg');
                $elem.find('.set-btn').addClass('su-set-btn');
                $elem.find('.user-pic-bg').addClass('su-user-pic-bg');
                $elem.css('position', 'fixed').css('left', curL + 'px').css('top','-328px');
            }
            else{
                $elem.find('.set-btn').removeClass('su-set-btn');
                $elem.find('.img').removeClass('suimg');
                $elem.find('.user-pic-bg').removeClass('su-user-pic-bg');
                $elem.css('position', 'absolute').css('left', '0').css('top','-210px');
            }
        });
    }
    if (winheight >900) {
        $(window).on('scroll', function() {
            var start = 85; //临界点，大于此值时为fixed状态，小于此值时为absolute;
            var $elem = $('.slider');
            var curL = $('.wrap').offset().left;
            var curT = $(window).scrollTop();
            if (curT > start) {
                $elem.find('.set-btn').addClass('su-set-btn');
                $elem.find('.img').addClass('suimg');
                $elem.find('.user-pic-bg').addClass('su-user-pic-bg');
                $elem.css('position', 'fixed').css('left', curL + 'px').css('top','-50px');
            } else {
                $elem.find('.set-btn').removeClass('su-set-btn');
                $elem.find('.img').removeClass('suimg');
                $elem.find('.user-pic-bg').removeClass('su-user-pic-bg');
                $elem.css('position', 'absolute').css('left', '0').css('top', '-209px'); //-175声明在css中
            }
        });
    }
    $('.signicon').hover(function() {
        $(this).find("span").show()
    }, function() {
        $(this).find("span").hide()
    });
    $(".xh-conmore").data("onOff",true).click(function(){
        if($(this).data("onOff")){
            $(".xh-tab ").find("li").show();
            $(".xh-menu").css({
                height:$(".xh-content").height()
            });
            $(this).data("onOff",false)
        }else {
            $(".xh-menu").css({
                height:62
            });
            $(this).data("onOff",true)
        }
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
    });
    var x=$(".xh-tab").find("li").length;
    $(".xh-tab").find("li").click(function(){
        $(this).siblings().removeClass("xh-cur");
        $(this).addClass("xh-cur");
        if($(this).index()>2){
            $(this).insertBefore($(".xh-tab").find("li").eq(0));
            $(".xh-tab").find("li").removeClass("last");
            $(".xh-tab").find("li").eq(x-1).addClass("last")
        }

    });

    $(".xh-sub-tab").find("li").click(function(){
        $(this).siblings().removeClass("xh-sub-cur");
        $(this).addClass("xh-sub-cur");
        $(".js-course-list").hide();
        $(".js-course-list").eq($(this).index()).show();
    })

    $(".js-search").focus(function(){
        $(this).css({
            width:80
        })
    }).blur(function(){
        $(this).css({
            width:45
        })
    });
    function modal(btn,modal,back){
        btn.click(function(){
            modal.fadeIn();
            $(".modal-backdrop").fadeIn();
            modal.find(".modal-dialog").css({
                marginTop:($(window).height()-modal.find(".modal-dialog").height())/2
            });
            $(window).resize(function(){
                modal.find(".modal-dialog").css({
                    marginTop:($(window).height()-modal.find(".modal-dialog").height())/2
                })
            });
        });

        $(".modal-header .close").click(function(){
            modal.fadeOut();
            $(".modal-backdrop").fadeOut()
        });
        if(back){
            back.click(function(){
                modal.fadeOut();
                $(".modal-backdrop").fadeOut()
            })
        }
    }
    $(".set-nav-head").find("li").click(function(){
        $(this).siblings().removeClass("tab-cur");
        $(this).addClass("tab-cur");
        $("#set-person-info").find(".panel-body").hide();
        $("#set-person-info").find(".panel-body").eq($(this).index()).show()
    });
    modal($(".amend"),$("#modal"),$(".back"));
    modal($(".modal-logn"),$("#modal-logn"),$(".back"));
    modal($(".modal-pay"),$("#modal-pay"),$(".back"));
    modal($(".modal-questions"),$("#modal-questions"),$(".back"));
    modal($(".bind_mobile"),$("#bind_mobile"),$(".back"));
    modal($(".exam-set"),$("#modal-set-exam"),$(".back"));
    modal($(".promotelink"),$("#sharemodal"),$(".back"));
    modal($(".writeinvitecode"),$("#writemodal"),$(".back"));
    modal($(".btn-line-gray"),$("#modal"),$(".back"));

    $(".class-account-nav").find("li").click(function(){
        $(this).siblings().removeClass("active");
        $(this).addClass("active")
    });

    /*我的笔记*/
    $(".notebook-title").find("i").data("onOff",true).each(function(index,item){
        $(this).click(function(){
            if($(this).data("onOff")){
                $(this).parent().next().fadeIn();
                $(this).data("onOff",false)
            }else {
                $(this).parent().next().fadeOut();
                $(this).data("onOff",true);
                $(".modal-backdrop").fadeOut()
            }
        })
    })

    /*二维码*/
    $(".es-qrcode").click(function(){
        $(this).toggleClass("open")
    });
    $(".change-choice").find("li").click(function(){
        $(this).siblings().removeClass("on");
        $(this).addClass("on");
        $(".change-infos").find(".kuangke").hide();
        $(".change-infos").find(".kuangke").eq($(this).index()).show()
    })
    $(".bill-nav").find("li").click(function(){
        $(this).siblings().removeClass("tab-cur");
        $(this).addClass("tab-cur");
        $(".js-bill-list").hide();
        $(".js-bill-list").eq($(this).index()).show()
    })
    $(".class-account").find("li").click(function(){
        $(this).siblings().removeClass("active");
        $(this).addClass("active");
        $(".class-account-item").hide();
        $(".class-account-item").eq($(this).index()).show()
    })
    $(".class-orders .nav-pills").find("li").click(function(){
        $(this).siblings().removeClass("active");
        $(this).addClass("active")
    })
    $(".choice_set").click(function(){
        $(this).next().toggle()
    })
    $(".editExamBtn").click(function(){
        var l=$(this).offset().left-$(".modal-content").offset().left-15;
        $("#editExamView").show();
        $("#editExamView").css({
            left:l
        })
    });
    $("#cancelEditBtn").click(function(){
        $("#editExamView").hide()
    });
    /*显示隐藏*/
    $.sidebarMenu($('.v-right-top2'))

    $("#n-con").hover(function(){
        $(".operate").fadeIn()
    },function(){
        $(".operate").fadeOut()
    })
    modal($(".edit"),$("#modal-edit"),$(".back"));
    modal($(".del"),$("#modal-del"),$(".back"));
    modal($(".revert"),$("#modal-edit"),$(".back"));
    modal($(".q_nav_btn"),$("#modal-ask"),$(".back"));
  /*日历*/
    $(".mc-calendar").click(function(){
        $(".calendar").fadeIn();
        $(".modal-backdrop").fadeIn()
    })
    $("#pp-layer-close").click(function(){
        $(".calendar").fadeOut();
        $(".modal-backdrop").fadeOut()
    })

    modal($(".change"),$("#modal-change"),$(".back"));
    modal($(".rebuild"),$("#modal-rebuild"),$(".back"));
    modal($(".dropout"),$("#modal-dropout"),$(".back"));

});