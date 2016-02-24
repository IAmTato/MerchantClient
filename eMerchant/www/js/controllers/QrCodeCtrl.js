/**
 * Created by linchao on 19/2/2016.
 */
'use strict';
app.controller('QrCodeCtrl', ['$rootScope', '$scope', '$state', '$stateParams', '$ionicLoading', '$timeout', '$interval', 'QrCodeIntf', '$ionicPopup', 'AuthService', '$log', '$q',
  function ($rootScope, $scope, $state, $stateParams, $ionicLoading, $timeout, $interval, QrCodeIntf, $ionicPopup, AuthService, $log, $q) {

    //页面显示跳转
    $scope.buttonTextChange = false;

    //通过QRcodeId识别客户
    QrCodeIntf.qrCodeRead($stateParams.qrcodeId).then(function (succ) {
      $ionicLoading.show({
        template: '获取客户信息....'
      });
      if (succ != null && succ.res == true) {
        if (!succ.data) {
          var alertTimeoutPopup = $ionicPopup.alert({
            title: '扫描错误',
            template: "无匹配用户信息，请重试！"
          });
          $state.go('main.dash', {}, {reload: true});
        } else {
          $scope.custId = succ.data.custId;
          $ionicLoading.hide();
        }
        //console.log(succ.data);
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
    }, function (progress) {
      //连接超时提示
      $timeout(function () {
        var alertTimeoutPopup = $ionicPopup.alert({
          title: 'Connection Timeout',
          template: "连接服务端超时！"
        });
        $ionicLoading.hide();
      }, 30000);
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

    //确认金额-----------------------------------------------------------------------
    $scope.data = {};
    $scope.setCurrentMoney = function (money) {
      $scope.totalMoney += money;
      alert(money);
    };

    $scope.confirmAmount = function (data) {
      $scope.buttonTextChange = true;
      if (data.costAmount == null) {
        //数额不能为空
      }

      QrCodeIntf.insertOneMasterOrderRecord($scope.custId, data.costAmount).then(function (succ) {
        $ionicLoading.show({
          template: '获取客户信息....'
        });
        if (succ != null && succ.res == true) {
          checkThisOrderStatus();
          $ionicLoading.hide();
          console.log(succ.data);
        } else {
          $log.error(succ);
          var alertTimeoutPopup = $ionicPopup.alert({
            title: '扫描错误',
            template: "无匹配用户信息，请重新扫描！"
          });
          $state.go('main.dash');
        }
        $scope.$broadcast('qrScan_finish');
      }, function (err) {
        $log.error(err);
      }, function (progress) {
        //连接超时提示
        $timeout(function () {
          var alertTimeoutPopup = $ionicPopup.alert({
            title: 'Connection Timeout',
            template: "连接服务端超时！"
          });
          $ionicLoading.hide();
        }, 30000);
      });

      //服务端轮询--------------------------------------------------------------
      function checkThisOrderStatus() {
        var refreshData = function () {
          QrCodeIntf.getThisOrderStatus().then(function (succ) {
            if (succ != null && succ.res == true) {
              $scope.orderStatus = succ.data;

              switch ($scope.orderStatus) {
                case "01":
                  break;
                case "11":
                  break;
                case "21":
                  break;
                case "09":
                  $scope.failReason = "Customer canceled";
                  checkTOrderInfo();
                  $state.go('main.payfail');
                  break;
                case "19":
                  $scope.failReason = "Store closed";
                  checkTOrderInfo();
                  $state.go('main.payfail');
                  break;
                case "29":
                  $scope.failReason = "Timeout";
                  checkTOrderInfo();
                  $state.go('main.payfail');
                  break;
                case "31":
                  checkTOrderInfo();
                  $state.go('main.paysuccess');
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
        // Cancel interval on page changes
        $scope.$on('$destroy', function () {
          if (angular.isDefined(promise)) {
            $interval.cancel(promise);
            promise = undefined;
          }
        });
      };

      //查看订单详细支付信息
      function checkTOrderInfo() {
        QrCodeIntf.getThisOrderInfo().then(function (succ) { //dwr返回值错误 二进制格式 改Long
         // if (succ != null && succ.res == true) {
            $scope.orderId = succ.data.orderId;
            $scope.costAmount = succ.data.costAmount;
            $scope.addFeeAmount = succ.data.addFeeAmount;
            $scope.discountAmount = succ.data.discountAmount;
            $scope.realAmount = succ.data.realAmount;
            $scope.custId = succ.data.custId;
            $scope.courierId = succ.data.courierId;
          //} else {
          //  $log.error(succ);
          //}
        }, function (err) {
          $log.error(err);
        });
      };

//----------------------------------------------------------------
    };


//处理其他订单----------------------------------------------------------------------
    $scope.goBackToDash = function () {
      $state.go('main.dash', {}, {reload: true});
    };


  }])
;
