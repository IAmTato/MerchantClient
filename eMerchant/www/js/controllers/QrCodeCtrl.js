/**
 * Created by linchao on 19/2/2016.
 */
'use strict';
app.controller('QrCodeCtrl', ['$rootScope', '$scope', '$state', '$stateParams', '$ionicLoading', '$timeout', '$interval', 'QrCodeIntf', '$ionicPopup', 'AuthService', '$log', '$q',
  function ($rootScope, $scope, $state, $stateParams, $ionicLoading, $timeout, $interval, QrCodeIntf, $ionicPopup, AuthService, $log, $q) {

    //页面显示跳转
    $scope.buttonTextChange = false;

    if ($stateParams.qrcodeId != null) {
      //通过QRcodeId识别客户
      QrCodeIntf.getCustInfoByQrCodeId($stateParams.qrcodeId).then(function (succ) {
        if (succ != null && succ.res == true) {
          if (!succ.data) {
            var alertTimeoutPopup = $ionicPopup.alert({
              title: '扫描错误',
              template: "无匹配用户信息，请重试！"
            });
            $state.go('main.dash');
          } else {
            $scope.custPhone = succ.data;
          }
          console.log(succ.data);
        } else {
          $log.error(succ);
          var alertTimeoutPopup = $ionicPopup.alert({
            title: '系统错误',
            template: "二维码扫描错误，请重新扫描！"
          });
          $state.go('main.dash');
        }
        $scope.$broadcast('qrScan_finish');
      }, function (err) {
        $log.error(err);
      });
    }
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

    //确认金额-----------------------------------------------------------------------
    $scope.data = {};
    $scope.confirmAmount = function (data) {
      $scope.buttonTextChange = true;
      if (data.costAmount == null) {
        //数额不能为空
      }

      QrCodeIntf.insertOneMasterOrderRecord($stateParams.qrcodeId, data.costAmount).then(function (succ) {
        if (succ != null && succ.res == true) {
          $scope.orderId = succ.data;
          checkThisOrderStatus();
          console.log(succ.data);
        } else {
          $log.error(succ);
          var alertTimeoutPopup = $ionicPopup.alert({
            title: '交互错误',
            template: "插入订单记录出错！"
          });
          $state.go('main.dash');
        }
        $scope.$broadcast('qrScan_finish');
      }, function (err) {
        $log.error(err);
      });

      //服务端轮询--------------------------------------------------------------
      function checkThisOrderStatus() {
        if (AuthService.username()) {
          var refreshData = function () {
            QrCodeIntf.getThisOrderStatus($scope.orderId).then(function (succ) {
              if (succ != null && succ.res == true) {
                $scope.orderStatus = succ.data;

                switch ($scope.orderStatus) {
                  case "01":
                  case "11":
                  case "21":
                    break;
                  case "09":
                    $scope.failReason = "Customer canceled";
                    $state.go('main.payfail', {failReason: $scope.failReason});
                    $interval.cancel(promise);
                    break;
                  case "19":
                    $scope.failReason = "Store closed";
                    $state.go('main.payfail', {failReason: $scope.failReason});
                    $interval.cancel(promise);
                    break;
                  case "29":
                    $scope.failReason = "Timeout";
                    $state.go('main.payfail', {failReason: $scope.failReason});
                    $interval.cancel(promise);
                    break;
                  case "31":
                    $state.go('main.paysuccess');
                    $interval.cancel(promise);
                    break;
                }
              } else {
                $log.error(succ);
              }
              $scope.$broadcast('payConfirm_finish');
            }, function (err) {
              $log.error(err);
            });
          };
          var promise = $interval(refreshData, 1000);
          $scope.$on('$destroy', function () {
            if (angular.isDefined(promise)) {
              $interval.cancel(promise);
              promise = undefined;
            }
          });
        }
      };
//----------------------------------------------------------------
    };

//处理其他订单----------------------------------------------------------------------
    $scope.goBackToDash = function () {
      $state.go('main.dash', {}, {reload: true});
    };


  }])
;
