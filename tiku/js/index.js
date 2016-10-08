$(function () {
   
    $(".js-home").addClass("ui-check");
    $("#nav-div li").eq(3).addClass("on");//头部样式
    //
    $('#elevator').click(function () {
        $('body,html').animate({ scrollTop: 0 });
    });
    //END
    var elm = $('body'); 


    /**
     * 保存考试信息
     */

    var _ = {
       
        /**
         * 倒计时
         * @param date
         */
        countdown: function (date) {
            var dateElm = $('.page-exam-date-num').find('em'),
                numArr = _.formatDate(date).match(/\d/g);
            for (var i = 0; i < numArr.length; i++) {
                var j = 0, value = numArr[i], dateItemElm = dateElm.eq(i).find('i');
                _.animate(value, dateItemElm);
            }
        },
        /**
         * 效果
         * @param value
         * @param dateItemElm
         */
        animate: function (value, dateItemElm) {
            var top = dateItemElm.eq(0),
                duration = 500,
                bottom = dateItemElm.eq(1),
                topNum = (parseInt(top.data('i')) || 0) + 1;
            topNum = topNum > 9 ? 0 : topNum;
            if (topNum - 1 == value) {
                return;
            }
            top.data('range', value).attr('class', 'num-' + topNum).hide().slideDown(duration);
            //
            bottom.attr('class', 'num-' + (topNum - 1)).animate({
                height: 0
            }, duration, function () {
                top.data('i', topNum).hide().attr('class', 'num-' + (topNum + 1));
                bottom.height(36).attr('class', 'num-' + topNum);

                topNum != top.data('range') && _.animate(value, dateItemElm);
            });
        },
        /**
         * 时间格式
         * @param date
         * @returns {*}
         */
        formatDate: function (date) {
            var time = (+new Date(date)) - (+new Date()), dayNum;
            if (time > 0) {
                dayNum = Math.floor(time / (1000 * 60 * 60 * 24));
                dayNum = dayNum < 10 ? '00' + dayNum : dayNum < 100 ? '0' + dayNum : dayNum;
            } else {
                dayNum = '000';
            }
            return dayNum.toString();
        }
    };
    
    initDate !== '' && _.countdown(initDate);
    /*弹窗*/
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
    modal($(".a-change"),$("#modal-choice"),$(".close"));
    $(".free").click(function(){
        $(".tk-title-content").find("h2").text($(this).parent().find("h3").text());
        $("#modal-choice").fadeOut();
        $(".modal-backdrop").fadeOut()
    })
});
