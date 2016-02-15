'use strict';
app.controller('NoticeCtrl', ['$scope', 'Notices','IcbcUtil','$log', function($scope, Notices,IcbcUtil,$log) {

    $scope.notices = Notices.all();
    $scope.remove = function(notice) {
        IcbcUtil.getRandomNum(20).then(function succ(data){
            $log.debug(data);
            alert(data.data);
        },function err(data){
            $log.debug(data);
        })

      Notices.remove(notice);
    };

  }]);
