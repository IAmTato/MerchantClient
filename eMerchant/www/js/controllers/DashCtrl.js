'use strict';
app.controller('DashCtrl', ['$scope', '$state', '$http', '$ionicPopup', 'AuthService','Notices', '$cordovaBarcodeScanner',
                    function($scope, $state, $http, $ionicPopup, AuthService, Notices, $cordovaBarcodeScanner) {
  $scope.logout = function() {
    AuthService.logout();
    $state.go('login');
  };

  $scope.scanBarcode = function() {
    $cordovaBarcodeScanner.scan().then(function(imageData) {
      var qrCode = imageData.text;
      //alert(StrNumbers);
      //console.log("Barcode Format -> " + imageData.format);
      //console.log("Cancelled -> " + imageData.cancelled);
      $state.go('main.orders-payconfirm',{}, {reload: true});
    });
  };

  $scope.notices = Notices.all();
  $scope.remove = function(notice) {
    Notices.remove(notice);
  };

  $scope.performValidRequest = function() {
    $http.get('http://localhost:8100/valid').then(
      function(result) {
        $scope.response = result;
      });
  };

  $scope.performUnauthorizedRequest = function() {
    $http.get('http://localhost:8100/notauthorized').then(
      function(result) {
        // No result here..
      }, function(err) {
        $scope.response = err;
      });
  };

  $scope.performInvalidRequest = function() {
    var res = $http.get('http://localhost:8100/notauthenticated');

      res.then(
      function succ(result)  {
        // No result here..
      }, function err(err)  {
        $scope.response = err;
      });
  };

  $scope.deliverGoods=function(){
    //alert("Tato Entry");
    $state.go('main.deliverGoodsMain',{}, {reload: true});
  }

  $scope.assignGoods= function () {
      $state.go('main.assignGoodsMain',{},{reload: true});
  }
}]);
