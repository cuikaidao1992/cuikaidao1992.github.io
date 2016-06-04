$(function(){
    if (navigator.appVersion.indexOf("MSIE") != -1) {
        $('#right_float ul li').find('.up').mouseenter(function(){
            $(this).find('p span').hide();
        }).mouseleave(function(){
            $(this).find('p span').show();
        });
    }else{
        $('#right_float ul li').mouseenter(function(){
            $(this).find('.up p').stop(false).animate({top:-52},350);
        }).mouseleave(function(){
            $(this).find('.up p').stop(false).animate({top:0},350);
        });
    }
    $('#tel ,#wechat ,#app,#qq').mouseenter(function(){
        $(this).find('.telephone_r').stop(false).fadeIn();
        $(this).find('.Wechat').stop(false).fadeIn();
        $(this).find('.app_QR').stop(false).fadeIn();
        $(this).find('.qq_content').stop(false).fadeIn();
    }).mouseleave(function(){
        $(this).find('.telephone_r').stop(false).fadeOut();
        $(this).find('.Wechat').stop(false).fadeOut();
        $(this).find('.app_QR').stop(false).fadeOut();
        $(this).find('.qq_content').stop(false).fadeOut();
    });
    //回到顶部
    function showScroll(){
        $(window).scroll( function() {
            var scrollValue=$(window).scrollTop();
            scrollValue > 200 ? $('#scroll_top').fadeIn():$('#scroll_top').fadeOut();
        });
        $('#scroll_top').click(function(){
            $("html,body").animate({scrollTop:0},500);
        });
    }
    showScroll();
});
