"use strict";
angular.module("$dwr")
.service("DeliverIntf", ["$dwr", function (dwr) {
var p = this;
(function () {
  if (dwr.engine._getObject("DeliverIntf") == undefined) {
    
    p = {};
var cn = "DeliverIntf";
    p.addDeliver = function(p0, cb) {
      return dwr.$qcall.call(p,cn,'addDeliver', arguments,cb);
    };
p.addDeliver.className = cn;
p.addDeliver.methodName = "addDeliver";
    p.handoverDeliver = function(cb) {
      return dwr.$qcall.call(p,cn,'handoverDeliver', arguments,cb);
    };
p.handoverDeliver.className = cn;
p.handoverDeliver.methodName = "handoverDeliver";
    p.getDeliver = function(cb) {
      return dwr.$qcall.call(p,cn,'getDeliver', arguments,cb);
    };
p.getDeliver.className = cn;
p.getDeliver.methodName = "getDeliver";
    p.finishOrder = function(p0, p1, cb) {
      return dwr.$qcall.call(p,cn,'finishOrder', arguments,cb);
    };
p.finishOrder.className = cn;
p.finishOrder.methodName = "finishOrder";
    p.assignOrder = function(p0, p1, cb) {
      return dwr.$qcall.call(p,cn,'assignOrder', arguments,cb);
    };
p.assignOrder.className = cn;
p.assignOrder.methodName = "assignOrder";
    
    dwr.engine._setObject("DeliverIntf", p);
  }
})();
return p;
}]);

