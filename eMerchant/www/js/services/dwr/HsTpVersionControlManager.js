"use strict";
angular.module("$dwr")
.service("HsTpVersionControlManager", ["$dwr", function (dwr) {
var p = this;
(function () {
  if (dwr.engine._getObject("HsTpVersionControlManager") == undefined) {
    
    p = {};
var cn = "HsTpVersionControlManager";
    p.setEntityManagerFactory = function(p0, cb) {
      return dwr.$qcall.call(p,cn,'setEntityManagerFactory', arguments,cb);
    };
p.setEntityManagerFactory.className = cn;
p.setEntityManagerFactory.methodName = "setEntityManagerFactory";
    p.getNewestVersion = function(cb) {
      return dwr.$qcall.call(p,cn,'getNewestVersion', arguments,cb);
    };
p.getNewestVersion.className = cn;
p.getNewestVersion.methodName = "getNewestVersion";
    p.findHsTpVersionControlById = function(p0, cb) {
      return dwr.$qcall.call(p,cn,'findHsTpVersionControlById', arguments,cb);
    };
p.findHsTpVersionControlById.className = cn;
p.findHsTpVersionControlById.methodName = "findHsTpVersionControlById";
    p.createHsTpVersionControl = function(p0, cb) {
      return dwr.$qcall.call(p,cn,'createHsTpVersionControl', arguments,cb);
    };
p.createHsTpVersionControl.className = cn;
p.createHsTpVersionControl.methodName = "createHsTpVersionControl";
    p.deleteHsTpVersionControl = function(p0, cb) {
      return dwr.$qcall.call(p,cn,'deleteHsTpVersionControl', arguments,cb);
    };
p.deleteHsTpVersionControl.className = cn;
p.deleteHsTpVersionControl.methodName = "deleteHsTpVersionControl";
    p.updateHsTpVersionControl = function(p0, cb) {
      return dwr.$qcall.call(p,cn,'updateHsTpVersionControl', arguments,cb);
    };
p.updateHsTpVersionControl.className = cn;
p.updateHsTpVersionControl.methodName = "updateHsTpVersionControl";
    p.getNewHsTpVersionControl = function(cb) {
      return dwr.$qcall.call(p,cn,'getNewHsTpVersionControl', arguments,cb);
    };
p.getNewHsTpVersionControl.className = cn;
p.getNewHsTpVersionControl.methodName = "getNewHsTpVersionControl";
    
    dwr.engine._setObject("HsTpVersionControlManager", p);
  }
})();
return p;
}]);

