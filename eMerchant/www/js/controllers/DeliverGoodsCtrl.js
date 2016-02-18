'use strict';
app.controller('DeliverGoodsCtrl', ['$scope', '$state', 'HsTrMasterOrderManager', '$ionicPopup', 'AuthService', '$q',
  function ($scope, $state, HsTrMasterOrderManager, $ionicPopup, AuthService, $q) {
    $scope.search_key = "";

    $scope.logout = function () {
      AuthService.logout();
      $state.go('login');
    };

    $q(function(resolve, reject) {
      HsTrMasterOrderManager.getDeliverOrder().then(function(succ){
        if(succ != null && succ.res == true ){
          $scope.fullList=succ.data;
          console.log(succ.data);
          resolve("");
        }else{
          reject("");
        }
      },function(err){
        $log.error(err);
      });
    });

    $scope.transactionSearch = function (data) {
      console.log("transactionSearch：Key=" + data);

      var a = $q(function(resolve, reject) {
        HsTrMasterOrderManager.getHsTrMasterOrder().then(function(succ){
          if(succ != null && succ.res == true ){
            console.log(succ.data);
            $scope.fullList=succ.data;
            resolve("");
          }else{
            reject("");
          }
        },function(err){
          $log.error(err);
        });
      });

      $scope.fullList = a;
      console.log(a);
      console.log($scope.fullList);
      //var b = HsTrMasterOrderManager.getHsTrMasterOrder().then(function(succ){
      //  return succ.data;
      //});
      //console.log(b);
    };


    $scope.getCurrFocus = function (target) {
      console.log("getCurrFocus:" + target.getAttribute('name'));
      //$scope.dwrcurrFocus = target.getAttribute('name');
      //$scope.jQCurrFocus = $(target).attr('name');
    };
  }]);
