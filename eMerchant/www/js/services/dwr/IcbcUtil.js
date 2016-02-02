"use strict";
angular.module("$dwr")
    .service("IcbcUtil", ["$dwr", function (dwr) {
    var p = this;
    (function () {
        if (dwr.engine._getObject("IcbcUtil") == undefined) {
            var cn = "IcbcUtil";
            p.getRemoteAddr = function (cb) {
                return dwr.$qcall.call(p, cn, 'getRemoteAddr', arguments, cb);
            };
            p.getRemoteAddr.className = cn;
            p.getRemoteAddr.methodName = "getRemoteAddr";
            p.Execption2String = function (p0, p1, cb) {
                return dwr.$qcall.call(p, cn, 'Execption2String', arguments, cb);
            };
            p.Execption2String.className = cn;
            p.Execption2String.methodName = "Execption2String";
            p.Execption2String = function (p0, cb) {
                return dwr.$qcall.call(p, cn, 'Execption2String', arguments, cb);
            };
            p.Execption2String.className = cn;
            p.Execption2String.methodName = "Execption2String";
            p.shutdownScheduledService = function (cb) {
                return dwr.$qcall.call(p, cn, 'shutdownScheduledService', arguments, cb);
            };
            p.shutdownScheduledService.className = cn;
            p.shutdownScheduledService.methodName = "shutdownScheduledService";
            p.getDwrMaxCallCount = function (cb) {
                return dwr.$qcall.call(p, cn, 'getDwrMaxCallCount', arguments, cb);
            };
            p.getDwrMaxCallCount.className = cn;
            p.getDwrMaxCallCount.methodName = "getDwrMaxCallCount";
            p.getDownloadCount = function (cb) {
                return dwr.$qcall.call(p, cn, 'getDownloadCount', arguments, cb);
            };
            p.getDownloadCount.className = cn;
            p.getDownloadCount.methodName = "getDownloadCount";
            p.nullString2Empty = function (p0, cb) {
                return dwr.$qcall.call(p, cn, 'nullString2Empty', arguments, cb);
            };
            p.nullString2Empty.className = cn;
            p.nullString2Empty.methodName = "nullString2Empty";
            p.listTransform = function (p0, cb) {
                return dwr.$qcall.call(p, cn, 'listTransform', arguments, cb);
            };
            p.listTransform.className = cn;
            p.listTransform.methodName = "listTransform";
            p.getUtx = function (cb) {
                return dwr.$qcall.call(p, cn, 'getUtx', arguments, cb);
            };
            p.getUtx.className = cn;
            p.getUtx.methodName = "getUtx";
            p.getRandomNum = function (p0, cb) {
                return dwr.$qcall.call(p, cn, 'getRandomNum', arguments, cb);
            };
            p.getRandomNum.className = cn;
            p.getRandomNum.methodName = "getRandomNum";
            p.setTransform = function (p0, cb) {
                return dwr.$qcall.call(p, cn, 'setTransform', arguments, cb);
            };
            p.setTransform.className = cn;
            p.setTransform.methodName = "setTransform";
            p.replaceJava = function (p0, p1, cb) {
                return dwr.$qcall.call(p, cn, 'replaceJava', arguments, cb);
            };
            p.replaceJava.className = cn;
            p.replaceJava.methodName = "replaceJava";
            p.mactchStr = function (p0, p1, cb) {
                return dwr.$qcall.call(p, cn, 'mactchStr', arguments, cb);
            };
            p.mactchStr.className = cn;
            p.mactchStr.methodName = "mactchStr";

            dwr.engine._setObject("IcbcUtil", p);
        } else {
            p = dwr.engine._getObject("IcbcUtil");
        }
    })();
    return p;
}]);
