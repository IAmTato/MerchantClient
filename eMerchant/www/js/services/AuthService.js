'use strict';
app.service('AuthService', ['AuthIntf','$dwr','$q','$log', function(AuthIntf,dwr,$q, $log) {
   var userbean = null;
   return {
    login: /**
       *
       * @param name
       * @param pw
       * @returns {密码验证通过 返回用户数据，}
       */
      function(name, pw) {
          return $q(function(resolve, reject) {
              AuthIntf.login(name,pw).then(function(succ){
                  if(succ != null && succ.res == true ){
                      dwr.setTokenId(succ.token);
                      userbean = succ.data.userData;
                      window.localStorage.setItem('USER_BEAN',userbean);
                      resolve(succ.data.userData);
                  }else{
                      reject(succ);
                  }
              },function(err){
                  $log.error(err);
              });
          });
      },
    logout: function() {
        dwr.removeToken();
        window.localStorage.remove('USER_BEAN');
    },
    isAuthenticated: function() {
        var token = dwr.readToken();
        return token != null;
    },username:function(){
        if(userbean == null){
            userbean = window.localStorage.getItem('USER_BEAN');
            if(userbean == null)
                return null;
        }
        return userbean.userName;
    }
  };
}]);

//app.service('AuthService', ['$q', '$http', 'USER_ROLES',function($q, $http, USER_ROLES) {
//  var LOCAL_TOKEN_KEY = 'yourTokenKey';
//  var username = '';
//  var isAuthenticated = false;
//  var role = '';
//  var authToken;
//
//  function loadUserCredentials() {
//    var token = window.localStorage.getItem(LOCAL_TOKEN_KEY);
//    if (token) {
//      useCredentials(token);
//    }
//  }
//
//  function storeUserCredentials(token) {
//    window.localStorage.setItem(LOCAL_TOKEN_KEY, token);
//    useCredentials(token);
//  }
//
//  function useCredentials(token) {
//    username = token.split('.')[0];
//    isAuthenticated = true;
//    authToken = token;
//
//    if (username == 'admin') {
//      role = USER_ROLES.admin
//    }
//    if (username == 'user') {
//      role = USER_ROLES.public
//    }
//
//    // Set the token as header for your requests!
//    $http.defaults.headers.common['X-Auth-Token'] = token;
//  }
//
//  function destroyUserCredentials() {
//    authToken = undefined;
//    username = '';
//    isAuthenticated = false;
//    $http.defaults.headers.common['X-Auth-Token'] = undefined;
//    window.localStorage.removeItem(LOCAL_TOKEN_KEY);
//  }
//
//  var login = function(name, pw) {
//    return $q(function(resolve, reject) {
//      if ((name == 'admin' && pw == '1') || (name == 'user' && pw == '1')) {
//        // Make a request and receive your auth token from your server
//        storeUserCredentials(name + '.yourServerToken');
//        resolve('Login success.');
//      } else {
//        reject('Login Failed.');
//      }
//    });
//  };
//
//  var logout = function() {
//    destroyUserCredentials();
//  };
//
//  var isAuthorized = function(authorizedRoles) {
//    if (!angular.isArray(authorizedRoles)) {
//      authorizedRoles = [authorizedRoles];
//    }
//    return (isAuthenticated && authorizedRoles.indexOf(role) !== -1);
//  };
//
//  loadUserCredentials();
//
//  return {
//    login: login,
//    logout: logout,
//    isAuthorized: isAuthorized,
//    isAuthenticated: function() {return isAuthenticated;},
//    username: function() {return username;},
//    role: function() {return role;}
//  };
//}]);

