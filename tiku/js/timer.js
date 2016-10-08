 
 
    function timer(options) {
        var self = this;
        self.trigger = options.trigger;
        self.tag = options.tag;
        self.startTime = options.startTime;
        self.stopTime = options.stopTime;
        self.timerType = options.timerType || 'up';
        self.callback = options.callback;
        self.timerId = null;
        return self;
    }

    function print(self) {
        var msObj = format(self.startTime);
        if (self.tag) {
            self.tag['day'] && (self.tag['day'].innerHTML = msObj.day);
            self.tag['hour'] && (self.tag['hour'].innerHTML = msObj.hour);
            self.tag['min'] && (self.tag['min'].innerHTML = msObj.min);
            self.tag['sec'] && (self.tag['sec'].innerHTML = msObj.sec);
        }
        var msStr = msObj.day !== '' ? (msObj.day + '天' + msObj.hour + ':' + msObj.min + ':' + msObj.sec) : (msObj.hour + ':' + msObj.min + ':' + msObj.sec);
        self.trigger && (self.trigger.innerHTML = msStr);
    }

    function tick(self) {
        if (self.timerType === 'up') {
            if (self.startTime < self.stopTime) {
                self.startTime++;
                print(self);
            } else { 
                self.callback && self.callback();
                self.stop();
            }
        } else {
            if (self.startTime > self.stopTime) {
                self.startTime--;
                print(self);
            } else {
               
                self.callback && self.callback();
                self.stop();
            }
        }
    }

    function format(timeStr) {
        var d = 24 * 60 * 60,
            h = 60 * 60,
            m = 60,
            D, H, M, S,
            ms = {}, newCount,
            fx = function (str) {
                return str < 10 ? '0' + str : str;
            };
        newCount = Math.floor(timeStr);
        D = Math.floor(newCount / d) > 0 ? Math.floor(newCount / d) : '';
        newCount = newCount % d;
        H = Math.floor(newCount / h) > 0 ? Math.floor(newCount / h) : 0;
        newCount = newCount % h;
        M = Math.floor(newCount / m) > 0 ? Math.floor(newCount / m) : 0;
        S = Math.floor(newCount % m);
        ms.day = D;
        ms.hour = fx(H);
        ms.min = fx(M);
        ms.sec = fx(S);
        return ms;
    }

    timer.prototype = {
        value: function () {
            var self = this,
                msObj = format(self.startTime),
                msStr = msObj.day !== '' ? (msObj.day + '天' + msObj.hour + ':' + msObj.min + ':' + msObj.sec) : (msObj.hour + ':' + msObj.min + ':' + msObj.sec);
            return msStr;
        },
        start: function () {
            var self = this;
            if ((self.trigger || self.tag) && !self.timerId) {
                self.timerId = setInterval(function () {
                    tick(self);
                }, 1000);
            }
        },
        stop: function () {
           

            var self = this;
            self.timerId && clearInterval(self.timerId);
            self.timerId = null;
            return self.startTime;
        }
    };
  
 