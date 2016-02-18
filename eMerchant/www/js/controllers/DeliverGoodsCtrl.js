'use strict';
app.controller('DeliverGoodsCtrl', ['$scope', '$state', 'ViewMasterOrderManager', '$ionicPopup', 'AuthService', '$log',
  function ($scope, $state, ViewMasterOrderManager, $ionicPopup, AuthService, $log) {


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
