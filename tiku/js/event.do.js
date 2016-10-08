$(function () {
    $(".foot-bt").removeClass("fixed");
	//弹窗
	var layerIndex;
	//顶部固定
	$("#ui-progress").sticky({ topSpacing: -8 });
	$("#page-right-frame").sticky({ topSpacing: 65 });

	$(".js-exam").addClass("ui-check");
	$('#page-rules a').eq(0).addClass("ui-check");
	 
	//
	$('#elevator').click(function () {
		$('body,html').animate({ scrollTop: 0 });
	});
	//END 
	//题库类型
	$("#page-rules a").each(function () {
		var _this = $(this);
		config.mk_rules.push(parseInt(_this.attr("data-value")));
	});
	//scroll
	function scroll(top) {
		$('body,html').stop(true, true).animate({
			scrollTop: top
		}, 600);
	}
	var elm = $('body');
	var doc = $(document),
	win = $(window);
	/*//点击获取试题
	function render(container, query, questionno) {

		var loadingFrame = $('#' + container);
		var isload = false;

		if ($.inArray(query.rulesId, config.mk_load_rules) === -1) {

			loadingFrame.html('<div class="page_ajax_loading"></div>');
			$.ajax({
				url: '/content/submit/tiku.ashx',
				data: query,
				type: "POST",
				dataType: "json",
			}).done(function (data) {
				if (data.err == 0) {
					tephtml(container, data);
					config.mk_load_rules.push(parseInt(query.rulesId));
					
					if (questionno) {

						var that = $('#question-' + questionno);
						scroll(that.offset().top - 150);

					}

					elm.trigger('triggerUpdateCard');
				}
				else {
					loadingFrame.html('<div class="page_ajax_empty">没有获取到练习试题，请尝试点击"<a href="javascript:void(0)" class="page-rules-reload" data-value="' + query.rulesId + '" style="color: red; text-decoration: underline">重新加载</a>"</div>');
				}
			});

		} else {
			if (questionno) {
				var that = $('#question-' + questionno);
				scroll(that.offset().top - 150);
			}
		} 
	}
	//获取第一个类型题库
	render('page-rules-body-' + config.mk_rules[0], {
		rulesId: config.mk_rules[0], type: 7
	});*/

	doc.keydown(function (e) {
		e = e || event;
		if (e.keyCode === 116 || e.which === 116) {
			return false;
		}
	});
	elm.on('click', '.page-rules-reload', function () {
		var self = $(this),
			rulesId = self.data('value');

		render('page-rules-body-' + rulesId, {
			rulesId: rulesId, type: 7
		});

	}).on('contextmenu', function () {
	    return false;
	}).on("selectstart", function () { return false; })
        .on('click', '#page-rules>a', function () {
		var self = $(this),
			rulesId = self.data('value');
		win.off("scroll");
		/*render('page-rules-body-' + rulesId, {
			rulesId: rulesId, type: 7
		});*/
		self.addClass('ui-check').siblings().removeClass('ui-check');
		scroll($('#page-rules-body-' + rulesId).offset().top - 150);
	})
		//点击答题卡
		.on('click', '#page_card a', function () {
			var self = $(this),
				questionno = self.data('questionno'),
				rulesId = self.parent().parent().data("rulesid");
			win.off("scroll");
			/*render('page-rules-body-' + rulesId, {
				rulesId: rulesId, type: 7
			}, questionno);*/
		}).on('click', '#page-btn-pause', function () {
			layerIndex = $.layer({
				type: 1,
				title: false,
				closeBtn: [0],
				page: {
					html: '<div class="pop-have" id="page-btn-continue"></div>'
				}
			});
			 
			questionTimer.pause();
		}).on('click', '#page-btn-continue', function () {
			layer.close(layerIndex);
			
			questionTimer.start();
			
		}).on('click', '#page-tools-calculator', function () {
			$.layer({
				type: 2,
				shade: [0],

				title: '计算器',

				iframe: { src: 'cal/cal.html' },
				area: ['700px', '400px']
			});
		}).on('triggerWaitQueue', function (event, obj) {

			//更新用户答题队列
			questionAnswer.updateQueue(obj);

			//更新到已做状态
			var wait = $('.m-question.wait'),
				done = $('.m-question.done');

			wait.addClass('done');

			//更新答题卡状态
			elm.trigger('triggerUpdateCard', [obj]);

			//触发队列数据
			wait.length >= 15 && elm.trigger('triggerSubmitQuestion');
		}) /**
         * 自定义事件：更新答题卡
         */
            .on('triggerUpdateCard', function (event, obj) {
                var card = $('#page_card'),
                    done = $('.m-question.done');
            	//更新选中焦点
            	if (obj) {
            		var item = obj.parents('.m-question'),
                        listNo = parseInt(item.data('questionid')) || 1; 
            		    config.mk_hash = listNo;

            		//更新答题卡状态
            		var thatCard = card.find('.page-card-item[data-questionno="' + listNo + '"]');
            		item.is('.done') ? thatCard.addClass('checked') : thatCard.removeClass('checked');
            		//END
            	    //更新答题卡定位

            		var cardHeight = card.height(),
                        questionOffsetTop = $('.page-card-item[data-questionno="' + config.mk_hash + '"]').offset().top - $(window).scrollTop() - 310 + 22;
            		if (questionOffsetTop < 0) {
            		    questionOffsetTop = card.scrollTop() + questionOffsetTop - 25;
            		    card.stop(true, true).animate({ scrollTop: questionOffsetTop }, 300);
            		}
            		if (questionOffsetTop > cardHeight) {
            		    card.stop(true, true).animate({ scrollTop: questionOffsetTop }, 300);
            		}
            		 
            	} else {
            	    //答题卡状态 
            	    done.each(function () {
            	        var _this = $(this);
            	        var qid = _this.data("questionid");
            	       
            	        $('.page-card-item[data-questionno="' + qid + '"]').addClass('checked');
            	    });
            	  
            	}
            }) /**
     * 自定义事件：提交试卷
     */
        .on('triggerSubmitPaper', function (event) {
            questionTimer.stop();
            var doneCount = $('.page-card-item.checked').length,
                dialogMsg = doneCount < page_question_count ?
                '您还有<span class="orgTxt">' + (page_question_count - doneCount) + '</span>道试题未作答，是否确定交卷？' :
                '您已全部做完，是否确定交卷？';
            layerIndex = $.layer({
                shade: [0.5, '#000'],
                area: ['auto', 'auto'],
                title: "交卷",
                dialog: {
                    msg: dialogMsg,
                    btns: 2,
                    type: -1,
                    btn: ['继续做题', '确定交卷'],
                    yes: function () {
                        layer.close(layerIndex);
                        questionTimer.start();
                    }, no: function () {
                        layerIndex = layer.load('正在交卷...', 0);

                        elm.trigger('triggerSubmitQuestion', [
                             function () {
                                 $.ajax({
                                     url: '/content/submit/tiku.ashx',
                                     data: { type: 9, paperId: page_paperId},
                                     type: "POST",
                                     dataType: "json"
                                 }).fail(function () {
                                     questionTimer.start();
                                     layer.close(layerIndex);
                                     layer.alert('交卷产生错误，请稍后重试！');
                                 }).done(function (data) { 
                                        if (data.err == 0) {
                                            location.href = "/tiku/exam/report/" + page_paperId;

                                        } else {
                                            questionTimer.start();
                                            layer.close(layerIndex);
                                            layer.alert('交卷产生错误，请稍后重试！');
                                        }

                                    });
                                
                             }, function () {
                                 questionTimer.start();
                                 layer.close(layerIndex);
                                 layer.alert('交卷产生错误，请稍后重试！');
                             }
                        ]);
                    }
                }
            });

        }) 
		/**
		  * 自定义事件：保存答案
		*/
        .on('triggerSubmitQuestion', function (event,  callback, failCallback) {
        	 var answerContent = questionAnswer.get();
        	 if (utils.isEmpty(answerContent)) {
        	     callback && callback();
        	} else {
        		questionAnswer.post({
        		    answerContent: answerContent 
        			 
        		})
                    .fail(function () {
                    	 
                    	failCallback && failCallback();
                    })
                    .done(function () {
                    	 
                    	callback && callback();
                    });
        	}
        })  /**
                  * 自定义事件：更新做题时间
      /*          *!/
        .on('triggerSubmitExamTime', function (event) {
            $.ajax({
                url: '/content/submit/tiku.ashx',
                data: { type: 10, paperId: page_paperId, doExmTime: config.mk_exam_time  },
                type: "POST",
                dataType: "json"
            }).fail(function () {
                
            }).done(function (data) {
                
            });
        })*/
                /**
               * 答题：选择题
                */
        .on('click', '.question-option-list', function () {
        	var self = $(this),
                isMultiple = self.parent().is('.multiple'),
                parent = self.parents('.m-question'),
              
                questionId = self.attr('data-questionid'),

				serialNumberId = parent.attr('data-serialNumber'),

                nextSerialNumberId = parseInt(serialNumberId) + 1,
                value = self.attr('data-value'),
                that = parent.find('.question-option-list[data-value="' + value + '"][data-questionid="' + questionId + '"]');

        	if (isMultiple) {
        	    //多选 
        	    that.toggleClass('u-selected');
        	    if (self.parent().find(".u-selected").length == 0) {
        	        that.addClass('u-selected');
        	    }
        	} else {
        	    that.addClass('u-selected').siblings().removeClass('u-selected');
        	    if (config.turnNext) {
        	        var nextQuestion = $('.question-item[data-serialNumber="' + nextSerialNumberId + '"]');

        	        nextQuestion.length && scroll(nextQuestion.offset().top - 150);
        	    }

        	}
        	//加入答题队列
        	elm.trigger('triggerWaitQueue', [self]);
        }).on('click', '.js_turn_switch', function () {
        	var self = $(this);
                config.turnNext = self.find('input').prop('checked');
        	 
        }) /**
     * 答题：主观题
     */
        .on('keyup', '.m-question-html textarea', function () {
        	var self = $(this),
                item = self.parents('.question-item'),
                questionId = item.attr('data-questionid') ;
                
        	//加入答题队列
        	if (triggerWaitQueueDeferred[questionId]) {
        		triggerWaitQueueDeferred[questionId] && clearTimeout(triggerWaitQueueDeferred[questionId]);
        		triggerWaitQueueDeferred[questionId] = setTimeout(function () {
        			elm.trigger('triggerWaitQueue', [self]);
        		}, 5000);
        	} else {
        		elm.trigger('triggerWaitQueue', [self]);
        	}
        }) /**
     * 按钮：交卷
     */
        .on('click', '#page-btn-submit', function () {
        	elm.trigger('triggerSubmitPaper');
        })
    /**
     * 按钮：下次再做
     */
        .on('click', '#page-btn-next', function () {
            questionTimer.stop();
           layerIndex= $.layer({
                shade: [0.5, '#000'],
                area: ['auto', 'auto'],
                title:"下次再做",
                dialog: {
                    msg: '<p>如果你想下次再接着练习可以选择此功能，考试期间会暂停考试计时</p><p>可以在题库首页直接点击“继续练习”或者在“练习记录”中进入</p>',
                    btns: 2,
                    type: -1,
                    btn: ['继续做题', '下次再做'],
                    yes: function () {
                        layer.close(layerIndex);
                        questionTimer.start();
                    }, no: function () {
                        layer.close(layerIndex);
                        layerIndex = layer.load('正在保存信息...', 0);
                        elm.trigger('triggerSubmitQuestion', [
                            function () {
                               location.href = "/tiku/exam/";
                            }, function () {
                                layer.close(layerIndex);
                                layer.alert('保存答案失败，请稍后重试！');
                            }
                        ]);
                        return false;
                    }
                }
            });
       
        }) 
	/** 返回
     */
        .on('click', '.page-back', function () {
            //
            questionTimer.stop();
            layerIndex = layer.load('正在保存信息...', 0);
        	//
        	elm.trigger('triggerSubmitQuestion', [
                 function () { 
                		//TODO 试卷返回时定义为下次再做模式
                        location.href = "/tiku/exam/";
                	   
                 }, function () {
                    questionTimer.start();
                    layer.close(layerIndex);
                	layer.alert('保存答案失败，请稍后重试！');
                }
        	]);
        });
	function resize()
	{
	    var card = $('#page_card');
	    var cardHeight = win.height() - $('.rightArea-tool').height() -262;
	    cardHeight = cardHeight -262;
	    card.height(cardHeight);
	}
	resize();
	win.on('scroll', function () {
	    var $document = $(document),
		   $window = $(window),
		   pageRules = $('#page-rules'),
		   nextRulesId = pageRules.find('a.ui-check').next().data('value') || 0,
		   prevRulesId = pageRules.find('a.ui-check').prev().data('value') || 0,
		   viewBody = null,
		   isViewWindow = false,
		   rulesId = 0;
	    /*//向下
	    if ($window.scrollTop() > config.mk_scroll_value) {
	        rulesId = nextRulesId;
	        if (nextRulesId > 0) {
	            viewBody = $('#page-rules-head-' + nextRulesId);
	            isViewWindow = viewBody.length > 0 ? ((($window.scrollTop() + $window.height()) > viewBody.offset().top) && ((viewBody.offset().top + $(this).height()) > $window.scrollTop())) : false;
	        }
	    }
	    else {
	        rulesId = prevRulesId;
	        if (prevRulesId > 0) {
	            viewBody = $('#page-rules-head-' + prevRulesId);
	            isViewWindow = viewBody.length > 0 ? ((($window.scrollTop() + $window.height()) > viewBody.offset().top) && ((viewBody.offset().top + $(this).height()) > $window.scrollTop())) : false;
	        }
	    }

	    if (isViewWindow) {
	        rulesId > 0 && render('page-rules-body-' + rulesId, {
	            rulesId: rulesId, type: 7
	        });
	        $('#page-rules').find('a[data-value="' + rulesId + '"]').addClass('ui-check').siblings().removeClass('ui-check');

	    }
	    config.mk_scroll_value = $window.scrollTop();*/
	}).on('resize', function () {
	    resize();
	});
 });