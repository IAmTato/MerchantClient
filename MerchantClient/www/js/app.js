"use strict";
app.run(['$ionicPlatform', '$ionicActionSheet', '$timeout', '$cordovaAppVersion',
  '$ionicPopup', '$ionicLoading', '$cordovaFileTransfer', '$cordovaFile', '$cordovaZip',
  '$log', 'HsTpVersionControlManager', '$ionicAnalytics',
  function ($ionicPlatform, $ionicActionSheet, $timeout, $cordovaAppVersion, $ionicPopup, $ionicLoading,
            $cordovaFileTransfer, $cordovaFile, $cordovaZip, $log, HsTpVersionControlManager, $ionicAnalytics) {
    $ionicPlatform.ready(function () {

      $ionicAnalytics.register();

      // kick off the platform web client
      Ionic.io();

      // this will give you a fresh user or the previously saved 'current user'
      var user = Ionic.User.current();

      // if the user doesn't have an id, you'll need to give it one.
      if (!user.id) {
        user.id = Ionic.User.anonymousId();
        // user.id = 'your-custom-user-id';
      }

      //persist the user
      user.save();
      // Hide the accessory bar by default (remove this to show the accessory bar above the keyboard
      // for form inputs)
      if (window.cordova && window.cordova.plugins && window.cordova.plugins.Keyboard) {
        cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true);
        cordova.plugins.Keyboard.disableScroll(true);

        //延迟splash screnn 隐藏时间,不然会有短暂的白屏出现
        setTimeout(function () {
          navigator.splashscreen.hide();
        }, 200);
      }
      if (window.StatusBar) {
        // org.apache.cordova.statusbar required
        StatusBar.styleDefault();
      }

      //检测更新
      //从服务端获取最新版本
      checkUpdate();
    });
    // 检查更新
    function checkUpdate() {

      var deploy = new Ionic.Deploy();
      // Update app code with new release from Ionic Deploy
      console.log('Ionic Deploy: Checking for updates');
      deploy.check().then(function (hasUpdate) {
        console.log('Ionic Deploy: Update available: ' + hasUpdate);
        if (hasUpdate) {
          //有更新，获取更新信息
          HsTpVersionControlManager.getNewestVersion().then(function (data) {
            if (data != null && data.res == true) {
              //获取到版本信息的PropmtUp
              $ionicPopup.confirm({
                title: '版本升级 v' + data.data[0].version,
                template: data.data[0].updateInfo, //从服务端获取更新的内容
                cancelText: '取消',
                okText: '升级',
                cssClass: 'custom-popup' // this was the solve
              }).then(function (res) {
                if (res) {
                  processUpdate(deploy);
                } else {
                  console.log('取消更新');
                }
              });


            } else {
              //获取不到版本信息的PromptUp
              $ionicPopup.confirm({
                title: '版本升级',
                template: '有新版本可以升級！', //从服务端获取更新的内容
                cancelText: '取消',
                okText: '升级',
                cssClass: 'custom-popup' // this was the solve
              }).then(function (res) {
                if (res) {
                  processUpdate(deploy);
                } else {
                  console.log('取消更新');
                }
              });

            }
          }, function (err) {
            //获取不到版本信息的PromptUp
            $ionicPopup.confirm({
              title: '版本升级',
              template: '有新版本可以升級！', //从服务端获取更新的内容
              cancelText: '取消',
              okText: '升级',
              cssClass: 'custom-popup' // this was the solve
            }).then(function (res) {
              if (res) {
                processUpdate(deploy);
              } else {
                console.log('取消更新');
              }
            });
          })
        }
      }, function (err) {
        console.error('Ionic Deploy: Unable to check for updates', err);
      });
    }

    function processUpdate(deploy) {
      $ionicLoading.show({
        template: "開始下載：0%"
      });
      deploy.update().then(function (res) {
        console.log('Ionic Deploy: Update Success! ', res);
      }, function (err) {
        console.log('Ionic Deploy: Update error! ', err);
      }, function (prog) {
        console.log('Ionic Deploy: Progress... ', prog);
        $ionicLoading.show({
          template: "正在下載：" + Math.floor(prog) + "%"
        });
        if (prog > 99) {
          $ionicLoading.hide();
        }
      });
    };
  }])


app.run(function ($httpBackend) {
  $httpBackend.whenGET('http://localhost:8100/valid')
    .respond({message: 'This is my valid response!'});
  $httpBackend.whenGET('http://localhost:8100/notauthenticated')
    .respond(401, {message: "Not Authenticated"});
  $httpBackend.whenGET('http://localhost:8100/notauthorized')
    .respond(403, {message: "Not Authorized"});

  $httpBackend.whenGET(/views\/\w+.*/).passThrough();
})

app.run(function ($rootScope, $state, AuthService, AUTH_EVENTS) {
  $rootScope.$on('$stateChangeStart', function (event, next, nextParams, fromState) {
//
//        if ('data' in next && 'authorizedRoles' in next.data) {
//            var authorizedRoles = next.data.authorizedRoles;
//            if (!AuthService.isAuthorized(authorizedRoles)) {
//                event.preventDefault();
//                $state.go($state.current, {}, {reload: true});
//                $rootScope.$broadcast(AUTH_EVENTS.notAuthorized);
//            }
//        }

    if (!AuthService.isAuthenticated()) {
      if (next.name !== 'login') {
        event.preventDefault();
        $state.go('login');
      }
    }
  });
});

//手机返回按键处理
app.run(['$ionicPlatform', '$rootScope', '$location', '$ionicHistory', '$ionicPopup',
  function ($ionicPlatform, $rootScope, $location, $ionicHistory, $ionicPopup) {
    //主页面显示退出提示框
    $ionicPlatform.registerBackButtonAction(function (event) {
      event.preventDefault();

      if ($location.path() == 'main') {
        showConfirm();
      } else if ($ionicHistory.backView()) {
        $ionicHistory.goBack();
      } else {
        showConfirm();
      }

      function showConfirm() {
        var confirmPopup = $ionicPopup.confirm({
          title: '<strong>退出应用?</strong>',
          template: '确定要退出应用?',
          okText: '退出',
          cancelText: '取消'
        });

        confirmPopup.then(function (res) {
          if (res) {
            ionic.Platform.exitApp();
          }
        });
      }

      return false;
    }, 101);
  }]);

app.config(['$dwrProvider', 'DWR_SETTINGS',
  function ($dwrProvider, DWR_SETTINGS) {
    $dwrProvider.setWebRootPath(DWR_SETTINGS.WEB_ROOT);
  }]);


