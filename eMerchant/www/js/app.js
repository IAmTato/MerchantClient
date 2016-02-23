"use strict";
app.run(['$ionicPlatform', '$ionicActionSheet', '$timeout', '$cordovaAppVersion',
  '$ionicPopup', '$ionicLoading', '$cordovaFileTransfer', '$cordovaFile', '$cordovaZip',
  '$log', 'HsTpVersionControlManager', '$window',
    function ($ionicPlatform, $ionicActionSheet, $timeout, $cordovaAppVersion, $ionicPopup, $ionicLoading, $cordovaFileTransfer, $cordovaFile, $cordovaZip, $log, HsTpVersionControlManager, $window) {
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
            HsTpVersionControlManager.getNewestVersion().then(function(data){
              if (data != null && data.res == true) {
                console.log(data.data[0]);
                checkUpdate(data.data[0]);
              } else {
                $ionicPopup.alert({
                  title: "版本檢查",
                  template: "版本檢查失敗，請通知我行服務人員",
                  okText: "OK",
                  okType: "button-balanced"
                });
                $log.error(data);
              }
            },function(err){
              $ionicPopup.alert({
                title: "版本檢查",
                template: "版本檢查失敗，請通知我行服務人員",
                okText: "OK",
                okType: "button-balanced"
              });
              $log.error(err);
            })
            //checkUpdate();
        });
        // 检查更新
        function checkUpdate(data) {


            var serverAppVersion = data.version; //从服务端获取最新版本

            showUpdateConfirm(data);//开启登陆检查更新
            //获取本地版本
            $cordovaAppVersion.getAppVersion().then(function (version) {
                //如果本地与服务端的APP版本不符合
                if (version != serverAppVersion) {
                    //showUpdateConfirm(data);//开启登陆检查更新
                }
            });
        }

        // 显示是否更新对话框
        function showUpdateConfirm(data) {
            var confirmPopup = $ionicPopup.confirm({
                title: '版本升级 v' + data.version,
                template: data.updateInfo, //从服务端获取更新的内容
                cancelText: '取消',
                okText: '升级'
            });
            confirmPopup.then(function (res) {
                if (res) {
                    $ionicLoading.show({
                        template: "已经下载：0%"
                    });
                  var url = encodeURI(data.updatePath + "Version_Update/" + data.version + "/" + data.version + '.zip'); //可以从服务端获取更新APP的路径

                  //$cordovaFile.checkFile(encodeURI("/storage/emulated/0/wifi_config.log"),"").then(function(data){
                  //  $log.error(data)
                  //},function(err){
                  //  $log.error(err);
                  //});
                  $cordovaFile.checkDir("file:///","").then(function(data){
                    $log.error(data);
                  },function(err){
                    $log.error(err);
                  });
                  $cordovaFile.checkDir(cordova.file.cacheDirectory,"").then(function(data){
                    $log.error(data)
                  },function(err){
                    $log.error(err);
                  });
                  console.log(cordova.file.applicationStorageDirectory)
                  console.log(cordova.file.dataDirectory)
                  console.log(cordova.file.applicationDirectory)
                console.log(cordova.file.cacheDirectory);
                  var targetPath = "file:///storage/emulated/0/Download/" + data.version + '.zip'; //APP下载存放的路径，可以使用cordova file插件进行相关配置
                  var targetPath2 = "/storage/emulated/0/Download/" + data.version + '.zip'; //APP下载存放的路径，可以使用cordova file插件进行相关配置


                  var trustHosts = true;
                    var options = {};
                  $cordovaFileTransfer.download(url, targetPath, options, trustHosts).then(function (result) {
                        // 打开下载下来的APP
                        console.log('下载成功');
                        $cordovaZip.unzip("/storage/emulated/0/Download/" + data.version + '.zip', "/storage/emulated/0/Download/" + data.version + '/').then(function(){

                        console.log('解压成功');
                          $cordovaFile.checkDir(cordova.file.applicationDirectory, "").then(function(data){
                            $log.error(data)
                          },function(err){
                            $log.error(err);
                          });
                          $cordovaFile.checkFile(cordova.file.applicationDirectory + 'www/', "index.html").then(function(data){
                            $log.error(data)
                          },function(err){
                            $log.error(err);
                          });


                        }, function(err){
                          $log.error(err);
                        })

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


