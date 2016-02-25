"use strict";
angular.module("$dwr")
.service("ViewMasterOrderManager", ["$dwr", function (dwr) {
var p = this;
(function () {
  if (dwr.engine._getObject("ViewMasterOrderManager") == undefined) {
    
    p = {};
var cn = "ViewMasterOrderManager";
    p.main = function(p0, cb) {
      return dwr.$qcall.call(p,cn,'main', arguments,cb);
    };
p.main.className = cn;
p.main.methodName = "main";
    p.findViewMasterOrderByOrderId = function(p0, cb) {
      return dwr.$qcall.call(p,cn,'findViewMasterOrderByOrderId', arguments,cb);
    };
p.findViewMasterOrderByOrderId.className = cn;
p.findViewMasterOrderByOrderId.methodName = "findViewMasterOrderByOrderId";
    p.getTodayFinishedOrderCount = function(cb) {
      return dwr.$qcall.call(p,cn,'getTodayFinishedOrderCount', arguments,cb);
    };
p.getTodayFinishedOrderCount.className = cn;
p.getTodayFinishedOrderCount.methodName = "getTodayFinishedOrderCount";
    p.setEntityManagerFactory = function(p0, cb) {
      return dwr.$qcall.call(p,cn,'setEntityManagerFactory', arguments,cb);
    };
p.setEntityManagerFactory.className = cn;
p.setEntityManagerFactory.methodName = "setEntityManagerFactory";
    p.createViewMasterOrder = function(p0, cb) {
      return dwr.$qcall.call(p,cn,'createViewMasterOrder', arguments,cb);
    };
p.createViewMasterOrder.className = cn;
p.createViewMasterOrder.methodName = "createViewMasterOrder";
    p.deleteViewMasterOrder = function(p0, cb) {
      return dwr.$qcall.call(p,cn,'deleteViewMasterOrder', arguments,cb);
    };
p.deleteViewMasterOrder.className = cn;
p.deleteViewMasterOrder.methodName = "deleteViewMasterOrder";
    p.updateViewMasterOrder = function(p0, cb) {
      return dwr.$qcall.call(p,cn,'updateViewMasterOrder', arguments,cb);
    };
p.updateViewMasterOrder.className = cn;
p.updateViewMasterOrder.methodName = "updateViewMasterOrder";
    p.getNewViewMasterOrder = function(cb) {
      return dwr.$qcall.call(p,cn,'getNewViewMasterOrder', arguments,cb);
    };
p.getNewViewMasterOrder.className = cn;
p.getNewViewMasterOrder.methodName = "getNewViewMasterOrder";
    p.getViewMasterOrder = function(cb) {
      return dwr.$qcall.call(p,cn,'getViewMasterOrder', arguments,cb);
    };
p.getViewMasterOrder.className = cn;
p.getViewMasterOrder.methodName = "getViewMasterOrder";
    p.getDayWholePointDate = function(p0, cb) {
      return dwr.$qcall.call(p,cn,'getDayWholePointDate', arguments,cb);
    };
p.getDayWholePointDate.className = cn;
p.getDayWholePointDate.methodName = "getDayWholePointDate";
    p.getTodayFinishedOrder = function(cb) {
      return dwr.$qcall.call(p,cn,'getTodayFinishedOrder', arguments,cb);
    };
p.getTodayFinishedOrder.className = cn;
p.getTodayFinishedOrder.methodName = "getTodayFinishedOrder";
    p.getTodayFinishedOrder2 = function(cb) {
      return dwr.$qcall.call(p,cn,'getTodayFinishedOrder2', arguments,cb);
    };
p.getTodayFinishedOrder2.className = cn;
p.getTodayFinishedOrder2.methodName = "getTodayFinishedOrder2";
    p.getDeliverOrder = function(cb) {
      return dwr.$qcall.call(p,cn,'getDeliverOrder', arguments,cb);
    };
p.getDeliverOrder.className = cn;
p.getDeliverOrder.methodName = "getDeliverOrder";
    
    dwr.engine._setObject("ViewMasterOrderManager", p);
  }
})();
return p;
}]);

