"use strict";
app.config(function ($stateProvider, $urlRouterProvider, USER_ROLES) {
  $stateProvider
  //菜单栏
    .state('main', {
      url: '/',
      abstract: true,
      templateUrl: './views/main.html'
    })
    //-----------------------------------------------------------------------
    //登录
    .state('login', {
      url: '/login',
      templateUrl: './views/login.html',
      controller: 'LoginCtrl'
    })
    //忘记密码
    .state('forgetpassword', {
      url: '/forgetpassword',
      templateUrl: './views/forgetpassword.html',
      controller: 'LoginCtrl'
    })
    //----------------------------------------------------------------------
    // 首页
    .state('main.dash', {
      url: 'main/dash',
      cache: 'false',
      views: {
        'dash-tab': {
          templateUrl: './views/dashboard.html',
          controller: 'DashCtrl'
        }
      }
    })
    //-----------------------------------------------------------------------
    //订单列表
    .state('main.orders', {
      url: 'main/orders',
      cache: 'false',
      views: {
        'orders-tab': {
          templateUrl: './views/order/orders.html'
        }
      }
    })
    //订单详情
    .state('main.orderDetail', {
      url: 'main/orderDetail',
      cache: 'false',
      params: {orderId: null},
      views: {
        'dash-tab': {
          templateUrl: './views/order/orderDetail.html'
        }
      }
    })
    //-----------------------------------------------------------------------
    //支付成功
    .state('main.paysuccess', {
      url: 'main/paysuccess',
      cache: 'false',
      views: {
        'dash-tab': {
          templateUrl: './views/qr/paysuccess.html',
          controller: "QrCodeCtrl"
        }
      }
    })
    //支付失败
    .state('main.payfail', {
      url: 'main/payfail',
      cache: 'false',
      views: {
        'dash-tab': {
          templateUrl: './views/qr/payfail.html',
          controller: "QrCodeCtrl"
        }
      }
    })
    //-----------------------------------------------------------------------
    //扫码金额确认
    .state('main.payconfirm', {
      url: 'main/payconfirm',
      //cache: 'false',
      params: {qrcodeId: null},
      views: {
        'dash-tab': {
          templateUrl: './views/qr/payconfirm.html',
          controller: "QrCodeCtrl"
        }
      }
    })
    //-----------------------------------------------------------------------
    //个人信息
    .state('main.my', {
      url: 'main/my',
      views: {
        'my-tab': {
          templateUrl: './views/my.html',
          controller: 'MyCtrl'
        }
      }
    })
    //-----------------------------------------------------------------------
    .state('main.notice', {
      url: 'main/notice',
      views: {
        'notice-tab': {
          templateUrl: './views/notice.html',
          controller: 'NoticeCtrl'
        }
      },
      data: {
        authorizedRoles: [USER_ROLES.admin]
      }
    })

    //-----------------------------------------------------------------------
    //送货页面 By Tato
    .state('main.deliverGoodsMain', {
      url: 'main/deliverGoodsMain',
      cache: 'false',
      views: {
        'dash-tab': {
          templateUrl: './views/deliverGoods-main.html',
          controller: "DeliverGoodsCtrl"
        }
      }
    })

    //-----------------------------------------------------------------------
        //今日订单页面 By Tato
      .state('main.todayOrder', {
        url: 'main/todayOrder',
        cache: 'false',
        views: {
          'dash-tab': {
            templateUrl: './views/todayOrder.html',
            controller: "TodayOrderCtrl"
          }
        }
      })

        //-----------------------------------------------------------------------
    //送货页面 By Vincent
    .state('main.assignGoodsMain', {
      url: 'main/assignGoodsMain',
      cache: 'false',
      views: {
        'dash-tab': {
          templateUrl: './views/assignGoods-main.html',
          controller: 'AssignGoodsCtrl'
        }
      }
    });

  $urlRouterProvider.otherwise('main/dash');
});
