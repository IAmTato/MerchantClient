"use strict";
angular.module("$dwr")
    .service("dwrQrCodeIntf", ["$dwr", function (dwr) {
        var p = this;
        (function () {
            if (dwr.engine._getObject("dwrQrCodeIntf") == undefined) {

                var simulateDwr = function(timeoutFun){
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
                        setTimeout(function(resolve, reject){
                            timeoutFun();
                        },1);
                        //dwr.engine._execute(script._path, scriptName, mname, args);
                    });
                    return dwr_result;
                };

                p = {};
                var cn = "dwrQrCodeIntf";

                /**
                 *
                 * @param qrCode 二维码扫描得到的id
                 * @param callback， 选输，成功回调函数。
                 * @returns  {res:true|false,err:"失败原因,res为false时才有该字段",trace:'server端trace 打印到 log服务,res为false时才有该字段'}
                 */
                p.readQrCode = function(qrCode, callback) {
                    return simulateDwr(function(resolve, reject){
                        resolve({res:true,data:{phoneNo:'122434535'}});
                        //reject({res:false,errMsg:"失败原因",trace:'server端trace 打印到 log服务'});
                    });
                };
                p.readQrCode.className = cn;
                p.readQrCode.methodName = "readQrCode";

                p.comfirmAmount = function(qrCode,amount, callback) {
                    return simulateDwr(function(resolve, reject){
                        resolve({res:true,data:{phoneNo:'122434535',amount:10,servicefee:"...."}});
                        //reject({res:false,err:"失败原因",trace:'server端trace 打印到 log服务'});
                    });
                };
                p.readQrCode.className = cn;
                p.readQrCode.methodName = "readQrCode";

                dwr.engine._setObject("dwrQrCodeIntf", p);
            }
        })();
        return p;
    }]);

