'use strict';
app.factory('Notices', function() {
  // Might use a resource here that returns a JSON array
  var notices = [{
    id: 0,
    name: '185****5521',
    text: '订单金额: 400元\n服务费: 10元  优惠: 20元\n实收: 390',
    face: 'img/ionic.png',
    pay: '支付成功'
  }, {
    id: 1,
    name: '185****5521',
    text: '订单金额: 400元\n服务费: 10元  优惠: 20元\n实收: 390',
    face: 'img/ionic.png',
    pay: '支付成功'
  }, {
    id: 2,
    name: '185****5521',
    text: '订单金额: 400元\n服务费: 10元  优惠: 20元\n实收: 390',
    face: 'img/ionic.png',
    pay: '支付成功'
  }, {
    id: 3,
    name: '185****5521',
    text: '订单金额: 400元\n服务费: 10元  优惠: 20元\n实收: 390',
    face: 'img/ionic.png',
    pay: '支付成功'
  }, {
    id: 4,
    name: '185****5521',
    text: '订单金额: 400元\n服务费: 10元  优惠: 20元\n实收: 390',
    face: 'img/ionic.png',
    pay: '支付成功'
  }];

  return {
    all: function() {
      return notices;
    },
    remove: function(notice) {
      notices.splice(notices.indexOf(notice), 1);
    },
    get: function(noticeId) {
      for (var i = 0; i < notices.length; i++) {
        if (notices[i].id === parseInt(noticeId)) {
          return notices[i];
        }
      }
      return null;
    }
  };
});
