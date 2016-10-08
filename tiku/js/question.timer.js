
var Timer = null;
var elm = $('body');
var setTimeoutDoExamTime=null;
function StartDoExamTime() {
    StopDoExamTime();
    setTimeoutDoExamTime = setInterval(function () {
        if (Timer && Timer.startTime > 0)
        {
            elm.trigger('triggerSubmitExamTime');
        }

    }, config.mk_exam_time * 60 * 1000);

}
function StopDoExamTime() {
    setTimeoutDoExamTime && clearInterval(setTimeoutDoExamTime);
}

var questionTimer = {
    init : function (query, callback) {
        Timer = new timer({
            trigger  : document.getElementById('page-timer-text'),
            startTime: query.startTime,
            stopTime : query.stopTime,
            timerType: query.timerType,
            callback: function () {
                callback && callback()
            }
        });

        Timer.start();

        //自动保存做题时间
        if (Timer.startTime > 0)
        {
            StartDoExamTime();
        }


    },
    /**
     * 计时开始
     */
    start: function () {
        Timer.start();

        //自动保存做题时间
        if (Timer.startTime > 0) {
            StartDoExamTime();
        }
    },
    /**
     * 计时结束
     */
    stop : function () {


        StopDoExamTime();


    },
    /**
     * 计时暂停
     */
    pause: function () {
        Timer.stop();

        StopDoExamTime();
    }
}
/**
 * Created by Administrator on 2016/7/23.
 */
