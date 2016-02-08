'use strict';
app.controller('NoticeCtrl', ['$scope', 'Notices', function($scope, Notices) {

    $scope.notices = Notices.all();
    $scope.remove = function(notice) {
      Notices.remove(notice);
    };

  }]);
