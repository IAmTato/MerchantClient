"use strict";
app.config(function ($stateProvider, $urlRouterProvider, USER_ROLES) {
  $stateProvider
  //菜单栏
  .state('main', {
    url: '/',
    abstract: true,
    templateUrl: 'views/main.html'
  })
//-----------------------------------------------------------------------
  //登录
  .state('login', {
    url: '/login',
    templateUrl: 'views/login.html',
    controller: 'LoginCtrl'
  })
  //忘记密码
    .state('forgetpassword', {
      url: '/forgetpassword',
      templateUrl: 'views/forgetpassword.html',
      controller: 'LoginCtrl'
    })
//----------------------------------------------------------------------
// 首页
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
//订单列表
  .state('main.orders', {
    url: 'main/orders',
    cache:'false',
    views: {
        'orders-tab': {
          templateUrl: 'views/orders.html'
        }
    }
  })
  //订单金额确认
  .state('main.orders-waitpay', {
    url: 'main/orders-waitpay',
    cache:'false',
    views: {
      'orders-tab': {
        templateUrl: 'views/orders-waitpay.html',
        controller:"OrderCtrl"
      }
    }
  })
  //订单金额确认
  .state('main.orders-payconfirm', {
    url: 'main/orders-payconfirm/:qrcodeId',
    cache:'false',
    views: {
      'orders-tab': {
        templateUrl: 'views/orders-payconfirm.html',
        controller:"OrderCtrl"
      }
    }
  })
//-----------------------------------------------------------------------
  //个人信息
  .state('main.my', {
    url: 'main/my',
    views: {
      'my-tab': {
        templateUrl: 'views/my.html',
        controller: 'MyCtrl'
      }
    }
  })
//-----------------------------------------------------------------------
  .state('main.notice', {
    url: 'main/notice',
    views: {
        'notice-tab': {
         templateUrl: 'views/notice.html',
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
    cache:'false',
    views: {
      'dash-tab': {
        templateUrl: 'views/deliverGoods-main.html',
        controller:"DeliverGoodsCtrl"
      }
    }
  })

  //-----------------------------------------------------------------------
  //送货页面 By Vincent
  .state('main.assignGoodsMain', {
    url: 'main/assignGoodsMain',
    cache:'false',
    views: {
      'orders-tab': {
        templateUrl: 'views/assignGoods-main.html',
        controller:'AssignGoodsCtrl'
      }
    }
  });

  $urlRouterProvider.otherwise('main/dash');
});
