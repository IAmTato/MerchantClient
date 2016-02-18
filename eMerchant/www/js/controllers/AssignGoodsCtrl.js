/**
 * Created by xiongfeizhao on 17/2/2016.
 */
'use strict';
app.controller('AssignGoodsCtrl', ['$scope','$ionicHistory','$ionicPopup', 'AuthService','Notices', '$cordovaBarcodeScanner',
  function($scope, $state, $http, $ionicPopup, AuthService, Notices, $cordovaBarcodeScanner) {
  $scope.logout = function() {
    AuthService.logout();
    $state.go('login');
  };

  $scope.doRefresh = function() {
      // Subtract from the value of the first item ID to get the new one.
      var newId = $scope.items[0].id - 1;
      $scope.items.unshift({ id: newId });
      $scope.$broadcast('scroll.refreshComplete');
  };

  $scope.items = [
      { id: 0 },
      { id: 1 },
      { id: 2 },
      { id: 3 },
      { id: 4 },
      { id: 5 },
      { id: 6 },
      { id: 7 },
      { id: 8 },
      { id: 9 },
      { id: 10 }
  ];

}]);
