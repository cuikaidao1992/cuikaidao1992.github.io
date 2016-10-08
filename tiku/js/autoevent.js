$(function () {
    //计时开始
    questionTimer.init({
        startTime: 9000,
        stopTime: 0,
        timerType: 'down'

    }, StopDoExamTime());
    //时钟
    var timeIcon = $('#page-timer-icon'),
        intervalCount = 0;
    setInterval(function () {
        intervalCount += 10;
        intervalCount = intervalCount > 360 ? 10 : intervalCount;
        timeIcon.css({ '-webkit-transform': 'rotate(' + intervalCount + 'deg)', '-moz-transform': 'rotate(' + intervalCount + 'deg)', 'transform': 'rotate(' + intervalCount + 'deg)' });
    }, 1000);

    //自动保存用户答案
    setInterval(function () {
        elm.trigger('triggerSubmitQuestion');
    }, config.mk_wait_time);
});
