/**
 * Created by xiongfeizhao on 17/2/2016.
 */
'use strict';
app.controller('AssignGoodsCtrl', ['$scope', '$state', 'ViewMasterOrderManager', '$timeout', '$ionicPopup', 'AuthService', '$log', '$ionicLoading', '$ionicActionSheet',
  function ($scope, $state, ViewMasterOrderManager, $timeout, $ionicPopup, AuthService, $log, $ionicLoading, $ionicActionSheet) {

    //读取数据
    getUnassignedOrders();

    //下拉刷新数据
    $scope.doRefresh = function () {
      getUnassignedOrders();
      $scope.$broadcast('scroll.refreshComplete');
    };

    //登出方法
    $scope.logout = function () {
      AuthService.logout();
      $state.go('login');
    };

    //点击订单并输入送货员手机号
    function inputDeliverMobile(data) {
      var promptPopup = $ionicPopup.prompt({
        title: '訂單:' + data.orderId + '&nbsp;&nbsp;送貨員信息',
        inputType: 'number',
        inputPlaceholder: ' 送貨員手機號碼',
        cssClass: 'custom-popup' // this was the solve
      });

      promptPopup.then(function (res) {
        if (res) {
          //console.log('You are sure');
          console.log(res);
          DeliverIntf.finishOrder(data.orderId, data.realAmount).then(function (succ) {
//          HsTrMasterOrderManager.updateDeliverOrder(data.orderId).then(function (succ) {
            if (succ != null && succ.res == true) {
              $ionicPopup.alert({
                title: "完成訂單",
                template: succ.errMsg,
                okText: "OK"
              });
              refresh();
            } else {
              $ionicPopup.alert({
                title: "完成訂單",
                template: succ.errMsg,
                okText: "OK"
              });
              $log.error(succ);
            }
          }, function (err) {
            $log.error(err);
          });

        } else {
          console.log('You are not sure');
        }
      });
    };

    //点击订单显示下方model菜单
    $scope.showActionSheet = function (data) {
      // Show the action sheet:
      $ionicActionSheet.show({
        buttons: [{
          text: '<i class="icon ion-android-document dark"></i><div class="dark">訂單詳情</div>'
        }, {
          text: '<i class="icon ion-android-walk eMerchanColor-font-red"></i><div class="eMerchanColor-font-red">指定送貨員</div>'
        }],
        cancelText: '<i class="icon ion-android-close dark"></i><div class="dark">取消</div>',
        cancel: function () {
          return true;
        },
        buttonClicked: function (index, buttonObj) {
          switch (index) {
            case 0:
              $state.go('main.orderDetail', {orderId:data.orderId}, {reload: true});
              //return false代表不自动收回，return true代表自动收回
              return true;
            case 1:
              //alert("完成訂單");
              inputDeliverMobile(data);
              return true;
          }
        }
      });
    };

    //获取未分配订单数据
    function getUnassignedOrders() {
      ViewMasterOrderManager.getPendingAssignOrder().then(function (succ) {
        if (succ != null && succ.res == true) {
          $scope.fullList = succ.data;
          console.log(succ.data);
        } else {
          $log.error(succ);
        }
      }, function (err) {
        $log.error(err);
      }, function (progress) {
        //连接超时提示
        $timeout(function () {
          if (!loginStatus) {
            $ionicPopup.alert({
              title: '連接超時',
              template: "獲取訂單數據失敗"
            });
          }
        }, 30000);
      });
    };

  }]);
