'use strict';
app.controller('PayResultCtrl', ['$scope', '$state', '$stateParams','QrCodeIntf', '$ionicPopup', 'AuthService', '$log',
  function ($scope, $state, $stateParams, QrCodeIntf, $ionicPopup, AuthService, $log) {

    $scope.failReason = $stateParams.failReason;

    QrCodeIntf.getThisOrderInfo().then(function (succ) { //dwr返回值错误 二进制格式 改Long
      if (succ != null && succ.res == true) {
        $scope.orderId = succ.data.orderId;
        $scope.costAmount = succ.data.costAmount;
        $scope.addFeeAmount = succ.data.addFeeAmount;
        $scope.discountAmount = succ.data.discountAmount;
        $scope.realAmount = succ.data.realAmount;
        $scope.custId = succ.data.custId;
        $scope.courierId = succ.data.courierId;

      } else {
        $log.error(succ);
      }
    }, function (err) {
      $log.error(err);
    });

    //离开提示框
    $scope.myGoBack = function () {
      var confirmPopup = $ionicPopup.confirm({
        title: '提示',
        template: '确定是否放弃输入金额</br>',
        okText: '继续',
        cancelText: '离开'
      });
      confirmPopup.then(function (res) {
        if (!res) {
          //$ionicHistory.goBack();
          $state.go('main.dash', {}, {reload: true});
        } else {
          // 继续输入
        }
      });
    };

//处理其他订单----------------------------------------------------------------------
    $scope.goBackToDash = function () {
      $state.go('main.dash', {}, {reload: true});
    };


  }])
;
