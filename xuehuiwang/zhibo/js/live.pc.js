/**
 * PC端直播页面直播SDK.js
 *
 * Created by shanglt on 15/12/07.
 */
!(function ($, window, document) {

    // 直播播放器信息
    var LivePlayer = function (opts) {
        this.isReady = false;
        this.isPublishing = 0;
        this.id = opts.livePlayer.id;

        var swfUrl = '//zeus.csslcloud.net/flash/Player.swf';
        var flashvars = {
            "userid": opts.userId,
            "roomid": opts.roomId,
            'type': 'liveplayer'
        };

        var buffer = opts.livePlayer.buffer;
        if (buffer > 0) {
            flashvars.buffer = buffer;
        }

        var params = {
            allowFullscreen: 'true',
            allowScriptAccess: 'always',
            wmode: 'transparent'
        };
        swfobject.embedSWF(swfUrl, opts.livePlayer.id, opts.livePlayer.width, opts.livePlayer.height, '10.0.0',
            '/flash/expressInstall.swf', flashvars, params);

        this.getFlash = function () {
            return swfobject.getObjectById(this.id);
        };

        // 获取当前播放时间
        this.getPlayerTime = function () {
            var t = parseInt(this.getFlash()._time());
            if (isNaN(t) || t < 0) {
                return 0;
            }
            return t;
        };

        // 开始推流
        this.start = function () {
            this.isPublishing = 1;
            this.getFlash()._streamStart();
        };

        // 结束推流
        this.end = function () {
            this.isPublishing = 0;
            this.getFlash()._streamEnd();
        };

        // 获取线路信息
        this.getPlayLine = function () {
            var lines = this.getFlash().getLine();
            if (lines) {
                lines = JSON.parse(lines);
            }
            return lines;
        };

        // 切换线路
        this.changeLine = function (line, callback) {
            var err = undefined;
            try {
                this.getFlash().changeLine(line);
            } catch (e) {
                err = e;
            } finally {
                if (typeof callback === 'function') callback(err);
            }
        };

        // 弹幕
        this.barrage = function (m) {
            if (!m) {
                return;
            }

            if (!this.getFlash()) {
                return;
            }

            var newm = $.trim(m);
            if (!newm) {
                return;
            }
            newm = m.replace(/\[em2?_([0-9]*)\]/g, '');

            if (this.getFlash()._jsTOASbarrage) {
                this.getFlash()._jsTOASbarrage({
                    'txt': newm
                });
            }
        };

        // 关闭弹幕按钮
        this.closeBarrage = function () {
            this.getFlash()._barrage(false);
        };

        // 开启弹幕按钮
        this.openBarrage = function () {
            this.getFlash()._barrage(true);
        };

        // 打开声音
        this.openSound = function () {
            this.getFlash()._onSound();
        };

        // 关闭声音
        this.closeSound = function () {
            this.getFlash()._unSound();
            //this.getFlash()._reload();
        };
    };

    // 创建socket对象，负责进行socket通信，以及监听socket事件
    var Socket = function (opts, player, live) {
        var socket = io.connect(document.location.protocol + '//' + opts.chat.host + '/' + opts.roomId, {
            query: {
                sessionid: opts.viewer.sessionId,
                platform: 1,
                terminal: 0
            }
        });

        // 验证成功
        socket.on('connect', function () {
            try {
                if (typeof window.on_cc_live_handshake_success === 'function') {
                    window.on_cc_live_handshake_success();
                }
            } catch (e) {
                if (typeof window.on_cc_live_handshake_fail === 'function') {
                    window.on_cc_live_handshake_fail();
                }
            }
        });

        // 获取聊天信息
        socket.on('chat_message', function (data) {
            if (typeof window.on_cc_live_chat_msg === 'function') {
                window.on_cc_live_chat_msg(toJson(data));
            }
        });

        // 单个用户禁言，发送聊天返回事件
        socket.on('silence_user_chat_message', function (data) {
            if (typeof window.on_cc_live_chat_msg === 'function') {
                window.on_cc_live_chat_msg(toJson(data));
            }
        });

        // 消息提醒
        socket.on('notification', function (data) {
            if (typeof window.on_cc_live_notification === 'function') {
                window.on_cc_live_notification(data);
            }
        });

        // 接收发送私聊函数
        socket.on('private_question', function (data) {
            // 接受返回私聊数据
            if (typeof window.on_cc_live_chat_private_question === 'function') {
                window.on_cc_live_chat_private_question(toJson(data));
            }
        });

        // 接收回答私聊函数
        socket.on('private_answer', function (data) {
            if (typeof window.on_cc_live_chat_private_answer === 'function') {
                window.on_cc_live_chat_private_answer(toJson(data));
            }
        });

        // 在[chat_message，private_question，question]事件中，如果用户没有权限，则回调该函数显示提示信息
        socket.on('information', function (data) {
            // data(string) 提示信息
            if (typeof window.on_cc_live_information === 'function') {
                window.on_cc_live_information(data);
            }
        });

        // 直播开始推流
        socket.on('publish_stream', function (data) {
            live.livePlayer.start();

            if (typeof window.on_cc_live_start === 'function' && player.isReady) {
                window.on_cc_live_start(data);
            }
        });

        // 直播结束推流
        socket.on('end_stream', function (data) {
            debug('play', '结束推流');

            live.livePlayer.end();
            live.drawPanel.clear();

            if (typeof window.on_cc_live_end === 'function') {
                window.on_cc_live_end(data);
            }
        });

        // 显示画板信息
        socket.on('draw', function (data) {
            if (typeof window.on_cc_live_dw_draw === 'function') {
                window.on_cc_live_dw_draw(data);
            }
        });

        // 画板文档翻页
        socket.on('page_change', function (data) {
            if (typeof window.on_cc_live_dw_page_change === 'function') {
                window.on_cc_live_dw_page_change(data);
            }
        });

        // 提问
        socket.on('question', function (data) {
            if (typeof window.on_cc_live_qa_question === 'function') {
                window.on_cc_live_qa_question(toJson(data));
            }
        });

        // 回答
        socket.on('answer', function (data) {
            if (typeof window.on_cc_live_qa_answer === 'function') {
                window.on_cc_live_qa_answer(toJson(data));
            }
        });

        // 直播间信息
        socket.on('room_setting', function (data) {
            // {"allow_chat": "true", "allow_question": "true", "allow_speak_interaction": "true"}
            if (typeof window.on_cc_live_setting === 'function') {
                window.on_cc_live_setting(toJson(data));
            }
        });

        // 在线人数
        socket.on('room_user_count', function (data) {
            if (typeof window.on_cc_online_count === 'function') {
                window.on_cc_online_count(data);
            }
        });

        // 被踢出
        socket.on('kick_out', function (data) {
            if (typeof window.on_cc_live_logout === 'function') {
                window.on_cc_live_logout(data);
            }

            live.livePlayer.isPublishing = 0;

            setTimeout(function () {
                live.logout();
            }, 2000);
        });

        // 双向视频 接受请求
        socket.on('accept_speak', function (data) {
            // {viewerId:'asfasga',viewerName:'请求者', type'video/audio'}
            if (typeof window.on_cc_live_accept_interaction === 'function') {
                window.on_cc_live_accept_interaction(toJson(data));
            }
        });

        // 双向视频 挂断
        socket.on('hangup_interaction', function (data) {
            //{viewerId:'asfasga',viewerName:'请求者', type'video/audio'}
            if (typeof window.on_cc_live_hangup_interaction === 'function') {
                window.on_cc_live_hangup_interaction(toJson(data));
            }
        });

        socket.on('error_information', function (data) {
            if (typeof window.on_cc_live_error === 'function') {
                window.on_cc_live_error(toJson(data));
            }
        });

        /**
         * 公告（发布，删除）
         *  data = {
         *     action: 'release|remove',
         *     announcement: '公告内容'
         *  }
         * */
        socket.on('announcement', function (data) {
            data = toJson(data);

            if (data.action == 'release') {
                if (typeof window.on_cc_live_announcement_release === 'function') {
                    window.on_cc_live_announcement_release(data);
                }
            } else if (data.action == 'remove') {
                if (typeof window.on_cc_live_announcement_remove === 'function') {
                    window.on_cc_live_announcement_remove(data);
                }
            }
        });

        // 发送聊天信息
        live.chatFrequency = true;
        live.chatFrequencyTime = 5 * 1000;
        this.sendChat = function (msg, isPrivateChat, callback) {
            debug('发送isPrivateChat=' + isPrivateChat + '聊天：', msg);
            var err = undefined;
            try {
                if (!live.chatFrequency) {
                    throw '聊天过于频繁，请稍后';
                }

                msg = $.trim(msg);
                if (!msg) {
                    throw '聊天信息不能为空';
                }
                if (msg.length > 300) {
                    throw '聊天不能超过300个字符';
                }

                var nmsg = '';
                $.each(msg.split(' '), function (i, n) {
                    var ur = /^(https?|s?ftp):\/\/(((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:)*@)?(((\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5]))|((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?)(:\d*)?)(\/((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)+(\/(([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)*)*)?)?(\?((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|[\uE000-\uF8FF]|\/|\?)*)?(#((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|\/|\?)*)?$/i;
                    if (ur.test(n)) {
                        nmsg += '[uri_' + n + '] '
                    } else {
                        nmsg += n + ' ';
                    }
                });

                if (isPrivateChat) {
                    socket.emit('private_question', $.trim(msg));
                } else {
                    socket.emit('chat_message', $.trim(nmsg));
                }

                setTimeout(function () {
                    live.chatFrequency = true;
                }, live.chatFrequencyTime);
                live.chatFrequency = false;
            } catch (e) {
                err = e;
            } finally {
                if (typeof callback === 'function') callback(err);
            }
        };

        // 客户发出提问信息
        live.qaFrequency = true;
        live.qaFrequencyTime = 5 * 1000;
        this.question = function (content, callback) {
            var j = {
                'action': 'question',
                'value': {
                    'userId': opts.viewer.id,
                    'userName': opts.viewer.name,
                    'content': $.trim(content)
                }
            };

            debug('提问：', j);

            var err = undefined;
            try {
                if (player.isPublishing == 0) {
                    throw '直播未开始，无法提问';
                }

                if (!live.qaFrequency) {
                    throw '提问过于频繁，请稍后';
                }

                var q = j.value.content;
                if (!q) {
                    throw '提问信息不能为空';
                }
                if (q.length > 300) {
                    throw '问题不能超过300个字符';
                }

                socket.emit('question', JSON.stringify(j));
                setTimeout(function () {
                    live.qaFrequency = true;
                }, live.qaFrequencyTime);
                live.qaFrequency = false;
            } catch (e) {
                err = e;
            } finally {
                if (typeof callback === 'function') callback(err);
            }
        };

        // TODO 请求频率
        live.interactionFrequency = true;
        live.interactionFrequencyTime = 5 * 1000;
        // 请求互动
        this.applyInteraction = function (type, callback) {
            var j = {
                'viewerId': opts.viewer.id,
                'viewerName': opts.viewer.name,
                'type': type
            };

            var err = undefined;
            try {
                if (j.type != 'video' && j.type != 'audio') {
                    throw '参数错误';
                }

                //request_speak{viewerId:'asfasga',viewerName:'请求者', type'video/audio'}
                socket.emit('request_speak', JSON.stringify(j));
            } catch (e) {
                err = e;
            } finally {
                if (typeof callback === 'function') callback(err);
            }
        };

        // 推流互动
        this.publishedInteraction = function (type, callback) {
            // TODO 参数验证
            var j = {
                'viewerId': opts.viewer.id,
                'viewerName': opts.viewer.name,
                'type': type
            };

            var err = undefined;
            try {
                //flash_speak_published{viewerId:'asfasga',viewerName:'请求者', type'video/audio'}
                socket.emit('flash_speak_published', JSON.stringify(j));
            } catch (e) {
                err = e;
            } finally {
                if (typeof callback === 'function') callback(err);
            }
        };

        //挂断互动
        this.hangupInteraction = function (type, callback) {
            // TODO 参数验证
            var j = {
                'viewerId': opts.viewer.id,
                'viewerName': opts.viewer.name,
                'type': type
            };

            debug('interaction', '挂断事件：' + JSON.stringify(j))

            var err = undefined;
            try {
                //flash_speak_published{viewerId:'asfasga',viewerName:'请求者', type'video/audio'}

                socket.emit('hangup_interaction', JSON.stringify(j));
            } catch (e) {
                err = e;
            } finally {
                if (typeof callback === 'function') callback(err);
            }
        };


        setTimeout(function () {
            try {
                socket.emit('room_user_count');
            } catch (e) {
            }
            try {
                socket.emit('room_context');
            } catch (e) {
            }
        }, 1500);
        setInterval(function () {
            try {
                socket.emit('room_user_count');
            } catch (e) {
            }
            try {
                socket.emit('room_context');
            } catch (e) {
            }
        }, 15000);
    };

    // 打印debug信息
    var debug = function (t, d) {
        var isDegbug = false;
        if (!isDegbug) {
            return;
        }

        if (console && typeof console.log === 'function') {
            console.log(t, d);
        }
    };

    function toJson(data) {
        if (typeof data === 'string') {
            try {
                return JSON.parse(data);
            } catch (e) {
                return {};
            }
        }

        return data;
    }

    function initDrawPanelInfo() {
        if (!isHistoryReady) {
            setTimeout(function () {
                initDrawPanelInfo();
            }, 3000);
            return;
        }

        if (draws.length) {
            $.each(draws, function (i, o) {
                live.drawPanel.draw(o);
            });
            draws = [];
        }

        // 显示最后一张图片
        if (pageChanges.length) {
            var ppc = pageChanges.pop();
            if (ppc) {
                live.drawPanel.filp(ppc);
            }

            pageChanges = [];
        }
    }

    var DrawPanel = function (opts) {
        this.isReady = false;

        var swfUrl = '//zeus.csslcloud.net/flash/Player.swf';
        var flashvars = {
            'type': 'drawpanel'
        };
        var params = {
            allowFullscreen: 'true',
            allowScriptAccess: "always",
            wmode: 'transparent'
        };
        var attributes = {};
        swfobject.embedSWF(swfUrl, opts.drawPanel.id, opts.drawPanel.width, opts.drawPanel.height,
            "10.0.0", "/flash/expressInstall.swf", flashvars, params, attributes);

        this.getSwf = function () {
            if (!this.isReady) {
                return;
            }

            return swfobject.getObjectById(opts.drawPanel.id);
        };

        this.clear = function () {
            var swf = this.getSwf();
            if (!swf) {
                return;
            }
            // clear == _streamEnd
            swf.clear();
        };

        // 画图
        this.draw = function (j) {
            var swf = this.getSwf();
            if (!swf) {
                return;
            }
            swf.draw(j);
        };

        // 翻页
        this.filp = function (j) {
            var swf = this.getSwf();
            if (!swf) {
                return;
            }
            swf.filp(j);
        };
    };

    var draws = [];
    var pageChanges = [];
    var isHistoryReady = false;
    var isPlayerBarrageReady = false;

    // 历史数据
    var History = function (opts) {
        $.getJSON("/api/view/info?userid=" + opts.userId + '&roomid=' + opts.roomId, function (data) {
            if (!data.success) {
                return;
            }

            if (!data.datas) {
                return;
            }
            var datas = data.datas;
            var meta = datas.meta;
            if (!meta) {
                return;
            }

            live.livePlayer.isPublishing = meta.isPublishing;

            // TODO 没有推流
            if (meta.isPublishing != 1) {
                return;
            }

            var questions = meta.question;
            if (questions && questions.length) {
                for (var i = 0; i < questions.length; i++) {
                    var question = questions[i];
                    if (typeof window.on_cc_live_qa_question === 'function') {
                        window.on_cc_live_qa_question({
                            "action": "question",
                            "value": {
                                "id": question.encryptId,
                                "content": question.content,
                                "userId": question.questionUserId,
                                "userName": question.questionUserName
                            }
                        });
                    }
                }
            }

            var answers = meta.answer;
            if (answers && answers.length) {
                for (var i = 0; i < answers.length; i++) {
                    var answer = answers[i];
                    if (typeof window.on_cc_live_qa_answer === 'function') {
                        window.on_cc_live_qa_answer({
                            "action": "answer",
                            "value": {
                                "questionId": answer.encryptId,
                                "isPrivate": answer.isPrivate,
                                "content": answer.content,
                                "userId": answer.answerUserId,
                                "userName": answer.answerUserName
                            }
                        });
                    }
                }
            }

            var pageChange = meta.pageChange;
            if (pageChange && pageChange.length) {
                pageChange.sort(function (p1, p2) {
                    return parseInt(p1.time) - parseInt(p2.time);
                });
                var lastPage = pageChange.pop();
                pageChanges.push(JSON.stringify({
                    "fileName": lastPage.docName,
                    "totalPage": lastPage.docTotalPage,
                    "docid": lastPage.encryptDocId,
                    "url": lastPage.url,
                    "page": lastPage.pageNum
                }));
            }
            // TODO 画板信息
            var draw = meta.draw;
            if (draw && draw.length) {
                for (var i = 0; i < draw.length; i++) {
                    draws.push(draw[i].data);
                }
            }

            isHistoryReady = true;
        });
    };

    var Chat = function (socket) {
        this.sendChat = function (msg, callback) {
            var isPrivateChat = false;
            socket.sendChat(msg, isPrivateChat, callback);
        };

        this.sendPrivateChat = function (msg, callback) {
            var isPrivateChat = true;
            socket.sendChat(msg, isPrivateChat, callback);
        };
    };

    var QA = function (socket) {
        this.question = function (content, callback) {
            socket.question(content, callback);
        }
    };

    var Interaction = function (opts, socket) {
        this.id = opts.interaction.id;

        // 加载双向视频Flash
        this.load = function (type) {
            live.interaction.interactionLoadOutTime = setTimeout(function () {
                $('#interactionApplying, #interactionStart').hide();
                $('#interactionApplying').text('通话申请中...').show();

                live.interaction.interactionLoadOutTime2 = setTimeout(function () {
                    $('li[name="interaction"]').removeClass('disable');
                    $('#interaction').hide();

                    if (typeof window.on_cc_live_interaction_stop === 'function') {
                        window.on_cc_live_interaction_stop();
                    }
                }, 2000);
            }, 18000);

            this.type = type;

            function getOnlyMic(type) {
                if (type == 'video') {
                    return 0;
                }
                return 1;
            }

            var swfUrl = '//player.csslcloud.net/platform/live/LivePublisher.swf';
            var flashvars = {
                'url': 'rtmp://123.56.154.82/speak',
                'name': opts.roomId + '-' + opts.viewer.id,
                'OnlyMic': getOnlyMic(this.type) // 0 视频，1 音频
            };
            var params = {
                allowFullscreen: 'true',
                allowScriptAccess: "always",
                wmode: 'transparent'
            };
            var attributes = {};

            swfobject.embedSWF(swfUrl, opts.interaction.id, opts.interaction.width, opts.interaction.height,
                "10.0.0", "/flash/expressInstall.swf", flashvars, params, attributes);
        };


        // 当双向视频Flash加载完成，开始请求互动
        this.applyInteraction = function (callback) {
            socket.applyInteraction(this.type, callback);
        };

        // 互动推流
        this.publishedInteraction = function (callback) {
            socket.publishedInteraction(this.type, callback);
        };

        // 挂断互动
        this.hangupInteraction = function (callback) {
            socket.hangupInteraction(this.type, callback);
        };

        this.getFlash = function () {
            return swfobject.getObjectById(this.id);
        };

        this.stopPublish = function () {
            if (!this.getFlash()) {
                return;
            }
            this.getFlash().stopPublish();

            this.isInteractioning = false;

            $('#' + this.id).replaceWith('<div id="' + this.id + '"></div>');
            $('#interaction').hide();

            if (typeof window.on_cc_live_interaction_stop === 'function') {
                window.on_cc_live_interaction_stop();
            }
        };

        this.startPublish = function (pid) {
            if (!this.getFlash()) {
                return;
            }

            this.isInteractioning = true;

            this.getFlash().startPublish(opts.roomId + '-' + pid);
        };

    };

    var Live = function (opts) {
        this.logout = function () {
            window.location.href = '/api/view/logout?userid=' + opts.userId + '&roomid=' + opts.roomId;
        };
        this.livePlayer = new LivePlayer(opts);
        this.socket = new Socket(opts, this.livePlayer, this);
        this.drawPanel = new DrawPanel(opts, this.livePlayer);
        this.history = new History(opts);
        this.qa = new QA(this.socket);
        this.chat = new Chat(this.socket);
        this.interaction = new Interaction(opts, this.socket);
    };

    var live = {};

    var options = {
        userId: $('#userId').val(),
        roomId: $('#roomId').val(),

        // 观看者用户信息
        viewer: {
            id: $('#viewerId').val(),
            name: $('#viewerName').val(),
            role: $('#viewerRole').val(),
            sessionId: $.cookie('sessionid')
        },

        chat: {
            host: $('#chatHost').val()
        },

        // 直播播放器信息
        livePlayer: {
            id: 'livePlayer',
            width: '100%',
            height: '100%',
            buffer: $('#delayTime').val()
        },

        // 画板信息
        drawPanel: {
            id: 'drawPanel',
            width: '100%',
            height: '100%'
        },

        // 互动信息
        interaction: {
            id: 'interactionPlayer',
            width: '100%',
            height: '100%'
        }
    };

    function init(opts) {
        options = $.extend(options, opts);
        live = new Live(options);
    }

    var DW = {
        // 初始化DW对象
        config: function (opts) {
            init(opts);
        },

        question: function (content, callback) {
            live.qa.question(content, callback);
        },

        sendChat: function (msg, callback) {
            live.chat.sendChat(msg, callback);
        },

        sendPrivateChat: function (msg, callback) {
            live.chat.sendPrivateChat(msg, callback);
        },

        logout: function (time) {
            if (!time) {
                time = 0;
            }
            setTimeout(function () {
                live.logout();
            }, time);
        },

        changeLine: function (line, callback) {
            live.livePlayer.changeLine(line, callback);
        },


        getPlayLine: function () {
            return live.livePlayer.getPlayLine();
        },

        isPublishing: function () {
            return live.livePlayer.isPublishing == 1;
        },

        // 请求双向视频
        loadInteraction: function (type) {
            live.interaction.load(type);
        },

        // 挂断双向视频
        hangupInteraction: function () {
            if (!live.interaction.isInteractioning) {
                return;
            }

            live.interaction.stopPublish();
            live.interaction.hangupInteraction(function (err) {
                if (err) {
                    debug('interaction', '挂断失败');
                    return;
                }

                live.livePlayer.openSound();
                $('li[name="interaction"]').removeClass('disable');
            });

            clearInterval(live.interaction.interactionTimeInterval);
        },

        openSound: function () {
            live.livePlayer.openSound();
        },

        closeSound: function () {
            live.livePlayer.closeSound();
        },

        barrage: function (m) {
            live.livePlayer.barrage(m);
        },

        openBarrage: function () {
            live.livePlayer.openBarrage();
        }

    };

    $.extend({
        DW: DW
    });

    // 画板Flash加载完成回调
    window.on_drampanel_ready = function () {
        live.drawPanel.isReady = true;
        setTimeout(function () {
            initDrawPanelInfo();
        }, 1500);
    };

    // 画图事件
    window.on_cc_live_dw_draw = function (data) {
        setTimeout(function () {
            // TODO 数据验证
            var j = toJson(data);
            live.drawPanel.draw(JSON.stringify(j.value.data));
        }, 2300);
    };

    // 翻页事件
    window.on_cc_live_dw_page_change = function (data) {
        setTimeout(function () {
            // TODO 数据验证
            var j = toJson(data);
            live.drawPanel.filp(JSON.stringify(j.value));
        }, 2300);
    };

    // 接受请求
    window.on_cc_live_accept_interaction = function (data) {
        debug('Interaction', '接受请求');
        // {"publisherId":"c88eb60cc2e44c9b81ee88f25b400ab1","type":"video","viewerId":"703a5c2daae642399d76fe4966c49a04","viewerName":"1111"}
        live.interaction.type = data.type;
        live.interaction.publisherId = data.publisherId;

        // 开始推流
        live.interaction.startPublish(data.publisherId);
        live.interaction.publishedInteraction(function (err) {
            clearTimeout(live.interaction.interactionApplyOutTime);
            clearTimeout(live.interaction.interactionApplyOutTime2);
        });

        $('#interactionApplying, #interactionStart').hide();
    };

    // 挂断
    window.on_cc_live_hangup_interaction = function (data) {
        debug('Interaction', '挂断');

        live.livePlayer.openSound();
        $('li[name="interaction"]').removeClass('disable');

        //{viewerId:'asfasga',viewerName:'请求者', type'video/audio'}
        live.interaction.stopPublish();

        clearInterval(live.interaction.interactionTimeInterval);
    };

    // 直播播放器准备开始播放
    window._onStart = function () {
        live.livePlayer.isReady = true;

        if (typeof window.on_cc_live_start === 'function' && live.livePlayer.isPublishing) {
            window.on_cc_live_start(live.livePlayer.getPlayLine());
        }
    };

    // 播放器Flash加载完成，并调用接口信息已获取直播间的信息
    window._swfInit = function () {
        isPlayerBarrageReady = true;

        if (typeof window.on_cc_live_player_init === 'function') {
            window.on_cc_live_player_init();
        }
    };

    // 推流成功
    window.publishSucc = function () {
        debug('Interaction', 'Flash 推流成功');

        live.interaction.publishTimes = 0;

        // 推流成功关闭声音
        live.livePlayer.closeSound();

        // 推流成功
        live.interaction.interactionTime = 0;
        live.interaction.interactionTimeInterval = setInterval(function () {
            ++live.interaction.interactionTime;
            var m = parseInt(live.interaction.interactionTime / 60, 10);
            var s = parseInt(live.interaction.interactionTime % 60, 10);
            if (m < 10) {
                m = '0' + m;
            }
            if (s < 10) {
                s = '0' + s;
            }
            $('#interactionTime').text(m + ':' + s);
        }, 1000);

        //$('#interactionApplying, #interactionStart').hide();
        $('#interactionStart').show();
    };

    // Flash设备准备完成
    window.equipmentOk = function () {
        debug('Interaction', 'Flash 加载完成');
        // 请求互动的消息
        live.interaction.applyInteraction(function (err) {
            if (err) {
                // 发送互动消息失败
                return;
            }

            live.interaction.interactionApplyOutTime = setTimeout(function () {
                // 请求超时
                $('#interactionApplying, #interactionStart').hide();
                $('#interactionApplying').text('请求超时，请稍后重试').show();

                live.interaction.interactionApplyOutTime2 = setTimeout(function () {
                    $('li[name="interaction"]').removeClass('disable');

                    $.DW.hangupInteraction();
                    $('#interaction').hide();

                    if (typeof window.on_cc_live_interaction_stop === 'function') {
                        window.on_cc_live_interaction_stop();
                    }
                }, 2000);

            }, 57 * 1000);

            clearTimeout(live.interaction.interactionLoadOutTime);
            clearTimeout(live.interaction.interactionLoadOutTime2);

            $('#interactionApplying, #interactionStart').hide();
            $('#interactionApplying').text('通话申请中...').show();
        });
    };

    //推流失败,请重试
    window.PublishError = function () {
        debug('Interaction', 'Flash 推流失败');

        live.interaction.publishTimes += 1;
        if (live.interaction.publishTimes > 3) {
            live.interaction.startPublish(live.interaction.publisherId);
        } else {
            $('#interactionApplying, #interactionStart').hide();
            $('#interactionApplying').text('推流失败，请稍后重试').show();

            setTimeout(function () {
                $('li[name="interaction"]').removeClass('disable');
                $.DW.hangupInteraction();
                $('#interaction').hide();

                if (typeof window.on_cc_live_interaction_stop === 'function') {
                    window.on_cc_live_interaction_stop();
                }
            }, 1500);
        }

        clearInterval(live.interaction.interactionTimeInterval);

        // TODO 推流失败回调函数
        // ...
    };


    /** 屏蔽用户频繁刷新网页 */
    window.onbeforeunload = function (e) {
        if (live.livePlayer && live.livePlayer.isPublishing == 1) {
            return "您确定要离开直播间吗？";
        } else {
            if (!window.event) {
                return null;
            }
        }
    };

    // 离开页面
    window.onunload = function (e) {
        if (live.interaction.isInteractioning) {
            live.interaction.hangupInteraction();
        }
    }
})(jQuery, window, document, undefined);