/**
 * Created by xiongfeizhao on 17/2/2016.
 */
'use strict';
app.controller('AssignGoodsCtrl', ['$scope','$ionicHistory','$ionicPopup', 'AuthService','Notices', '$cordovaBarcodeScanner',
  function($scope, $state, $http, $ionicPopup, AuthService) {


  $scope.doRefresh = function() {
      // Subtract from the value of the first item ID to get the new one.
      var newId = $scope.items[0].id - 1;
      $scope.items.unshift({ id: newId });
      $scope.$broadcast('scroll.refreshComplete');
  };

    $scope.search_key = "";

    $scope.logout = function () {
      AuthService.logout();
      $state.go('login');
    };

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

    $scope.transactionSearch = function (data) {
      console.log("transactionSearch：Key=" + data);

        HsTrMasterOrderManager.getHsTrMasterOrder().then(function(succ){
          if(succ != null && succ.res == true ){
            console.log(succ.data);
            $scope.fullList=succ.data;
            resolve("");
          }else{
            $log.error(err);
          }
        },function(err){
          $log.error(err);
        });

      $scope.fullList = a;
      console.log(a);
      console.log($scope.fullList);
    };


    $scope.getCurrFocus = function (target) {
      console.log("getCurrFocus:" + target.getAttribute('name'));
    };
}]);
