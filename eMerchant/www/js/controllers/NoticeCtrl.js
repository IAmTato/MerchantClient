'use strict';
app.controller('NoticeCtrl', ['$scope', 'QrCodeIntf', '$interval', 'AuthService', 'NoticeService', 'IcbcUtil', '$log',
        function ($scope, QrCodeIntf, $interval, AuthService, NoticeService, IcbcUtil, $log) {

  $scope.notices = NoticeService.all();
  $scope.remove = function(notice) {
    NoticeService.remove(notice);
  };

}]);
