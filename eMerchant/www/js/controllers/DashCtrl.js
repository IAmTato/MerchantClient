'use strict';
app.controller('DashCtrl', ['$scope', '$rootScope', '$state', '$ionicLoading', '$timeout', '$http', '$ionicPopup', 'AuthService', 'Notices', '$cordovaBarcodeScanner',
  function ($scope, $rootScope, $state, $ionicLoading, $timeout, $http, $ionicPopup, AuthService, Notices, $cordovaBarcodeScanner) {
    $scope.logout = function () {
      AuthService.logout();
      $state.go('login');
    };
    $scope.scanBarcode = function () {
      $ionicLoading.show({
        template: 'Scanning....'
      });
      $timeout(function () {
        $ionicLoading.hide();
        window.cordova.plugins.barcodeScanner.scan(
          function (result) {
            //make the change here
            $rootScope.barcoderesults = [{
              Result: result.text,
              Format: result.format,
              Cancelled: result.cancelled
            }];
            $state.go('main.orders-payconfirm', {qrcodeId:result.text}, {reload: true});
          },
          function (error) {
            alert("Scanning failed: " + error);
          }
        );
      }, 1000, false);
    }

    $scope.notices = Notices.all();
    $scope.remove = function (notice) {
      Notices.remove(notice);
    };

    $scope.performValidRequest = function () {
      $http.get('http://localhost:8100/valid').then(
        function (result) {
          $scope.response = result;
        });
    };

    $scope.performUnauthorizedRequest = function () {
      $http.get('http://localhost:8100/notauthorized').then(
        function (result) {
          // No result here..
        }, function (err) {
          $scope.response = err;
        });
    };

    $scope.performInvalidRequest = function () {
      var res = $http.get('http://localhost:8100/notauthenticated');

      res.then(
        function succ(result) {
          // No result here..
        }, function err(err) {
          $scope.response = err;
        });
    };

    $scope.deliverGoods = function () {
      //alert("Tato Entry");
      $state.go('main.deliverGoodsMain', {}, {reload: true});
    }

    $scope.assignGoods = function () {
      $state.go('main.assignGoodsMain', {}, {reload: true});
    }
  }]);
