"use strict";
angular.module("$dwr")
.service("HsTrMasterOrderManager", ["$dwr", function (dwr) {
var p = this;
(function () {
  if (dwr.engine._getObject("HsTrMasterOrderManager") == undefined) {
    
    p = {};
var cn = "HsTrMasterOrderManager";
    p.setEntityManagerFactory = function(p0, cb) {
      return dwr.$qcall.call(p,cn,'setEntityManagerFactory', arguments,cb);
    };
p.setEntityManagerFactory.className = cn;
p.setEntityManagerFactory.methodName = "setEntityManagerFactory";
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
    p.updateDeliverOrder = function(p0, cb) {
      return dwr.$qcall.call(p,cn,'updateDeliverOrder', arguments,cb);
    };
p.updateDeliverOrder.className = cn;
p.updateDeliverOrder.methodName = "updateDeliverOrder";
    p.restoreDeliverOrder = function(p0, cb) {
      return dwr.$qcall.call(p,cn,'restoreDeliverOrder', arguments,cb);
    };
p.restoreDeliverOrder.className = cn;
p.restoreDeliverOrder.methodName = "restoreDeliverOrder";
    p.findHsTrMasterOrderByOrderId = function(p0, cb) {
      return dwr.$qcall.call(p,cn,'findHsTrMasterOrderByOrderId', arguments,cb);
    };
p.findHsTrMasterOrderByOrderId.className = cn;
p.findHsTrMasterOrderByOrderId.methodName = "findHsTrMasterOrderByOrderId";
    
    dwr.engine._setObject("HsTrMasterOrderManager", p);
  }
})();
return p;
}]);

