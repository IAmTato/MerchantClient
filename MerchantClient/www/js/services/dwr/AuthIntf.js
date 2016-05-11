"use strict";
angular.module("$dwr")
.service("AuthIntf", ["$dwr", function (dwr) {
var p = this;
(function () {
  if (dwr.engine._getObject("AuthIntf") == undefined) {
    
    p = {};
var cn = "AuthIntf";
      /**
       *
       * @param p0
       * @param p1
       * @param cb
       * @returns {
  authErr:false,
  data:{
    createTime:null,
    phone:"1222",
    storeUser:"100",
    token:"vWr7fMd8S2yvavt8x3xLbA==",
    userData:{
      createDate:null,
      createId:null,
      dayErrSum:null,
      email:"432@wrer.com",
       errDate:null,
       firstStatue:"0",
       id:"100",
       orgId:"2",
       passWord:"100",
       phone:"1222",
       sessionId:"2",
       totalErrSum:null,
       updateDate:null,
       updateId:null,
       userAlias:"432",
       userAliasEncrypt:"34243",
       userName:"100",
       userNameEncrypt:"12314",
       userStatus:"1",
       userType:"4"
       }
       },
       errMsg:null,
       res:true,
       trace:null
       }
       */

    p.login = function(p0, p1, cb) {
      return dwr.$qcall.call(p,cn,'login', arguments,cb);
    };
p.login.className = cn;
p.login.methodName = "login";
    
    dwr.engine._setObject("AuthIntf", p);
  }
})();
return p;
}]);

