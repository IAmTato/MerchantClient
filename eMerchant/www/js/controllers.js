angular.module('eMerchant')

// .controller('AppCtrl', function() {})
// .controller('LoginCtrl', function() {})
// .controller('DashCtrl', function() {});
.controller('AppCtrl', function($scope, $state, $ionicPopup, AuthService, AUTH_EVENTS,ENV) {
  $scope.username = AuthService.username();

  $scope.$on(AUTH_EVENTS.notAuthorized, function(event) {
    var alertPopup = $ionicPopup.alert({
      title: 'Unauthorized!',
      template: 'You are not allowed to access this resource.'
    });
  });

  $scope.$on(AUTH_EVENTS.notAuthenticated, function(event) {
    AuthService.logout();
    $state.go('login');
    var alertPopup = $ionicPopup.alert({
      title: 'Session Lost!',
      template: 'Sorry, You have to login again.'
    });
  });

  $scope.setCurrentUsername = function(name) {
    $scope.username = name;
  };

  $scope.$on(ENV.version, function(event) {
    var alertPopup = $ionicPopup.alert({
      title: 'Check for update',
      template: 'Do you want to update to newest version?'
    });
  });
})

.controller('LoginCtrl', function($scope, $state, $ionicPopup, AuthService) {
  $scope.data = {};

  $scope.login = function(data) {
    AuthService.login(data.username, data.password).then(function(authenticated) {
      $state.go('main.dash', {}, {reload: true});
      $scope.setCurrentUsername(data.username);
    }, function(err) {
      var alertPopup = $ionicPopup.alert({
        title: 'Login failed!',
        template: 'Please check your credentials!'
      });
    });
  };
})

.controller('MyCtrl', function($scope, $state, $ionicPopup, $timeout, $cordovaAppVersion, $ionicLoading,
                               $cordovaFileTransfer, $cordovaFile, $cordovaFileOpener2, AuthService, ENV) {
  $scope.logout = function() {
    AuthService.logout();
    $state.go('login');
  };

  $scope.appVersion = ENV.version;

  $scope.checkUpdate = function() {
    var serverAppVersion = "0.1.0"; //从服务端获取最新版本
    //获取版本
    $cordovaAppVersion.getAppVersion().then(function (version) {
      //如果本地与服务端的APP版本不符合
      if (version != serverAppVersion) {
        showUpdateConfirm();
      }
    });
  };

  // 显示是否更新对话框
  function showUpdateConfirm() {
    var confirmPopup = $ionicPopup.confirm({
      title: '版本升级',
      template: '1.更新BUG1;</br>2.更新BUG2;</br>3.更新BUG3;</br>4.添加功能4', //从服务端获取更新的内容
      cancelText: '取消',
      okText: '升级'
    });
    confirmPopup.then(function (res) {
      if (res) {
        $ionicLoading.show({
          template: "已经下载：0%"
        });
        var url = "http://192.168.1.50/1.apk"; //可以从服务端获取更新APP的路径
        var targetPath = "file:///storage/sdcard0/Download/1.apk"; //APP下载存放的路径，可以使用cordova file插件进行相关配置
        var trustHosts = true
        var options = {};
        $cordovaFileTransfer.download(url, targetPath, options, trustHosts).then(function (result) {
          // 打开下载下来的APP
          $cordovaFileOpener2.open(targetPath, 'application/vnd.android.package-archive'
          ).then(function () {
            // 成功
          }, function (err) {
            // 错误
          });
          $ionicLoading.hide();
        }, function (err) {
          alert('下载失败');
        }, function (progress) {
          //进度，这里使用文字显示下载百分比
          $timeout(function () {
            var downloadProgress = (progress.loaded / progress.total) * 100;
            $ionicLoading.show({
              template: "已经下载：" + Math.floor(downloadProgress) + "%"
            });
            if (downloadProgress > 99) {
              $ionicLoading.hide();
            }
          })
        });
      } else {
        // 取消更新
      }
    });
  }

})

.controller('DashCtrl', function($scope, $state, $http, $ionicPopup, AuthService, $cordovaBarcodeScanner,IcbcUtil,$log) {
  $scope.logout = function() {
    AuthService.logout();
    $state.go('login');
  };

  $scope.scanBarcode = function() {
    $cordovaBarcodeScanner.scan().then(function(imageData) {
      var StrNumbers=imageData.text;
      //alert(StrNumbers);
      //console.log("Barcode Format -> " + imageData.format);
      //console.log("Cancelled -> " + imageData.cancelled);
      //$state.go('main.orders.pay_confirm', {
      $state.go('orders.pay_confirm');
    }, function(error) {
    });
  };

  $scope.performValidRequest = function() {

    IcbcUtil.getDwrMaxCallCount().then(function succ(data){
        alert(data);
    },function err(e){
        $log.error(e)
    });
//    $http.get('http://localhost:8100/valid').then(
//      function(result) {
//        $scope.response = result;
//      });
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
    $http.get('http://localhost:8100/notauthenticated').then(
      function(result) {
        // No result here..
      }, function(err) {
        $scope.response = err;
      });
  };
});
