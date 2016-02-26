"use strict";
angular.module("$dwr")
  .service("QrCodeIntf", ["$dwr", function (dwr) {
    var p = this;
    (function () {
      if (dwr.engine._getObject("QrCodeIntf") == undefined) {

        p = {};
        var cn = "QrCodeIntf";
        p.qrCodeRead = function (p0, cb) {
          return dwr.$qcall.call(p, cn, 'qrCodeRead', arguments, cb);
        };
        p.qrCodeRead.className = cn;
        p.qrCodeRead.methodName = "qrCodeRead";
        p.insertOneMasterOrderRecord = function (p0, p1, cb) {
          return dwr.$qcall.call(p, cn, 'insertOneMasterOrderRecord', arguments, cb);
        };
        p.insertOneMasterOrderRecord.className = cn;
        p.insertOneMasterOrderRecord.methodName = "insertOneMasterOrderRecord";
        p.getThisOrderStatus = function (cb) {
          return dwr.$qcall.call(p, cn, 'getThisOrderStatus', arguments, cb, true);
        };
        p.getThisOrderStatus.className = cn;
        p.getThisOrderStatus.methodName = "getThisOrderStatus";
        p.getFinalOrderResults = function (cb) {
          return dwr.$qcall.call(p, cn, 'getFinalOrderResults', arguments, cb);
        };
        p.getFinalOrderResults.className = cn;
        p.getFinalOrderResults.methodName = "getFinalOrderResults";
        p.getThisOrderInfo = function (cb) {
          return dwr.$qcall.call(p, cn, 'getThisOrderInfo', arguments, cb, true);
        };
        p.getThisOrderInfo.className = cn;
        p.getThisOrderInfo.methodName = "getThisOrderInfo";
        p.TestQrCodeFunc = function (p0, p1, cb) {
          return dwr.$qcall.call(p, cn, 'TestQrCodeFunc', arguments, cb);
        };
        p.TestQrCodeFunc.className = cn;
        p.TestQrCodeFunc.methodName = "TestQrCodeFunc";

        dwr.engine._setObject("QrCodeIntf", p);
      }
    })();
    return p;
  }]);

