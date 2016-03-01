'use strict';
app.factory('NoticeService', ['QrCodeIntf','$interval', '$ionicPopup','$log', function(QrCodeIntf, $interval, $ionicPopup, $log) {
  var notices = [];
  var payResult = null;
  var unreadNoticeCount = 0;

  return {
    all: function() {
      var refreshData = function () {
        QrCodeIntf.getOrderPayResult().then(function (succ) {
          if (succ != null && succ.res == true) {
            if (succ.data != null) {
              switch (succ.data.orderStatus) {
                case "09":
                case "19":
                case "29":
                  payResult = "支付失败";
                  break;
                case "31":
                  payResult = "支付成功";
                  break;
              }
              notices.push(
                {
                  "orderId": succ.data.orderId,
                  "costAmount": succ.data.costAmount,
                  "realAmount": succ.data.realAmount,
                  "updateDate": succ.data.updateDate,
                  "payResult": payResult
                });
              unreadNoticeCount++;
            } else {
              $log.error(succ);
            }
          }
        }, function (err) {
          $log.error(err);
        });
      };

      var promise = $interval(refreshData, 10000);


      return notices;
    },
    getUnreadNoticeCount:function(){
      return unreadNoticeCount;
    },
    setUnreadNoticeCount:function(count){
      unreadNoticeCount = count;
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
}]);
