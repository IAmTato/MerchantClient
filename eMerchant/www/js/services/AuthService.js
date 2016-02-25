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
                      dwr.setTokenId(succ.data.token);
                      userbean = succ.data.userData;
                      window.localStorage.setItem('USER_BEAN', angular.toJson(userbean));
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
        window.localStorage.removeItem('USER_BEAN');
    },
    isAuthenticated: function() {
        var token = dwr.readToken();
        return token != null;
    },username:function(){
        if(userbean == null){
            try{
                userbean =angular.fromJson( window.localStorage.getItem('USER_BEAN'));
            }catch (e){
                
            }
            if(userbean == null)
                return null;
        }
        return userbean.userName;
    }
  };
}]);
