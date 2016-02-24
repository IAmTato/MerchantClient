/**
 * Created by Tato Lu on 16/2/2016.
 */
'use strict';
app.controller('DeliverGoodsCtrl', ['$scope', '$state', '$ionicActionSheet','$ionicLoading', 'DeliverIntf', 'HsTrMasterOrderManager', 'ViewMasterOrderManager', '$ionicPopup', 'AuthService', '$log',
  function ($scope, $state, $ionicActionSheet,$ionicLoading, DeliverIntf, HsTrMasterOrderManager, ViewMasterOrderManager, $ionicPopup, AuthService, $log) {

    $scope.doRefresh = function() {
      refresh();
      $scope.$broadcast('scroll.refreshComplete');
    };

    $scope.logout = function () {
      AuthService.logout();
      $state.go('login');
    };

    refresh();

  /*  $ionicModal.fromTemplateUrl('my-modal.html', {
      scope: $scope,
      animation: 'slide-in-up'
    }).then(function(modal) {
      $scope.modal = modal;
    });

    $scope.openModal = function(data) {
      $scope.modalTitle = '订单号：' + data;
      $scope.modal.show();
    };
    $scope.closeModal = function() {
      $scope.modal.hide();
    };*/

    function refresh(){


      //刷详单
      ViewMasterOrderManager.getDeliverOrder().then(function (succ) {
        if (succ != null && succ.res == true) {
          $scope.fullList = succ.data;
          //console.log(succ.data);
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

      //刷Total
      DeliverIntf.getDeliver().then(function(data){
        if (data != null && data.res == true) {
          $scope.totalList = data.data;
          //console.log(data.data);
        } else {
          $log.error(data);
        }
      },function(err){
        $log.error(err);
      });
    };




    //交款按钮
    $scope.handover = function(){
      var confirmPopup = $ionicPopup.confirm({
        title: '交款',
        template: '确认交款？'
      });
      confirmPopup.then(function(res) {
        if (res) {
          DeliverIntf.handoverDeliver().then(function(data){
            if (data != null && data.res == true) {
              refresh();
            } else {
              $ionicPopup.alert({
                title: "交款",
                template: data.errMsg,
                okText: "OK",
                okType: "button-balanced"
              });
              $log.error(data);
            }
          },function(err){
            $log.error(err);
          });
        }else {
          console.log('You are not sure');
        }
      });

    };

    //确认完成订单
    function showConfirm(data) {
      var msg = "";
      if(data.payType=="1"){
        msg = '<b class="eMerchanColor-font-red">網上支付</b> 訂單，確認完成。';
      }else if(data.payType=="2"){
        msg = '<b class="eMerchanColor-font-red">貨到付款</b> 訂單，確認已收到款項。';
      }else{
        msg = '此訂單為掃碼支付,確認收到款項。';
      }

      var confirmPopup = $ionicPopup.confirm({
        title: '確認訂單:' + data.orderId,
        template: msg,
        cssClass: 'custom-popup' // this was the solve
      });

      confirmPopup.then(function(res) {
        if (res) {
          //console.log('You are sure');

          DeliverIntf.finishOrder(data.orderId, data.realAmount).then(function (succ) {
//          HsTrMasterOrderManager.updateDeliverOrder(data.orderId).then(function (succ) {
            if (succ != null && succ.res == true) {
              //$ionicPopup.alert({
              //  title: "完成訂單",
              //  template: succ.errMsg,
              //  okText: "OK",
              //  okType: "button-balanced"
              //});
              refresh();
            } else {
              $ionicPopup.alert({
                title: "完成訂單",
                template: succ.errMsg,
                okText: "OK",
                okType: "button-balanced"
              });
              $log.error(succ);
            }
          }, function (err) {
            $log.error(err);
          });

        }else {
          console.log('You are not sure');
        }
      });
    };

    //按订单后，下面弹出ActionSheet
    $scope.showActionSheet = function(data) {
      // Show the action sheet:
      $ionicActionSheet.show({
        buttons: [{
          text: '<i class="icon ion-android-document dark"></i><div class="dark">訂單詳情</div>'
        }, {
          text: '<i class="icon ion-social-usd eMerchanColor-font-red"></i><div class="eMerchanColor-font-red">確認已收款</div>'
        }],
        cancelText: '<i class="icon ion-android-close dark"></i><div class="dark">取消</div>',
        cancel: function() {
          //alert("Clicked Cancel");
        },
        buttonClicked: function(index, buttonObj) {
          switch (index) {
            case 0:
                $state.go('main.orderDetail', {orderId:data.orderId}, {reload: true});
              //alert("訂單詳情");
              //return false代表不自动收回，return true代表自动收回
              return true;
            case 1:
              //alert("完成訂單");
              showConfirm(data);
              return true;
          }
        }
      });
    };

  }]);
