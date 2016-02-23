"use strict";
angular.module("$dwr")
.service("HsTrStoreDetailManager", ["$dwr", function (dwr) {
var p = this;
(function () {
  if (dwr.engine._getObject("HsTrStoreDetailManager") == undefined) {
    
    p = {};
var cn = "HsTrStoreDetailManager";
    p.setEntityManagerFactory = function(p0, cb) {
      return dwr.$qcall.call(p,cn,'setEntityManagerFactory', arguments,cb);
    };
p.setEntityManagerFactory.className = cn;
p.setEntityManagerFactory.methodName = "setEntityManagerFactory";
    p.createHsTrStoreDetail = function(p0, cb) {
      return dwr.$qcall.call(p,cn,'createHsTrStoreDetail', arguments,cb);
    };
p.createHsTrStoreDetail.className = cn;
p.createHsTrStoreDetail.methodName = "createHsTrStoreDetail";
    p.deleteHsTrStoreDetail = function(p0, cb) {
      return dwr.$qcall.call(p,cn,'deleteHsTrStoreDetail', arguments,cb);
    };
p.deleteHsTrStoreDetail.className = cn;
p.deleteHsTrStoreDetail.methodName = "deleteHsTrStoreDetail";
    p.updateHsTrStoreDetail = function(p0, cb) {
      return dwr.$qcall.call(p,cn,'updateHsTrStoreDetail', arguments,cb);
    };
p.updateHsTrStoreDetail.className = cn;
p.updateHsTrStoreDetail.methodName = "updateHsTrStoreDetail";
    p.findHsTrStoreDetailByStoreId = function(p0, cb) {
      return dwr.$qcall.call(p,cn,'findHsTrStoreDetailByStoreId', arguments,cb);
    };
p.findHsTrStoreDetailByStoreId.className = cn;
p.findHsTrStoreDetailByStoreId.methodName = "findHsTrStoreDetailByStoreId";
    p.getNewHsTrStoreDetail = function(cb) {
      return dwr.$qcall.call(p,cn,'getNewHsTrStoreDetail', arguments,cb);
    };
p.getNewHsTrStoreDetail.className = cn;
p.getNewHsTrStoreDetail.methodName = "getNewHsTrStoreDetail";
    p.getHsTrStoreDetailByUser = function(cb) {
      return dwr.$qcall.call(p,cn,'getHsTrStoreDetailByUser', arguments,cb);
    };
p.getHsTrStoreDetailByUser.className = cn;
p.getHsTrStoreDetailByUser.methodName = "getHsTrStoreDetailByUser";
    
    dwr.engine._setObject("HsTrStoreDetailManager", p);
  }
})();
return p;
}]);

