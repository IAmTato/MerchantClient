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

    $scope.showActionSheet = function(data) {
      // Show the action sheet:
      $ionicActionSheet.show({
        buttons: [{
          text: '<i class="icon ion-android-document dark"></i><div class="dark">訂單詳情</div>'
        }],
        destructiveText: '<i class="icon ion-social-usd assertive"></i><div class="assertive">確認已收款</div>',
        cancelText: '取消',
        cancel: function() {
          return true;
        },
        destructiveButtonClicked: function(data) {
          var confirmPopup = $ionicPopup.confirm({
            title: '确认订单:' + data,
            template: '此订单为货到付款，请确认已收到款项。'
          });

          confirmPopup.then(function (res) {
            if (res) {
              console.log('You are sure');
            } else {
              console.log('You are not sure');
            }
          });
          return true;
        },
        buttonClicked: function(index, buttonObj) {
          switch (index) {
            case 0:
              alert("Clicked Share");
              return false;
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


    $scope.showConfirm = function (data) {
      var confirmPopup = $ionicPopup.confirm({
        title: '确认订单:' + data,
        template: '此订单为货到付款，请确认已收到款项。'
      });

      confirmPopup.then(function (res) {
        if (res) {
          console.log('You are sure');
        } else {
          console.log('You are not sure');
        }
      });
    };

  }]);
