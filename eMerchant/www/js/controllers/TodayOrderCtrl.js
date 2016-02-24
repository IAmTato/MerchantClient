/**
 * Created by Tato Lu on 24/2/2016.
 */
'use strict';
app.controller('TodayOrderCtrl', ['$scope', '$state', '$ionicActionSheet','$ionicLoading', 'DeliverIntf', 'HsTrMasterOrderManager', 'ViewMasterOrderManager', '$ionicPopup', 'AuthService', '$log',
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











  }]);
