'use strict';
app.factory('NoticeService', ['QrCodeIntf','$rootScope','$interval', '$ionicPopup','$log', function(QrCodeIntf,$rootScope, $interval, $ionicPopup, $log) {
  var notices = [];
  var payResult = null;
  var unreadNoticeCount = 0;
  var closeNotice = false;

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
                  "costAmount": succ.data.costAmount / 100,
                  "realAmount": succ.data.realAmount / 100,
                  "updateDate": succ.data.updateDate,
                  "payResult": payResult
                });
              unreadNoticeCount++;
              $rootScope.unreadNoticeCount = unreadNoticeCount;
            } else {
              $log.error(succ);
            }
          }
        }, function (err) {
          $log.error(err);
        });
      };

      var promise = $interval(refreshData, 10000);//设置每10秒轮询一次

      if(closeNotice){
        $interval.cancel(promise);
      }

      return notices;
    },
    setUnreadNoticeCount:function(count){
      unreadNoticeCount = count;
      $rootScope.unreadNoticeCount = count;
    },
    closeNotice:function(){
      closeNotice = true;
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
