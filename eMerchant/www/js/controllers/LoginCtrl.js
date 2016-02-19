'use strict';
app.controller('LoginCtrl', ['$scope', '$state','$ionicLoading', '$ionicPopup', 'AuthService',
    function ($scope, $state,$ionicLoading, $ionicPopup, AuthService) {
  $scope.data = {};

  $scope.loginStatus = false;
  $scope.login = function (data) {
    $ionicLoading.show({
      content: 'Loading',
      animation: 'fade-in',
      showBackdrop: true,
      maxWidth: 200,
      showDelay: 0
    });
    AuthService.login(data.username, data.password).then(function (authenticated) {
      $ionicLoading.hide();
      $state.go('main.dash', {}, {reload: true});
      $scope.setCurrentUsername(authenticated.userName);
    }, function (err) {
      var alertPopup = $ionicPopup.alert({
        title: 'Login failed!',
        template: err.errMsg
      });
      $ionicLoading.hide();
    });
  };

  $scope.forgetPassword = function (data) {
    $state.go('forgetpassword', {}, {reload: true});
  };

  $scope.resetPassword = function (data) {

  };
}]);
