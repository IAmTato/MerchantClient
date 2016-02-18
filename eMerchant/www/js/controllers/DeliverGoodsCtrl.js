'use strict';
app.controller('DeliverGoodsCtrl', ['$scope', '$state', 'ViewMasterOrderManager', '$ionicPopup', 'AuthService', '$log',
  function ($scope, $state, ViewMasterOrderManager, $ionicPopup, AuthService, $log) {
    

    $scope.logout = function () {
      AuthService.logout();
      $state.go('login');
    };

      ViewMasterOrderManager.getDeliverOrder().then(function(succ){
        if(succ != null && succ.res == true ){
          $scope.fullList=succ.data;
          console.log(succ.data);
        }else{
          $log.error(succ);
        }
      },function(err){
        $log.error(err);
      });



    $scope.getCurrFocus = function (target) {
      console.log("getCurrFocus:" + target.getAttribute('name'));
      //$scope.dwrcurrFocus = target.getAttribute('name');
      //$scope.jQCurrFocus = $(target).attr('name');
    };
  }]);
