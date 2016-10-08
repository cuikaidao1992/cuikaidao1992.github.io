 
 
  

    var _ = {
        /**
         * 单道试题取答案
         * @param obj
         * @returns {string}
         * @private
         */
        get     : function (obj) {
            var wait = obj.find('.m-question-html'),
                examType = parseInt(obj.data('questiontype')),
                content = [];
            switch (examType) {
                case 1: 
                case 4:
                    content = '' + wait.find('.u-selected').data('value') + '';
                    break;
                case 2:
                case 7:
                    wait.find('.u-selected').each(function () {
                        content.push(($(this).data('value') || ''));
                    });
                    content = content.join(',');
                    break;
                default:
                    content = wait.find('textarea').val();
                    
            }
            return content;
        },
        
        /**
         * 存储用户答案
         * @param obj
         * @param value
         */
        setCache: function (obj, value) {
            obj.data('cacheAnswer', value);
        },
        /**
         * 取用户答案缓存
         * @param obj
         * @returns {*}
         */
        getCache: function (obj) {
            return obj.data('cacheAnswer') || '';
        }
    };


    var questionAnswer = {
        
        /**
         * 取用户答案
         * @returns {string}
         */
        get               : function () {
            var wait = $('.m-question.wait'),
                item = null,
                content = [];
            wait.each(function () {
                item = $(this);
                content.push(item.attr('data-questionid') + '{{-}}' + _.get(item));
            });
            return content.join('{{|}}');
        },
        /**
         * 保存试题答案
         * @param query
         */
        post: function (query) {
          
            var deferred = $.Deferred();
            $.ajax({
                url: '/content/submit/tiku.ashx',
                data: { type: 8,  paperId: page_paperId, postStr: escape(query.answerContent) },
                type: "POST",
                dataType: "json"  
            }) .fail(function () {
                deferred.reject();
                })
                .done(function (data) {
                    if (data.err ==0) {
                        var wait = $('.m-question.wait');
                        wait.removeClass('wait');
                       
                        deferred.resolve();
                        
                    } else {
                        
                        deferred.reject();
                    }

                });

            return deferred.promise()
        },
        postChapter: function (query) {

            var deferred = $.Deferred();
            $.ajax({
                url: '/content/submit/tiku.ashx',
                data: { type: 15, paperId: page_paperId, postStr: escape(query.answerContent) },
                type: "POST",
                dataType: "json"
            }).fail(function () {
                deferred.reject();
            })
                .done(function (data) {
                    if (data.err == 0) {
                        var wait = $('.m-question.wait');
                        wait.removeClass('wait');

                        deferred.resolve();

                    } else {

                        deferred.reject();
                    }

                });

            return deferred.promise()
        },
        /**
         * 更新答题队列数据
         * 用户做过的试题如果答案未变动则不再加入队列中
         * @param obj
         */
        updateQueue       : function (obj) {
            var self = obj,
                parent = self.parent(),
                parents = self.parents('.m-question'),
                getAnswer = _.get(parents),
                cacheAnswer = _.getCache(parents),
                question_no = parents.attr('data-questionid'); 

            //更新队列
            if (getAnswer !== cacheAnswer) {
                
                //存储用户答案
                _.setCache(parents, getAnswer);

                //更新队列：
                // 多选择题
                if (parent.is('.multiple')) {
                    self.hasClass('u-selected') || self.siblings('.u-selected').length > 0 ? parents.addClass('wait') : parents.removeClass('wait').removeClass('done');
                }
                //单选题
                if (parent.is('.single')) {

                    self.hasClass('u-selected') ? parents.addClass('wait') : parents.removeClass('wait').removeClass('done');

                }

                //更新队列：主观题
                if (self.is('textarea')) {
                    utils.isEmpty(getAnswer) ? parents.removeClass('wait').removeClass('done') : parents.addClass('wait');
                    
                }


            }
            

        }
    };
 