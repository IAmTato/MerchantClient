/**
 * Created by xiongfeizhao on 17/2/2016.
 */
'use strict';
app.controller('AssignGoodsCtrl', ['$scope', '$state', 'ViewMasterOrderManager', '$ionicPopup', 'AuthService', '$log',
  function ($scope, $state, ViewMasterOrderManager, $ionicPopup, AuthService, $log) {

    $scope.doRefresh = function() {
      // Subtract from the value of the first item ID to get the new one.
      ViewMasterOrderManager.getDeliverOrder().then(function (succ) {
        if (succ != null && succ.res == true) {
          $scope.fullList = succ.data;
          console.log(succ.data);
        } else {
          $log.error(succ);
        }
      }, function (err) {
        $log.error(err);
      });
      $scope.$broadcast('scroll.refreshComplete');
    };

    $scope.logout = function () {
      AuthService.logout();
      $state.go('login');
    };

    ViewMasterOrderManager.getDeliverOrder().then(function (succ) {
      if (succ != null && succ.res == true) {
        $scope.fullList = succ.data;
        console.log(succ.data);
      } else {
        $log.error(succ);
      }
    }, function (err) {
      $log.error(err);
    });

    $scope.showConfirm = function(data) {
      var confirmPopup = $ionicPopup.confirm({
        title: '确认订单:' + data,
        template: '此订单为货到付款，请确认已收到款项。'
      });

      confirmPopup.then(function(res) {
        if (res) {
          console.log('You are sure');
        }else {
          console.log('You are not sure');
        }
      });
    };

  }]);
