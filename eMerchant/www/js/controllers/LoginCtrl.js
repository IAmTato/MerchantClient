'use strict';
app.controller('LoginCtrl', ['$scope', '$state', '$ionicLoading', '$ionicPopup', 'AuthService',
  function ($scope, $state, $ionicLoading, $ionicPopup, AuthService) {
    $scope.data = {};

    $scope.login = function (data) {

      AuthService.login(data.username, data.password).then(function (authenticated) {
          //$ionicLoading.hide();
          $state.go('main.dash', {}, {reload: true});
          $scope.setCurrentUsername(authenticated.userName);
        }, function (err) {
          var alertFailPopup = $ionicPopup.alert({
            title: 'Login failed!',
            template: err.errMsg
          });
          //$ionicLoading.hide();
        }, function (progress) {
          //连接超时提示
          $timeout(function () {
            var alertFailPopup = $ionicPopup.alert({
              title: 'Login failed!',
              template: 超时
            });
          }, 30000);
        }
      );
    };

    $scope.forgetPassword = function (data) {
      $state.go('forgetpassword', {}, {reload: true});
    };

    $scope.resetPassword = function (data) {

    };
  }]);
