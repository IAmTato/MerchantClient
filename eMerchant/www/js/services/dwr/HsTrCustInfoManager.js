"use strict";
angular.module("$dwr")
.service("HsTrCustInfoManager", ["$dwr", function (dwr) {
var p = this;
(function () {
  if (dwr.engine._getObject("HsTrCustInfoManager") == undefined) {
    
    p = {};
var cn = "HsTrCustInfoManager";
    p.setEntityManagerFactory = function(p0, cb) {
      return dwr.$qcall.call(p,cn,'setEntityManagerFactory', arguments,cb);
    };
p.setEntityManagerFactory.className = cn;

      /**
       * 模拟 访问 server
       * @type {string}
       */
p.setEntityManagerFactory.methodName = "setEntityManagerFactory";
    p.createHsTrCustInfo = function(p0, cb) {

        var dwr_result = $q(function (resolve, reject) {
            if (resolve == null) {
                resolve = $log.debug;
            }
            if (reject == null) {
                resolve = _errorHandler;
            }
            args[args.length - 1] = {
                "callback": resolve,
                errorHandler: reject
            };
            setTimeout(function(){
                resolve({res:'返回数据'});
            },1);
            //dwr.engine._execute(script._path, scriptName, mname, args);
        });
        return dwr_result;


      return dwr.$qcall.call(p,cn,'createHsTrCustInfo', arguments,cb);
    };
p.createHsTrCustInfo.className = cn;
p.createHsTrCustInfo.methodName = "createHsTrCustInfo";
    p.deleteHsTrCustInfo = function(p0, cb) {
      return dwr.$qcall.call(p,cn,'deleteHsTrCustInfo', arguments,cb);
    };
p.deleteHsTrCustInfo.className = cn;
p.deleteHsTrCustInfo.methodName = "deleteHsTrCustInfo";
    p.updateHsTrCustInfo = function(p0, cb) {
      return dwr.$qcall.call(p,cn,'updateHsTrCustInfo', arguments,cb);
    };
p.updateHsTrCustInfo.className = cn;
p.updateHsTrCustInfo.methodName = "updateHsTrCustInfo";
    p.findHsTrCustInfoByCustId = function(p0, cb) {
      return dwr.$qcall.call(p,cn,'findHsTrCustInfoByCustId', arguments,cb);
    };
p.findHsTrCustInfoByCustId.className = cn;
p.findHsTrCustInfoByCustId.methodName = "findHsTrCustInfoByCustId";
    p.getNewHsTrCustInfo = function(cb) {
      return dwr.$qcall.call(p,cn,'getNewHsTrCustInfo', arguments,cb);
    };
p.getNewHsTrCustInfo.className = cn;
p.getNewHsTrCustInfo.methodName = "getNewHsTrCustInfo";
    
    dwr.engine._setObject("HsTrCustInfoManager", p);
  }
})();
return p;
}]);

