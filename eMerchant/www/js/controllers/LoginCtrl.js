'use strict';
app.controller('LoginCtrl', ['$scope', '$state', '$ionicPopup', 'AuthService', function ($scope, $state, $ionicPopup, AuthService) {
  $scope.data = {};

  $scope.login = function (data) {
    AuthService.login(data.username, data.password).then(function (authenticated) {
      $state.go('main.dash', {}, {reload: true});
      $scope.setCurrentUsername(authenticated.userName);
    }, function (err) {
      var alertPopup = $ionicPopup.alert({
        title: 'Login failed!',
        template: err.errMsg
      });
    });
  };

  $scope.forgetPassword = function (data) {
    $state.go('forgetpassword', {}, {reload: true});
  };

  $scope.resetPassword = function (data) {

  };
}]);
