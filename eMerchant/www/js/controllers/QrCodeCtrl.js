/**
 * Created by linchao on 19/2/2016.
 */
'use strict';
app.controller('QrCodeCtrl', ['$rootScope', '$scope', '$state', '$stateParams', '$ionicLoading', '$timeout', 'HsTrQrcodeManager', 'HsTrMasterOrderManager', 'HsTrStoreDetailManager', '$ionicPopup', 'AuthService', '$log', '$q',
  function ($rootScope,$scope, $state, $stateParams, $ionicLoading, $timeout, HsTrQrcodeManager, HsTrMasterOrderManager, HsTrStoreDetailManager, $ionicPopup, AuthService, $log, $q) {

    $scope.buttonTextChange = false;

    HsTrQrcodeManager.findHsTrQrcodeByQrCodeId($stateParams.qrcodeId).then(function (succ) {
      $ionicLoading.show({
        template: '获取客户信息....'
      });
      if (succ.data.custId == "undefined" || succ.data.custId == "") {
        var alertTimeoutPopup = $ionicPopup.alert({
          title: '扫描错误',
          template: "无匹配用户信息，请重新扫描！"
        });
        $state.go('main.dash', {}, {reload: true});
      } else if (succ != null && succ.res == true) {
        //更新二维码表 -- 二维码已扫描
        HsTrQrcodeManager.updateQrCodeStatus('2', $stateParams.qrcodeId);
        $scope.custId = succ.data.custId;
        $ionicLoading.hide();
        console.log(succ.data);
      } else {
        $log.error(succ);
        var alertTimeoutPopup = $ionicPopup.alert({
          title: '扫描错误',
          template: "无匹配用户信息，请重新扫描！"
        });
        $state.go('main.dash', {}, {reload: true});
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

    //确认金额
    $scope.data = {};
    $scope.setCurrentMoney = function (money) {
      $scope.totalMoney += money;
      alert(money);
    };

    $scope.confirmMoney = function (data) {

      var qrPay_result = $q(function (resolve, reject) {
        $scope.buttonTextChange = true;

        HsTrStoreDetailManager.getHsTrStoreDetailByUser().then(function (succ) {
          if (succ != null && succ.res == true) {
            $rootScope.storeId = succ.data.storeId;
          } else {
            $log.error(succ);
          }
        }, function (err) {
          $log.error(err);
        });

        var createOrder = {//orderType, custId, storeId, currency, costAmount, realAmount, orderStatus, payType
          orderType: '1',
          custId: $stateParams.qrcodeId,
          storeId: $rootScope.storeId,
          currency: "MOP",
          costAmount: data.inputMoney,
          realAmount: data.inputMoney,
          orderStatus: '01',
          payType: '3'
        };

        HsTrMasterOrderManager.insertQrPayRecord(createOrder).then(function (succ) {
          if (succ != null && succ.res == true) {
            $scope.custId = succ.data.custId;
            //更新二维码表状态 -- 已生成订单
            HsTrQrcodeManager.updateQrCodeStatus('3', $stateParams.qrcodeId);
            $ionicLoading.show({ template: '订单已生成，待客户完成支付！', noBackdrop: true, duration: 2000 });
            console.log(succ.data);
          } else {
            $log.error(succ);
          }
          $scope.$broadcast('payConfirm_finish');
        }, function (err) {
          $log.error(err);
        }, function (progress) {
          //连接超时提示
          $timeout(function () {
            if (qrPay_result != "9999") {
              $state.go('main.paysuccess', {}, {reload: true});
            }
          }, 20000);
        });
        return qrPay_result;
      });
    };

    //处理其他订单
    $scope.goBackToDash = function () {
      $state.go('main.dash', {}, {reload: true});
    };

  }]);
