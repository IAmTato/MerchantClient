"use strict";
angular.module("$dwr")
.service("HsTrMasterOrderManager", ["$dwr", function (dwr) {
var p = this;
(function () {
  if (dwr.engine._getObject("HsTrMasterOrderManager") == undefined) {
    
    p = {};
var cn = "HsTrMasterOrderManager";
    p.getDeliverOrder = function(cb) {
      return dwr.$qcall.call(p,cn,'getDeliverOrder', arguments,cb);
    };
p.getDeliverOrder.className = cn;
p.getDeliverOrder.methodName = "getDeliverOrder";
    p.createHsTrMasterOrder = function(p0, cb) {
      return dwr.$qcall.call(p,cn,'createHsTrMasterOrder', arguments,cb);
    };
p.createHsTrMasterOrder.className = cn;
p.createHsTrMasterOrder.methodName = "createHsTrMasterOrder";
    p.deleteHsTrMasterOrder = function(p0, cb) {
      return dwr.$qcall.call(p,cn,'deleteHsTrMasterOrder', arguments,cb);
    };
p.deleteHsTrMasterOrder.className = cn;
p.deleteHsTrMasterOrder.methodName = "deleteHsTrMasterOrder";
    p.updateHsTrMasterOrder = function(p0, cb) {
      return dwr.$qcall.call(p,cn,'updateHsTrMasterOrder', arguments,cb);
    };
p.updateHsTrMasterOrder.className = cn;
p.updateHsTrMasterOrder.methodName = "updateHsTrMasterOrder";
    p.getNewHsTrMasterOrder = function(cb) {
      return dwr.$qcall.call(p,cn,'getNewHsTrMasterOrder', arguments,cb);
    };
p.getNewHsTrMasterOrder.className = cn;
p.getNewHsTrMasterOrder.methodName = "getNewHsTrMasterOrder";
    p.getHsTrMasterOrder = function(cb) {
      return dwr.$qcall.call(p,cn,'getHsTrMasterOrder', arguments,cb);
    };
p.getHsTrMasterOrder.className = cn;
p.getHsTrMasterOrder.methodName = "getHsTrMasterOrder";
    p.findHsTrMasterOrderByOrderId = function(p0, cb) {
      return dwr.$qcall.call(p,cn,'findHsTrMasterOrderByOrderId', arguments,cb);
    };
p.findHsTrMasterOrderByOrderId.className = cn;
p.findHsTrMasterOrderByOrderId.methodName = "findHsTrMasterOrderByOrderId";
    p.setEntityManagerFactory = function(p0, cb) {
      return dwr.$qcall.call(p,cn,'setEntityManagerFactory', arguments,cb);
    };
p.setEntityManagerFactory.className = cn;
p.setEntityManagerFactory.methodName = "setEntityManagerFactory";
    
    dwr.engine._setObject("HsTrMasterOrderManager", p);
  }
})();
return p;
}]);

