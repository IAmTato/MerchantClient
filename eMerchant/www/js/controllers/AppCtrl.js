'use strict';
app.controller('AppCtrl', ['$rootScope', '$scope', '$state', '$ionicPopup', 'AuthService', 'NoticeService', 'AUTH_EVENTS', 'ENV',
  function ($rootScope, $scope, $state, $ionicPopup, AuthService, NoticeService, AUTH_EVENTS, ENV, HsTrCustInfoManager) {
    $rootScope.username = AuthService.username();

    NoticeService.all();//开启通知服务
    $rootScope.unreadNoticeCount = NoticeService.getUnreadNoticeCount();

    $scope.$on(AUTH_EVENTS.notAuthorized, function (event) {
      var alertPopup = $ionicPopup.alert({
        title: 'Unauthorized!',
        template: 'You are not allowed to access this resource.'
      });
      $state.go('login');
    });

    $scope.$on(AUTH_EVENTS.notAuthenticated, function (event) {
      AuthService.logout();
      $state.go('login');
      var alertPopup = $ionicPopup.alert({
        title: 'Session Lost!',
        template: 'Sorry, You have to login again.'
      });
    });

    $scope.setCurrentUsername = function (name) {
      $rootScope.username = name;
    };

    $scope.$on(ENV.version, function (event) {
      var alertPopup = $ionicPopup.alert({
        title: 'Check for update',
        template: 'Do you want to update to newest version?'
      });
    });
  }]);



