/**
 * Created by xiongfeizhao on 17/2/2016.
 */
'use strict';
app.controller('AssignGoodsCtrl', ['$scope', '$state', 'ViewMasterOrderManager', '$ionicPopup', 'AuthService', '$log', '$ionicLoading', '$ionicActionSheet',
  function ($scope, $state, ViewMasterOrderManager, $ionicPopup, AuthService, $log, $ionicLoading, $ionicActionSheet) {

    $scope.doRefresh = function () {

      ViewMasterOrderManager.getDeliverOrder().then(function (succ) {
        if (succ != null && succ.res == true) {
          $scope.fullList = succ.data;
          console.log(succ.data);
        } else {
          $log.error(succ);
        }
        $scope.$broadcast('scroll.refreshComplete');
      }, function (err) {
        $log.error(err);
      });

    };

    $scope.logout = function () {
      AuthService.logout();
      $state.go('login');
    };

    /*
    $ionicLoading.show({
      template: 'Loading...'
    });
    */

    function showConfirm(data) {
      var confirmPopup = $ionicPopup.confirm({
        title: '确认订单:' + data.orderId,
        template: '货到付款订单，请确认已收到款项。',
        cssClass: 'custom-popup' // this was the solve
      });

      confirmPopup.then(function(res) {
        if (res) {
          //console.log('You are sure');

          DeliverIntf.finishOrder(data.orderId, data.realAmount).then(function (succ) {
//          HsTrMasterOrderManager.updateDeliverOrder(data.orderId).then(function (succ) {
            if (succ != null && succ.res == true) {
              $ionicPopup.alert({
                title: "完成訂單",
                template: succ.errMsg,
                okText: "OK",
                okType: "button-balanced"
              });
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

    $scope.showActionSheet = function(data) {
      // Show the action sheet:
      $ionicActionSheet.show({
        buttons: [{
          text: '<i class="icon ion-android-document dark"></i><div class="dark">訂單詳情</div>'
        }, {
          text: '<i class="icon ion-social-usd eMerchanColor-font-red"></i><div class="eMerchanColor-font-red">確認已收款</div>'
        }],
        cancelText: '取消',
        cancel: function() {
          return true;
        },
        buttonClicked: function(index, buttonObj) {
          switch (index) {
            case 0:
              alert("訂單詳情");
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

    ViewMasterOrderManager.getDeliverOrder().then(function (succ) {

      if (succ != null && succ.res == true) {
        $scope.fullList = succ.data;
        console.log(succ.data);
       // $ionicLoading.hide();
      } else {
        $log.error(succ);
      }

    }, function (err) {
      $log.error(err);
    });


  }]);
