'use strict';
app.controller('NoticeCtrl', ['$rootScope','$scope', 'QrCodeIntf', '$interval', 'AuthService', 'NoticeService', 'IcbcUtil', '$log',
  function ($rootScope, $scope, QrCodeIntf, $interval, AuthService, NoticeService, IcbcUtil, $log) {

    $scope.notices = NoticeService.all();
    $scope.remove = function (notice) {
      NoticeService.remove(notice);
    };
    NoticeService.setUnreadNoticeCount(0);
    $rootScope.unreadNoticeCount = 0;


  }]);
