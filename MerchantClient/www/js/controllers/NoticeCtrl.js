'use strict';
app.controller('NoticeCtrl', ['$rootScope','$scope', 'QrCodeIntf', '$interval', 'AuthService', 'NoticeService', 'IcbcUtil', '$log',
  function ($rootScope, $scope, QrCodeIntf, $interval, AuthService, NoticeService, IcbcUtil, $log) {

    $scope.notices = NoticeService.all();

    $scope.nodata = false;
    if($scope.notices.length == 0){
      $scope.nodata = true;
    }
    console.log($scope.notices.length);

    $scope.remove = function (notice) {
      NoticeService.remove(notice);
    };

    $scope.$on('$destroy', function () {
      NoticeService.setUnreadNoticeCount(0);
    });

    //下拉刷新数据
    $scope.doRefresh = function () {
      $scope.notices = NoticeService.all();
      $scope.$broadcast('scroll.refreshComplete');
    };

  }]);
