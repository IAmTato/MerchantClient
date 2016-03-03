"use strict";
angular.module("$dwr")
  .service("HsTrQrcodeManager", ["$dwr", function (dwr) {
    var p = this;
    (function () {
      if (dwr.engine._getObject("HsTrQrcodeManager") == undefined) {

        p = {};
        var cn = "HsTrQrcodeManager";
        p.setEntityManagerFactory = function (p0, cb) {
          return dwr.$qcall.call(p, cn, 'setEntityManagerFactory', arguments, cb);
        };
        p.setEntityManagerFactory.className = cn;
        p.setEntityManagerFactory.methodName = "setEntityManagerFactory";
        p.createHsTrQrcode = function (p0, cb) {
          return dwr.$qcall.call(p, cn, 'createHsTrQrcode', arguments, cb);
        };
        p.createHsTrQrcode.className = cn;
        p.createHsTrQrcode.methodName = "createHsTrQrcode";
        p.deleteHsTrQrcode = function (p0, cb) {
          return dwr.$qcall.call(p, cn, 'deleteHsTrQrcode', arguments, cb);
        };
        p.deleteHsTrQrcode.className = cn;
        p.deleteHsTrQrcode.methodName = "deleteHsTrQrcode";
        p.updateHsTrQrcode = function (p0, cb) {
          return dwr.$qcall.call(p, cn, 'updateHsTrQrcode', arguments, cb);
        };
        p.updateHsTrQrcode.className = cn;
        p.updateHsTrQrcode.methodName = "updateHsTrQrcode";
        p.findHsTrQrcodeByQrCodeId = function (p0, cb) {
          return dwr.$qcall.call(p, cn, 'findHsTrQrcodeByQrCodeId', arguments, cb);
        };
        p.findHsTrQrcodeByQrCodeId.className = cn;
        p.findHsTrQrcodeByQrCodeId.methodName = "findHsTrQrcodeByQrCodeId";
        p.getNewHsTrQrcode = function (cb) {
          return dwr.$qcall.call(p, cn, 'getNewHsTrQrcode', arguments, cb);
        };
        p.getNewHsTrQrcode.className = cn;
        p.getNewHsTrQrcode.methodName = "getNewHsTrQrcode";
        p.updateQrCodeStatus = function (p0, p1, cb) {
          return dwr.$qcall.call(p, cn, 'updateQrCodeStatus', arguments, cb);
        };
        p.updateQrCodeStatus.className = cn;
        p.updateQrCodeStatus.methodName = "updateQrCodeStatus";

        dwr.engine._setObject("HsTrQrcodeManager", p);
      }
    })();
    return p;
  }]);

