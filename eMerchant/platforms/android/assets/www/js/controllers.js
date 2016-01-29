angular.module('starter.controllers', [])

.controller('DashCtrl', function($scope) {


    })

.controller('ChatsCtrl',['$scope', 'Chats','$cordovaBarcodeScanner','IcbcUtil',function($scope, Chats,$cordovaBarcodeScanner,IcbcUtil) {
  // With the new view caching in Ionic, Controllers are only called
  // when they are recreated or on app start, instead of every page change.
  // To listen for when this page is active (for example, to refresh data),
  // listen for the $ionicView.enter event:
  //
  //$scope.$on('$ionicView.enter', function(e) {
  //});




        $scope.scanBarcode = function() {


            $cordovaBarcodeScanner.scan().then(function(imageData) {

                alert(imageData.text);

                console.log("Barcode Format -> " + imageData.format);

                console.log("Cancelled -> " + imageData.cancelled);

            }, function(error) {

                console.log("An error happened -> " + error);

            });

        };



        $scope.chats = Chats.all();
  $scope.remove = function(chat) {


      IcbcUtil.getDwrMaxCallCount().then(function succ(data){
          alert(data);
      },function err(data){
          alert("err:"+data);
      });

    Chats.remove(chat);
  };
}] )

.controller('ChatDetailCtrl', function($scope, $stateParams, Chats) {
  $scope.chat = Chats.get($stateParams.chatId);
})
.controller('AccountCtrl',function($scope,$q) {

        function asyncGreet(name) {
            var deferred = $q.defer();

            setTimeout(function() {
                $scope.$apply(function() {
                    deferred.notify('即将问候 ' + name + '.');

                    if (name) {
                        deferred.resolve('你好, ' + name + '!');
                    } else {
                        deferred.reject('拒绝问候 ' + name + ' .');
                    }
                });
            }, 1000);
            return deferred.promise;
        }

        var promise = asyncGreet('小漠漠');
        promise.then(function(greeting) {
            alert('成功: ' + greeting);
        }, function(reason) {
            alert('失败鸟: ' + reason);
        }, function(update) {
            alert('收到通知: ' + update);
        });
  $scope.settings = {
    enableFriends: true
  };
});
