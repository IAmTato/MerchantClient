// Ionic Starter App

// angular.module is a global place for creating, registering and retrieving Angular modules
// 'starter' is the name of this angular module example (also set in a <body> attribute in index.html)
// the 2nd parameter is an array of 'requires'
angular.module('eMerchant', ['ionic', 'ngMockE2E', 'ngCordova'])
// bower install angular-mocks --save
// <script src="lib/angular-mocks/angular-mocks.js"></script>
// https://docs.angularjs.org/api/ngMockE2E
//$rootScope 用于手机按键处理
.run(['$ionicPlatform', '$ionicActionSheet', '$timeout','$cordovaAppVersion', '$ionicPopup', '$ionicLoading','$cordovaFileTransfer', '$cordovaFile', '$cordovaFileOpener2',
    function ($ionicPlatform, $ionicActionSheet, $timeout, $cordovaAppVersion, $ionicPopup, $ionicLoading, $cordovaFileTransfer, $cordovaFile, $cordovaFileOpener2) {
  $ionicPlatform.ready(function() {
    // Hide the accessory bar by default (remove this to show the accessory bar above the keyboard
    // for form inputs)
    if(window.cordova && window.cordova.plugins.Keyboard) {
      cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true);
    }
    if(window.StatusBar) {
      StatusBar.styleDefault();
    }

    //检测更新
    checkUpdate();
  });
  // 检查更新
  function checkUpdate() {
    var serverAppVersion = "0.1.0"; //从服务端获取最新版本
    //获取版本
    $cordovaAppVersion.getAppVersion().then(function (version) {
      //如果本地与服务端的APP版本不符合
      if (version != serverAppVersion) {
        showUpdateConfirm();
      }
    });
  }

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
}])

.config(function ($stateProvider, $urlRouterProvider, USER_ROLES) {
  $stateProvider
  .state('login', {
    url: '/login',
    templateUrl: 'views/login.html',
    controller: 'LoginCtrl'
  })
  .state('main', {
    url: '/',
    abstract: true,
    templateUrl: 'views/main.html'
  })
  .state('main.dash', {
    url: 'main/dash',
    views: {
        'dash-tab': {
          templateUrl: 'views/dashboard.html',
          controller: 'DashCtrl'
        }
    }
  })
//-----------------------------------------------------------------------
//订单模块
  .state('main.orders', {
    url: 'main/orders',
    views: {
        'orders-tab': {
          templateUrl: 'views/orders.html'
        }
    }
  })
  .state('orders.pay_confirm', {
    url: '/orders/pay_confirm',
    views: {
        'orders-tab': {
         templateUrl: 'views/orders/pay_confirm.html'
        }
    }
  })
//-----------------------------------------------------------------------
  .state('main.my', {
    url: 'main/my',
    views: {
      'my-tab': {
        templateUrl: 'views/my.html',
        controller: 'MyCtrl'
      }
    }
  })
  .state('main.admin', {
    url: 'main/admin',
    views: {
        'admin-tab': {
          templateUrl: 'views/admin.html'
        }
    },
    data: {
      authorizedRoles: [USER_ROLES.admin]
    }
  });
  $urlRouterProvider.otherwise('/main/dash');
})

.run(function($httpBackend){
  $httpBackend.whenGET('http://localhost:8100/valid')
        .respond({message: 'This is my valid response!'});
  $httpBackend.whenGET('http://localhost:8100/notauthenticated')
        .respond(401, {message: "Not Authenticated"});
  $httpBackend.whenGET('http://localhost:8100/notauthorized')
        .respond(403, {message: "Not Authorized"});

  $httpBackend.whenGET(/views\/\w+.*/).passThrough();
 })

.run(function ($rootScope, $state, AuthService, AUTH_EVENTS) {
  $rootScope.$on('$stateChangeStart', function (event,next, nextParams, fromState) {

    if ('data' in next && 'authorizedRoles' in next.data) {
      var authorizedRoles = next.data.authorizedRoles;
      if (!AuthService.isAuthorized(authorizedRoles)) {
        event.preventDefault();
        $state.go($state.current, {}, {reload: true});
        $rootScope.$broadcast(AUTH_EVENTS.notAuthorized);
      }
    }

    if (!AuthService.isAuthenticated()) {
      if (next.name !== 'login') {
        event.preventDefault();
        $state.go('login');
      }
    }
  });
});
