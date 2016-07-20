/**
 * Created by shanglt on 15/12/9.
 */
$(function () {
    $(".wrap").css({
        height:$(window).height()
    });
    $(window).on("resize", function () {
        var h=$(window).height();
        $(".wrap").css({
            height:h
        });
    });

    $(".video-middle .lmb-r-tools  li").find("a").hover(function(){
        $(this).parent().addClass("bg")
    },function(){
        $(this).parent().removeClass("bg")
    });
    $.DW.config();

    // init template
    Template.init();

    // 发送聊天信息
    $('#chatContent').bind('keypress', function (e) {
        if (e.keyCode == 13) {
            sendChatMsg();
            e.preventDefault();
        }
    });
    $('#sendChat').click(function (e) {
        alert(1)
        sendChatMsg();
        e.preventDefault();
    });

    // 展示公告
    $('.gboxw .gbtn').click(function (e) {
        $('.gboxw .gbox').show();
        $(this).hide();
        e.preventDefault();
    });

    // 隐藏公告
    $('.gboxw .closegbox').click(function (e) {
        $('.gboxw .gbtn').show();
        $('.gboxw .gbox').hide();
        e.preventDefault();
    });

    // 发送问答信息
    $('#qaContent').bind('keypress', function (e) {
        if (e.keyCode == 13) {
            sendQuestion();
            e.preventDefault();
        }
    });
    $('#sendQa').click(function (e) {
        sendQuestion();
        e.preventDefault();
    });


    // 是否只看自己的问答
    $('#onlyMyOwnQas').click(function (e) {
        var isOnlyMyOwnQas = $(this).find('i').hasClass('active');

        if (isOnlyMyOwnQas) {
            // 只看自己的问答
            $('#qas li').hide();
            $('#qas li[self="1"]').show();
        } else {
            // 看全部问答
            $('#qas li[isAnswer="1"]').show();
        }
        e.preventDefault();
    });

    $('#logout').click(function (e) {
        var isC = confirm('确认要退出登录？');
        if (isC) {
            $.DW.logout();
        }
        e.preventDefault();
    });

    // 请求互动
    $('li[name="interaction"]').click(function (e) {
        if ($(this).hasClass('disable')) {
            return;
        }


        $('li[name="interaction"]').addClass('disable');
        $('#interactionApplying, #interactionStart').hide();


        $('#interactionTime').text('00:00');
        $('#interaction').show();
        var interactionType = $(this).attr('t');
        $.DW.loadInteraction(interactionType);

        if (typeof window.on_cc_live_interaction_start === 'function') {
            window.on_cc_live_interaction_start();
        }

        e.preventDefault();
    });

    // 关闭互动
    $('#closeInteraction').click(function (e) {
        var isC = confirm('确认要退出互动？');
        if (isC) {
            $('li[name="interaction"]').removeClass('disable');

            $.DW.hangupInteraction();
            $('#interaction').hide();

            if (typeof window.on_cc_live_interaction_stop === 'function') {
                window.on_cc_live_interaction_stop();
            }
        }

        e.preventDefault();
    });


    var announcement = $('#announcement').val();
    if (announcement) {
        window.on_cc_live_announcement_release({
            action: 'release',
            announcement: announcement
        });
    }

});

// 发送聊天信息
function sendChatMsg() {
    var content = $('#chatContent').val(), isPrivate = $('#isPrivateChat i').hasClass('active');
    var callback = function (err) {
        // 发送失败
        if (err) {
            return Tips.chat(err);
        }

        $('#chatContent').val('');
    };

    if (isPrivate) {
        $.DW.sendPrivateChat(content, callback);
    } else {
        $.DW.sendChat(content, callback);
    }
}

// 发送提问信息
function sendQuestion() {
    var content = $('#qaContent').val();
    var callback = function (err) {
        // 发送失败
        if (err) {
            return Tips.qa(err);
            return;
        }

        $('#qaContent').val('');
    };

    $.DW.question(content, callback);
}

// 播放器加载完成
function on_cc_live_player_init() {
    if ($('#barrage').val() == 1) {
        $.DW.openBarrage();
    }
}


// 接收聊天信息
function on_cc_live_chat_msg(data) {
    if ($('#barrage').val() == 1) {
        $.DW.barrage(data.msg);
    }

    // {userid: "94b806f846cf4fdb8707b4f66015be44", username: "ss", msg: "11111", time: "15:31:57"}
    $('#chat-list').append(Template.chatMsg({
        admin: data.userrole == 'publisher' || data.userrole == 'teacher' || data.userrole == 'host',
        name: data.username,
        content: showEm(data.msg),
        isFromMe: Viewer.isMe(data.userid)
    }));

    chatScroll();
}

// 发布公告
function on_cc_live_announcement_release(data) {
    var nmsg = '';
    var announcement = data.announcement;
    var na = '';
    if (announcement) {
        announcement = announcement.replace(/[\r\n]/g, " ");
        for (var i = 0; i < announcement.length; i++) {
            var a = announcement.charAt(i);
            if (a == String.fromCharCode(160)) {
                a = ' ';
            }
            na += a;
        }
    }
    $.each(na.split(' '), function (i, n) {
        var ur = /^(https?|s?ftp):\/\/(((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:)*@)?(((\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5]))|((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?)(:\d*)?)(\/((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)+(\/(([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)*)*)?)?(\?((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|[\uE000-\uF8FF]|\/|\?)*)?(#((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|\/|\?)*)?$/i;
        if (ur.test(n)) {
            nmsg += '<a style="color: #4685B5;" target="_blank" href="' + n + '">' + n + '</a> ';
        } else {
            nmsg += Handlebars.escapeExpression(n) + ' ';
        }
    });

    $('.gbox div').html(nmsg);
    $('li[name="chat"], .gbtn').click();
}

// 删除公告
function on_cc_live_announcement_remove(data) {
    $('.gbox div').html('暂无公告');
}

// 接收发送私聊
function on_cc_live_chat_private_question(data) {
    // {userid: "94b806f846cf4fdb8707b4f66015be44", username: "ss", msg: "123123", time: "15:54:03"}
    $("#chat-list").append(Template.privateChatMsg({
        fromUserName: data.username,
        admin: data.userrole == 'publisher' || data.userrole == 'teacher' || data.userrole == 'host',
        toUserName: '讲师',
        content: showEm(data.msg),
        isFromMe: Viewer.isMe(data.userid)
    }));

    chatScroll();
}

// 接收回答私聊
function on_cc_live_chat_private_answer(data) {
    // {"fromuserid":"d0d359766d694d0aa0e778094ff7d892","fromusername":"12312",
    //      "touserid":"94b806f846cf4fdb8707b4f66015be44","tousername":"ss","touserrole":"student",
    //      "msg":"12312","time":"15:57:32"}
    $("#chat-list").append(Template.privateChatMsg({
        fromUserName: '讲师',
        admin: data.userrole == 'publisher' || data.userrole == 'teacher' || data.userrole == 'host',
        toUserName: data.tousername,
        content: showEm(data.msg),
        isFromMe: Viewer.isMe(data.userid)
    }));

    chatScroll();
}

// 提问
function on_cc_live_qa_question(data) {
    //{"action":"question","time":-1,
    //      "value":{"userId":"94b806f846cf4fdb8707b4f66015be44","userName":"ss","content":"12312","id":"7FA2E5086C04DA61"}}
    var question = data.value;
    $("#qas").append(Template.question({
        id: question.id,
        questionUserId: question.userId,
        questionUserName: question.userName,
        content: question.content,
        isFromMe: Viewer.isMe(question.userId)
    }));

    qaScroll();
}

// 回答
function on_cc_live_qa_answer(data) {
    //{"action":"answer","time":-1,"value":
    //      {"questionId":"7FA2E5086C04DA61","content":"111111","isPrivate":0,
    //      "userId":"d0d359766d694d0aa0e778094ff7d892","userName":"12312","questionUserId":"94b806f846cf4fdb8707b4f66015be44"}}

    var answer = data.value;
    // 私密回答只能自己看
    if (!Viewer.isMe(answer.questionUserId) && answer.isPrivate) {
        return;
    }

    $("#" + answer.questionId).append(Template.answer({
        answerUserName: answer.userName,
        content: answer.content,
        isFromMe: Viewer.isMe(answer.questionUserId)
    })).attr('isAnswer', 1);

    var isOnlyMyOwnQas = $(this).find('i').hasClass('active');
    if (isOnlyMyOwnQas && !Viewer.isMe(answer.questionUserId)) {
        return;
    }
    $("#" + answer.questionId).show();

    qaScroll();
}


// 消息提醒
function on_cc_live_notification(data) {
    Tips.chat(data);
}

// // 在[chat_message，private_question，question]事件中，如果用户没有权限，则回调该函数显示提示信息
function on_cc_live_information(data) {
    //console.log('information', data);
    if (data.indexOf('发言') >= 0) {
        Tips.chat(data);
    } else {
        Tips.qa(data);
    }
}

// 在线人数
function on_cc_online_count(data) {
    $('#count').text(data);
}

// 开始播放
function on_cc_live_start(data) {
    //console.log('开始播放：', data);
}

// 停止播放
function on_cc_live_end(data) {
    $('li[name="interaction"]').hide();
    $.DW.hangupInteraction();
}

// 被踢出
function on_cc_live_logout() {

}

function on_cc_live_setting(data) {
    if (data.allow_speak_interaction == "true") {
        $('li[name="interaction"]').removeClass('disable');
        $('li[name="interaction"]').show();
        return;
    }

    $('li[name="interaction"]').addClass('disable');
    $('li[name="interaction"]').hide();
}

function on_cc_live_error(errorCode) {
    if (errorCode == 101) {

    }
}

var Template = {
    init: function () {
        if ($("#chatMsgTemplate").length) {
            this.chatMsg = Handlebars.compile($("#chatMsgTemplate").html());
        }
        if ($("#privateChatMsgTemplate").length) {
            this.privateChatMsg = Handlebars.compile($("#privateChatMsgTemplate").html());
        }
        if ($("#questionTemplate").length) {
            this.question = Handlebars.compile($("#questionTemplate").html());
        }
        if ($("#answerTemplate").length) {
            this.answer = Handlebars.compile($("#answerTemplate").html());
        }
    }
};

var Viewer = {
    id: $('#viewerId').val(),
    name: $('#viewerName').val(),
    role: $('#viewerRole').val(),
    sessionId: $.cookie('sessionid'),
    isMe: function (viwerId) {
        return viwerId == this.id;
    }
};

var Tips = {
    chat: function (msg) {
        if (!$.trim(msg)) {
            return;
        }
        this._tips($('#chatContent'), msg);
    },

    qa: function (msg) {
        if (!$.trim(msg)) {
            return;
        }
        this._tips($('#qaContent'), msg);
    },

    _tips: function ($o, msg) {
        var margin = ($(window).width() - $("body").width()) / 2;
        var chatX = $o.offset().left - margin,
            chatY = $o.offset().top;


        $('#input-tips').find('p').text(msg);
        $('#input-tips').css({'left': chatX, 'top': (chatY - 42)}).stop(1, 1).fadeIn(200).delay(1500).fadeOut(200);
    }
};


function chatScroll() {
    $("#chat-list").parent().scrollTop($("#chat-list").height());
}

function qaScroll() {
    $("#qas").parent().scrollTop($("#qas").height());
}
$("#btn-play").click(function(){
    $(this).toggleClass("close-bf")
});
$("#btn-voice").click(function(){
    $(this).toggleClass("close-sy")
});