'use strict';
app.controller('DashCtrl', ['$scope', '$rootScope', '$state', '$ionicLoading', '$timeout', '$http', '$ionicPopup', 'AuthService', 'Notices', '$cordovaBarcodeScanner',
  function ($scope, $rootScope, $state, $ionicLoading, $timeout, $http, $ionicPopup, AuthService, Notices, $cordovaBarcodeScanner) {
    $scope.logout = function () {
      AuthService.logout();
      $state.go('login');
    };

    $rootScope.username = AuthService.username();

    //底部菜单栏显示----------------------------------------------------------------------------------
    //$scope.showMenuBar = true;

    //二维码扫描---------------------------------------------------------------------------------------
    $scope.scanBarcode = function () {
        window.cordova.plugins.barcodeScanner.scan(
          function (result) {
            //$rootScope.barcoderesults = [{
            //  Result: result.text,
            //  Format: result.format,//QR_CODE  and others
            //  Cancelled: result.cancelled //true or false
            //}];
            if (result.format == "QR_CODE") {
                $state.go('main.payconfirm', {qrcodeId: result.text});
            }else if(!result.cancelled){
              $ionicLoading.show({ template: '非二维码格式,请确认!', noBackdrop: true, duration: 2000 });
            }
          },
          function (error) {
            alert("Scanning failed: " + error);
          }
        );
    };

    //---------------------------------------------------------------------------------------------------
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
      $state.go('main.deliverGoodsMain', {}, {reload: true});
    }

    $scope.assignGoods = function () {
      $state.go('main.assignGoodsMain', {}, {reload: true});
    }

    $scope.todayOrder = function () {
      $state.go('main.todayOrder', {}, {reload: true});
    }
  }]);
