"use strict";
var app = angular.module('eMerchant', ['ionic', 'ngMockE2E', 'ngCordova', '$dwr', 'angular.filter']);

app.constant('DEV', false);
app.constant("ENV", {
    name: "eMerchant",
    accessToken: '',
    debug: false,
    appleId: 'xxxx',
    version: '0.0.1'
  })

  .constant('AUTH_EVENTS', {
    notAuthenticated: 'auth-not-authenticated',
    notAuthorized: 'auth-not-authorized'
  })
  .constant('USER_ROLES', {
    admin: 'admin_role',
    public: 'public_role'
  })
  .constant('DWR_SETTINGS', {
//        WEB_ROOT: 'http://192.168.11.38:8080/icbc/mo/emerchant/'
    WEB_ROOT: 'http://192.168.43.59:8080/icbc/mo/emerchant/'
  });
