"use strict";
dwr.engine.synremoter = {};
dwr.util = {};

//临时 消除jquery影响
var $={};
$.debug = angular.logger.debug;

/**
 * This function pretty-prints simple data or whole object graphs, f ex as an aid in debugging.
 */
dwr.util.toDescriptiveString = function(data, showLevels, options) {
  if (showLevels === undefined) showLevels = 1;
  var opt = {};
  if (dwr.util._isObject(options)) opt = options;
  var defaultoptions = {
    escapeHtml:false,
    baseIndent: "",
    childIndent: "\u00A0\u00A0",
    lineTerminator: "\n",
    oneLineMaxItems: 5,
    shortStringMaxLength: 13,
    propertyNameMaxLength: 30 
  };
  for (var p in defaultoptions) {
    if (!(p in opt)) {
      opt[p] = defaultoptions[p];
    }
  }

  var skipDomProperties = {
    document:true, ownerDocument:true,
    all:true,
    parentElement:true, parentNode:true, offsetParent:true,
    children:true, firstChild:true, lastChild:true,
    previousSibling:true, nextSibling:true,
    innerHTML:true, outerHTML:true,
    innerText:true, outerText:true, textContent:true,
    attributes:true,
    style:true, currentStyle:true, runtimeStyle:true,
    parentTextEdit:true
  };
  
  function recursive(data, showLevels, indentDepth, options) {
    var reply = "";
    try {
      // string
      if (dwr.util._isString(data)) {
        var str = data;
        if (showLevels == 0 && str.length > options.shortStringMaxLength)
          str = str.substring(0, options.shortStringMaxLength-3) + "...";
        if (options.escapeHtml) {
          // Do the escape separately for every line as escapeHtml() on some 
          // browsers (IE) will strip line breaks and we want to preserve them
          var lines = str.split("\n");
          for (var i = 0; i < lines.length; i++) lines[i] = dwr.util.escapeHtml(lines[i]);
          str = lines.join("\n");
        }
        if (showLevels == 0) { // Short format
          str = str.replace(/\n|\r|\t/g, function(ch) {
            switch (ch) {
              case "\n": return "\\n";
              case "\r": return "";
              case "\t": return "\\t";
            }
          });
        }
        else { // Long format
          str = str.replace(/\n|\r|\t/g, function(ch) {
            switch (ch) {
              case "\n": return options.lineTerminator + indent(indentDepth+1, options);
              case "\r": return "";
              case "\t": return "\\t";
            }
          });
        }
        reply = '"' + str + '"';
      }
      
      // function
      else if (dwr.util._isFunction(data)) {
        reply = "function";
      }
    
      // Array
      else if (dwr.util._isArrayLike(data)) {
        if (showLevels == 0) { // Short format (don't show items)
          if (data.length > 0)
            reply = "[...]";
          else
            reply = "[]";
        }
        else { // Long format (show items)
          var strarr = [];
          strarr.push("[");
          var count = 0;
          for (var i = 0; i < data.length; i++) {
            if (!(i in data) && data != "[object NodeList]") continue;
            var itemvalue = data[i];
            if (count > 0) strarr.push(", ");
            if (showLevels == 1) { // One-line format
              if (count == options.oneLineMaxItems) {
                strarr.push("...");
                break;
              }
            }
            else { // Multi-line format
              strarr.push(options.lineTerminator + indent(indentDepth+1, options));
            }
            if (i != count) {
              strarr.push(i);
              strarr.push(":");
            }
            strarr.push(recursive(itemvalue, showLevels-1, indentDepth+1, options));
            count++;
          }
          if (showLevels > 1) strarr.push(options.lineTerminator + indent(indentDepth, options));
          strarr.push("]");
          reply = strarr.join("");
        }
      }
      
      // Objects except Date
      else if (dwr.util._isObject(data) && !dwr.util._isDate(data)) {
        if (showLevels == 0) { // Short format (don't show properties)
          reply = dwr.util._detailedTypeOf(data);
        }
        else { // Long format (show properties)
          var strarr = [];
          if (dwr.util._detailedTypeOf(data) != "Object") {
            strarr.push(dwr.util._detailedTypeOf(data));
            if (typeof data.valueOf() != "object") {
              strarr.push(":");
              strarr.push(recursive(data.valueOf(), 1, indentDepth, options));
            }
            strarr.push(" ");
          }
          strarr.push("{");
          var isDomObject = dwr.util._isHTMLElement(data); 
          var count = 0;
          for (var prop in data) {
            var propvalue = data[prop];
            if (isDomObject) {
              if (propvalue == null) continue;
              if (typeof propvalue == "function") continue;
              if (skipDomProperties[prop]) continue;
              if (prop.toUpperCase() == prop) continue;
            }
            if (count > 0) strarr.push(", ");
            if (showLevels == 1) { // One-line format
              if (count == options.oneLineMaxItems) {
                strarr.push("...");
                break;
              }
            }
            else { // Multi-line format
              strarr.push(options.lineTerminator + indent(indentDepth+1, options));
            }
            strarr.push(prop.length > options.propertyNameMaxLength ? prop.substring(0, options.propertyNameMaxLength-3) + "..." : prop);
            strarr.push(":");
            strarr.push(recursive(propvalue, showLevels-1, indentDepth+1, options));
            count++;
          }
          if (showLevels > 1 && count > 0) strarr.push(options.lineTerminator + indent(indentDepth, options));
          strarr.push("}");
          reply = strarr.join("");
        }
      }
  
      // undefined, null, number, boolean, Date
      else {
        reply = "" + data;
      }
  
      return reply;
    }
    catch(err) {
      return (err.message ? err.message : ""+err);
    }
  }

  function indent(count, options) {
    var strarr = [];
    strarr.push(options.baseIndent);
    for (var i=0; i<count; i++) {
      strarr.push(options.childIndent);
    }
    return strarr.join("");
  };
  
  return recursive(data, showLevels, 0, opt);
};

/**
 * 为减少每一个class文件大小,将所有方法设置为一个公用的call方法。
 */
dwr.engine.synremoter.call = function(script,scriptName,mname,args,callback){
	var _errorHandler = function (ex) {
		$.debug("errorHandler for " + scriptName+"."+mname+" :\n<br>");
		$.debug("args:"+dwr.util.toDescriptiveString(args,20)+"\n<br>");
		$.debug("exception:"+dwr.util.toDescriptiveString(ex,20)+"\n<br>");
	};
	if (callback != null) {
		/**
		 * jsdebug时开启 异常日志答应功能
		 */
		if(window.JsDebug){
			var tmpcallback = callback;
			callback = function(data){
				if(dwr.isException(data)){
					$.debug(data.message+":</br>"+data.trace);
				}
				//modify by kfzx-hexm01 on 2014-12-10,修复jsdebug模式下保存参数报错的问题
				if(typeof tmpcallback == "function") {
					tmpcallback(data);
				}else{
					tmpcallback.callback(data);
				}
			};
		}

		if (typeof callback == "function") {
			callback = { 
					"callback": callback,
					errorHandler: _errorHandler 
			};
		}else {
			callback =  angular.extend({
				errorHandler: _errorHandler 
			},
			callback); 
		} 

		args[args.length - 1] = callback;
		return dwr.engine._execute(script._path, scriptName, mname, args);
	}

	//synchronized
	var dwr_result = null;

	var dwr_callback;
	if(window.JsDebug) {
		dwr_callback = { 
				callback: function (data) {
			//jsdebug时开启 异常日志答应功能
			if(dwr.isException(data)){
				$.debug(data.message+":</br>"+data.trace);
			}
			dwr_result = data; 
		}, 
		errorHandler: _errorHandler 
		}; 
	}else{
		dwr_callback = { 
				callback: function (data) {
			dwr_result = data; 
		}, 
		errorHandler: _errorHandler 
		}; 
	}

	//add call back funciton
	var dwr_arguments = [];
	var len = args.length;
	for(var i=0; i<len; i++) {
		dwr_arguments[i] = args[i];
	}
	dwr_arguments[len] = dwr_callback;
 
	//为同步调用建立单独批量 保证不受干扰
	var batch = dwr.engine.batch.create();
	// All the paths MUST be to the same servlet
	if (batch.path == null) {
		batch.path = script._path;
	}
	dwr.engine.batch.addCall(batch, scriptName, mname, dwr_arguments);
	batch.map.callCount++;
	batch.async = false;
	dwr.engine.transport.send(batch);
	dwr.engine.batch.remove(batch);

	return dwr_result;
};

/**
 * 将一个dwr返回的bean直接转换为 ctp需要的fieldName:xxx的格式字符串
 */
dwr.bean2CtpAttrString = function(bean){
	var name = null,strArr = []; 
	for(name in bean){
		strArr[strArr.length] = "{fieldName: '"+name+"'}";
	}
	return strArr.join(",\n");
};

/**
 * 判断dwr函数返回结果是否发生了异常。
 */
dwr.isException = function(data){
	if(data == null) return false;
	if(data.hasDwrExecption_){
		return true;
	}
	return false;
};