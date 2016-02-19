'use strict';
app.controller('DeliverGoodsCtrl', ['$scope', '$state', 'HsTrMasterOrderManager', 'ViewMasterOrderManager', '$ionicPopup', 'AuthService', '$log',
  function ($scope, $state, HsTrMasterOrderManager, ViewMasterOrderManager, $ionicPopup, AuthService, $log) {

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
    };

    $scope.comparator = function(a,b){
      alert(a);
      alert(b);
    }

    $scope.changeKey = function(input){
      console.log(input);
      $scope['search_key.orderId'] = input;
      $scope['search_key.createDate'] = input;
      console.log($scope.search_key);
    };
    $scope.showConfirm = function(data) {
      var confirmPopup = $ionicPopup.confirm({
        title: '确认订单:' + data.orderId,
        template: '此订单为货到付款，请确认已收到款项。'
      });

      confirmPopup.then(function(res) {
        if (res) {
          //console.log('You are sure');
          HsTrMasterOrderManager.updateDeliverOrder(data.orderId).then(function (succ) {
            if (succ != null && succ.res == true) {
              refresh();
            } else {
              $log.error(succ);
            }
          }, function (err) {
            $log.error(err);
          });;

        }else {
          console.log('You are not sure');
        }
      });
    };

  }]);
