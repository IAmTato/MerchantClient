"use strict";
app.run(['$ionicPlatform', '$ionicActionSheet', '$timeout', '$cordovaAppVersion',
  '$ionicPopup', '$ionicLoading', '$cordovaFileTransfer', '$cordovaFile', '$cordovaZip',
  '$log', 'HsTpVersionControlManager',
    function ($ionicPlatform, $ionicActionSheet, $timeout, $cordovaAppVersion, $ionicPopup, $ionicLoading, $cordovaFileTransfer, $cordovaFile, $cordovaZip, $log, HsTpVersionControlManager) {
        $ionicPlatform.ready(function () {
            // Hide the accessory bar by default (remove this to show the accessory bar above the keyboard
            // for form inputs)
            if (window.cordova && window.cordova.plugins && window.cordova.plugins.Keyboard) {
                cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true);
                cordova.plugins.Keyboard.disableScroll(true);

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
          deploy.check().then(function(hasUpdate) {
            console.log('Ionic Deploy: Update available: ' + hasUpdate);
            if(hasUpdate){
              //有更新，获取更新信息
              HsTpVersionControlManager.getNewestVersion().then(function(data){
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
              },function(err){
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
          }, function(err) {
            console.error('Ionic Deploy: Unable to check for updates', err);
          });


        }

        function processUpdate(deploy){
          $ionicLoading.show({
            template: "開始下載：0%"
          });
          deploy.update().then(function(res) {
            console.log('Ionic Deploy: Update Success! ', res);
          }, function(err) {
            console.log('Ionic Deploy: Update error! ', err);
          }, function(prog) {
            console.log('Ionic Deploy: Progress... ', prog);
            $ionicLoading.show({
              template: "正在下載：" + Math.floor(prog) + "%"
            });
            if (prog > 99) {
              $ionicLoading.hide();
            }
          });
        };
        // 显示是否更新对话框
        function showUpdateConfirm(data) {
            var confirmPopup = $ionicPopup.confirm({
                title: '版本升级 v' + data.version,
                template: data.updateInfo, //从服务端获取更新的内容
                cancelText: '取消',
                okText: '升级',
              cssClass: 'custom-popup' // this was the solve
            });
            confirmPopup.then(function (res) {
                if (res) {

                } else {
                    console.log('取消更新');
                }
            });
        }
    }])


/* 增量更新的cordovaAppLoader，不过验证失败
function handleVisibilityChange() {
  if (!document.webkitHidden) {
    check();
  }
}
function cordovaAppLoader(){
  $ionicLoading.show({
    template: "开始更新"
  });
  console.log("开始检查");

  // Check for Cordova
  var isCordova = typeof cordova !== 'undefined',
  // CordovaPromiseFS
    fs,
  // CordovaFileLoader
    loader,
  // script-tag...
    script,
  // ...that contains the serverRoot
    serverRoot;

  // Get serverRoot from script tag.
  script = document.querySelector('script[server]');
  if(script) serverRoot= script.getAttribute('server');
  if(!serverRoot) {
    throw new Error('Add a "server" attribute to the bootstrap.js script!');
  }

  // Initialize filesystem and loader
  fs = new CordovaPromiseFS({
    persistent: isCordova, // Chrome should use temporary storage.
    Promise: Promise
  });

  var loader = new CordovaAppLoader({
    fs: fs,
    serverRoot: serverRoot,
    localRoot: 'app',
    cacheBuster: true, // make sure we're not downloading cached files.
    checkTimeout: 10000 // timeout for the "check" function - when you loose internet connection
  });

  //1. On launch
  //Check > Download > Update

  loader.check('http://192.168.43.187:8080/icbc/mo/emerchant/Version_Update/manifest.json').then(function(){
    console.log("开始下载");
      loader.download().then(function(){
        console.log("开始更新");
        console.log("Update BOOTSTRAP_OK = true")
        window.BOOTSTRAP_OK = true;
        loader.update().then(function(){
          $ionicPopup.alert({
            title: '軟件更新',
            template: "更新成功"
          });
        })
        window.BOOTSTRAP_OK = true;
      }, function(err){
        console.log("更新失败");
        $log.error(err);
      })
  });
  $ionicLoading.hide();
  // 2. Cordova: On resume
  fs.deviceready.then(function(){
    document.addEventListener('resume',check);
  });
  // 3. Chrome: On page becomes visible again
  document.addEventListener("webkitvisibilitychange", handleVisibilityChange, false);

  //  var url = encodeURI(data.updatePath + "Version_Update/" + data.version + "/" + data.version + '.zip'); //可以从服务端获取更新APP的路径
  //  $cordovaFile.checkDir("file:///","").then(function(data){
  //    $log.error(data);
  //  },function(err){
  //    $log.error(err);
  //  });
  //  $cordovaFile.checkDir(cordova.file.cacheDirectory,"").then(function(data){
  //    $log.error(data)
  //  },function(err){
  //    $log.error(err);
  //  });
  //  console.log(cordova.file.applicationStorageDirectory)
  //  console.log(cordova.file.dataDirectory)
  //  console.log(cordova.file.applicationDirectory)
  //console.log(cordova.file.cacheDirectory);
  //  var targetPath = "file:///storage/emulated/0/Download/" + data.version + '.zip'; //APP下载存放的路径，可以使用cordova file插件进行相关配置
  //  var targetPath2 = "/storage/emulated/0/Download/" + data.version + '.zip'; //APP下载存放的路径，可以使用cordova file插件进行相关配置
  //  var unzipPath = "/storage/emulated/0/Download/" + data.version + '/';
  //
  //  var trustHosts = true;
  //    var options = {};
  //  $cordovaFileTransfer.download(url, targetPath, options, trustHosts).then(function (result) {
  //        // 打开下载下来的APP
  //        console.log('下载成功');
  //        $cordovaZip.unzip("/storage/emulated/0/Download/" + data.version + '.zip', unzipPath).then(function(){
  //
  //          console.log('解压成功');
  //          $cordovaFile.checkDir(cordova.file.applicationDirectory, "").then(function(data){
  //            $log.error(data)
  //          },function(err){
  //            $log.error(err);
  //          });
  //          $cordovaFile.checkFile(cordova.file.applicationDirectory + 'www/', "index.html").then(function(data){
  //            $log.error(data)
  //          },function(err){
  //            $log.error(err);
  //          });
  //          $cordovaFile.copyDir(unzipPath, cordova.file.applicationDirectory + 'www/').then(function(data){
  //            $log.error(data)
  //          },function(err){
  //            $log.error(err);
  //          });
  //
  //        }, function(err){
  //          alert('解压失败');
  //          $log.error(err);
  //        })
  //
  //        $ionicLoading.hide();
  //    }, function (err) {
  //        alert('下载失败');
  //    }, function (progress) {
  //        //进度，这里使用文字显示下载百分比
  //        $timeout(function () {
  //            var downloadProgress = (progress.loaded / progress.total) * 100;
  //            $ionicLoading.show({
  //                template: "已经下载：" + Math.floor(downloadProgress) + "%"
  //            });
  //            if (downloadProgress > 99) {
  //                $ionicLoading.hide();
  //            }
  //        })
  //    });

};*/

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
app.run(['$ionicPlatform', '$ionicPopup', '$rootScope', '$location',
    function ($ionicPlatform, $ionicPopup, $rootScope, $location) {
        //主页面显示退出提示框
        $ionicPlatform.registerBackButtonAction(function (event) {
            event.preventDefault();

            // Is there a page to go back to?
            if ($location.path() == 'main') {
                showConfirm();
            } else if ($rootScope.$viewHistory.backView) {
                console.log('currentView:', $rootScope.$viewHistory.currentView);
                // Go back in history
                $rootScope.$viewHistory.backView.go();
            } else {
                // This is the last page: Show confirmation popup
                showConfirm();
            }

            function showConfirm() {
                var confirmPopup = $ionicPopup.confirm({
                    title: '<strong>退出应用?</strong>',
                    template: '你确定要退出应用吗?',
                    okText: '退出',
                    cancelText: '取消'
                });

                confirmPopup.then(function (res) {
                    if (res) {
                        ionic.Platform.exitApp();
                    } else {
                        // Don't close
                    }
                });
            }

            return false;
        }, 101);
    }]);

app.config(['$dwrProvider','DWR_SETTINGS',
    function ($dwrProvider,DWR_SETTINGS) {
        $dwrProvider.setWebRootPath(DWR_SETTINGS.WEB_ROOT);
    }]);


