/**
 * Created by Tato Lu on 24/2/2016.
 */
'use strict';
app.controller('TodayOrderCtrl', ['$scope', '$state', '$ionicActionSheet','$ionicLoading', 'ViewMasterOrderManager', '$ionicPopup', 'AuthService', '$log',
  function ($scope, $state, $ionicActionSheet,$ionicLoading, ViewMasterOrderManager, $ionicPopup, AuthService, $log) {

    $scope.doRefresh = function() {
      refresh();
      $scope.$broadcast('scroll.refreshComplete');
    };

    $scope.logout = function () {
      AuthService.logout();
      $state.go('login');
    };

    refresh();

    function refresh(){


      //刷详单
      ViewMasterOrderManager.getTodayFinishedOrder().then(function (succ) {
        if (succ != null && succ.res == true) {
          $scope.fullList = succ.data;
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
      ViewMasterOrderManager.getTodayFinishedOrderCount().then(function(data){
        if (data != null && data.res == true) {
          $scope.totalList = data.data[0];
          //console.log(data.data);
          //console.log(data.data[0].txnCount);
        } else {
          $log.error(data);
        }
      },function(err){
        $log.error(err);
      });
    };

  $scope.showOrderDetail = function(data){
    $state.go('main.orderDetail', {orderId:data.orderId}, {reload: true});

  }









  }]);
