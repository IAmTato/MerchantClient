/**
 * Created by xiongfeizhao on 17/2/2016.
 */
'use strict';
app.controller('AssignGoodsCtrl', ['$scope', '$state', 'ViewMasterOrderManager', '$timeout', '$ionicPopup', 'AuthService', '$log', '$ionicLoading', '$ionicActionSheet',
  function ($scope, $state, ViewMasterOrderManager, $timeout, $ionicPopup, AuthService, $log, $ionicLoading, $ionicActionSheet) {

    //读取数据
    getUnassignedOrders();

    //下拉刷新数据
    $scope.doRefresh = function () {
      getUnassignedOrders();
      $scope.$broadcast('scroll.refreshComplete');
    };

    //登出方法
    $scope.logout = function () {
      AuthService.logout();
      $state.go('login');
    };

    //点击订单并输入送货员手机号
    function inputDeliverMobile(data) {
      var confirmPopup = $ionicPopup.confirm({
        title: '確認訂單:' + data.orderId,
        template: '货到付款订单，请确认已收到款项。',
        cssClass: 'custom-popup' // this was the solve
      });

      confirmPopup.then(function (res) {
        if (res) {
          //console.log('You are sure');

          DeliverIntf.finishOrder(data.orderId, data.realAmount).then(function (succ) {
//          HsTrMasterOrderManager.updateDeliverOrder(data.orderId).then(function (succ) {
            if (succ != null && succ.res == true) {
              $ionicPopup.alert({
                title: "完成訂單",
                template: succ.errMsg,
                okText: "OK",
                okType: "button-balanced"
              });
              refresh();
            } else {
              $ionicPopup.alert({
                title: "完成訂單",
                template: succ.errMsg,
                okText: "OK",
                okType: "button-balanced"
              });
              $log.error(succ);
            }
          }, function (err) {
            $log.error(err);
          });

        } else {
          console.log('You are not sure');
        }
      });
    };

    //点击订单显示下方model菜单
    $scope.showActionSheet = function (data) {
      // Show the action sheet:
      $ionicActionSheet.show({
        buttons: [{
          text: '<i class="icon ion-android-document dark"></i><div class="dark">訂單詳情</div>'
        }, {
          text: '<i class="icon ion-social-usd eMerchanColor-font-red"></i><div class="eMerchanColor-font-red">確認已收款</div>'
        }],
        cancelText: '取消',
        cancel: function () {
          return true;
        },
        buttonClicked: function (index, buttonObj) {
          switch (index) {
            case 0:
              alert("訂單詳情");
              //return false代表不自动收回，return true代表自动收回
              return true;
            case 1:
              //alert("完成訂單");
              inputDeliverMobile(data);
              return true;
          }
        }
      });
    };

    //获取未分配订单数据
    function getUnassignedOrders() {
      ViewMasterOrderManager.getDeliverOrder().then(function (succ) {
        if (succ != null && succ.res == true) {
          $scope.fullList = succ.data;
          console.log(succ.data);
        } else {
          $log.error(succ);
        }
      }, function (err) {
        $log.error(err);
      }, function (progress) {
        //连接超时提示
        $timeout(function () {
          if (!loginStatus) {
            $ionicPopup.alert({
              title: '連接超時',
              template: "獲取訂單數據失敗"
            });
          }
        }, 30000);
      });
    };

  }]);

app.directive('hideTabBar', function ($timeout) {
  var style = angular.element('<style>').html(
    '.has-tabs.no-tabs:not(.has-tabs-top) { bottom: 0; }\n' +
    '.no-tabs.has-tabs-top { top: 44px; }');
  document.body.appendChild(style[0]);
  return {
    restrict: 'A',
    compile: function (element, attr) {
      var tabBar = document.querySelector('.tab-nav');
      return function ($scope, $element, $attr) {
        var scroll = $element[0].querySelector('.scroll-content');
        $scope.$on('$ionicView.beforeEnter', function () {
          tabBar.classList.add('slide-away');
          scroll.classList.add('no-tabs');
        })
        $scope.$on('$ionicView.beforeLeave', function () {
          tabBar.classList.remove('slide-away');
          scroll.classList.remove('no-tabs')
        });
      }
    }
  };
});
