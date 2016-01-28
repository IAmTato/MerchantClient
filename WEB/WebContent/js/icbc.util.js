/// <reference path="../../dwr/util.js" />
/// <reference path="jquery.js" />
/// <reference path="jquery.dataTables.js" />
/// <reference path="jquery-ui.js" /> 
/// <reference path="jquery.ui.vacp.js" /> 
/// <reference path="jquery.dataTables.obj.js" /> 
/// <reference path="../../dwr/engine.js" />
(function ($) {
	/////////////////////////////////////////////////正则表达式版本
	/**
	* 计算字符串的长度，一个汉字两个字符
	*/
	String.prototype.realLength = function () {
		/**
		*判断Param有多少全角字符.
		*/
		var matchArr = this.match(/[^\x00-\xff]/g);
		return this.length + (matchArr ? matchArr.length : 0);
	};
	
	/**
	 * 填错字符串
	 * @param len
	 * 长度，必输
	 * @param char
	 * 填充字符 
	 * @right
	 *true fill right else fill left
	 * 
	 * @return string filled
	 */
	String.prototype.fill = function(len,ch,right){ 
		var r = this;
		if(right === true){
			while(r.length < len){
				r = [r,ch].join("");
			}
		}else{
			while(r.length < len){
				r = [ch,r].join("");
			}
		}
		return r;
	};
	
	/**
	 * 异步加载函数
	 * add by 2011-11-3 lj
	 * @param fnCall 自定义函数,即具体实现函数 (必须值)
	 * @param msg 执行过程中进度展示信息,默认值:系统正在处理中,请稍候...... (非必要)
	 * @param args fnCall 额外参数 (非必要)
	 * @param loopTimes 循环次数,默认20 (非必要)
	 * @param fnDown 循环结束后自定义处理函数.(非必要) 传入参数 每个fnCall的返回结果数组
	 * @param fnEveryCircle 每次循环完成时调用 (非必要) 传入参数 每个fnCall的返回结果数组 如果返回 值为 === false 则终止异步循环
	 */
	$.fn.AsynEach = function(options){
		options = $.extend({
			fnCall:null,
			msg:/*@vacp.util_1*/"执行中..."/*$*/,
			fnDown:function(data){},
			fnEveryCircle:null,
			loopTimes:20,
			loadingBox:true,
			between:0,
			args:[]
		},options);
		
		
		var data = this;
		if(options.fnCall ===undefined || !$.isFunction(options.fnCall)){
			throw /*@vacp.util_2*/"Error 调用 AsynEach 时 options.fnCall 必须是一个function "/*$*/;
		}
		
		var dataLength = data.length,processBarShowId;
		if(options.loadingBox)$.LoadingBox.show(options.msg);
		var loopTimes_tmp = (options.loopTimes === undefined ? 20 : (isNaN(options.loopTimes) ? 20 : (options.loopTimes>0 ? options.loopTimes : 20) ));
		var i=0;
		var msgArr = [];//所有异步加载中fnCall返回的结果集合
		var fnAsynBySetTimeOut,timeOutId;
		fnAsynBySetTimeOut = function(){
			var tmpArr = [];//当前异步加载中fnCall返回的结果集合
			for(var j=0;i<dataLength && j<loopTimes_tmp ;i++,j++){
				var msg_tmp=options.fnCall(data[i],options.args);
				if(options.loadingBox)$.LoadingBox.setValue(((i+1)/dataLength*100));
				msgArr[i] = (msg_tmp === undefined ? "" : msg_tmp);
				tmpArr[j] = (msg_tmp === undefined ? "" : msg_tmp);
			}
			if(timeOutId)clearTimeout(timeOutId);
			if(i>=dataLength){
				if($.isFunction(options.fnDown)){
					options.fnDown(msgArr);
					fnAsynBySetTimeOut = null;
				}
				if(options.loadingBox)$.LoadingBox.close();
				//clearTimeout(intervalId);
			}else{
				if($.isFunction(options.fnEveryCircle)){
					//用于判断是否下一次异步
					if(options.fnEveryCircle(tmpArr) === false){
						return;
					}
				}
				timeOutId = setTimeout(fnAsynBySetTimeOut,options.between);
			}
		 };
		 timeOutId = setTimeout(fnAsynBySetTimeOut,0);;		
	};
	/**
	 * 格式化字符串
	 * @param format
	 * yyyy/YYYY 4 digit year
	 * mm/MM 2digit mounth
	 * dd/DD 2digit date
	 * hh/HH 2digit hour
	 * mi/MI 2digit minute
	 * ss/SS second 2digit
	 * ms/MS millisecond  4digit
	 * @return string of data formated
	 */
	Date.prototype.toFormatString = function(format){
		var r = format;
		r = r.replace(/yyyy|YYYY/, this.getFullYear());
		r = r.replace(/mm|MM/, (this.getMonth()+1).toString().fill(2,"0"));
		r = r.replace(/dd|DD/, this.getDate().toString().fill(2,"0")); 
		r = r.replace(/hh|HH/, this.getHours().toString().fill(2,"0"));
		r = r.replace(/mi|MI/, this.getMinutes().toString().fill(2,"0"));
		r = r.replace(/ss|SS/, this.getSeconds().toString().fill(2,"0"));
		r = r.replace(/ms|MS/, this.getMilliseconds().toString().fill(4,"0"));
	
		return r;
	};
	/**
	 * 间隙调用功能
	 */
	$.TimeLoop = {
			_timeLoopMap : {"length":0},
			_intervalKey:null,
			_intervalCount:0,
			_isLock:false,//废弃
			intervalTime:1000,
			/**
			 * /**
			 * 添加需间断调用的函数
			 * @param option.menuName 功能菜单名称
			 * @param option.id 唯一索引
			 * @param option.fnCall 需要被调用的函数 无传入参数
			 * @param option.period
			 */
			addFunc : function(option){
				option = $.extend({menuName:" ",
					id:""+Math.random(),
					period:40,
					fnCall:null
					},option);
				if(option.fnCall != null && $.isFunction(option.fnCall)){
					if($.TimeLoop._timeLoopMap==null){
						$.TimeLoop._timeLoopMap={"length":0};
					}
					if($.TimeLoop._timeLoopMap["length"]==null || $.TimeLoop._timeLoopMap["length"]<0){
						$.TimeLoop._timeLoopMap["length"] = 0;
					}
					if($.TimeLoop._timeLoopMap[option.menuName] == null){
						$.TimeLoop._timeLoopMap[option.menuName] = {};
						var length = $.TimeLoop._timeLoopMap["length"];
						$.TimeLoop._timeLoopMap["length"]=length+1;
					}
					$.TimeLoop._timeLoopMap[option.menuName][option.id] = option;
					$.TimeLoop.start();
				}else{
					$.showError({title:/*@vacp.util_3*/"间隙调用功能错误提示"/*$*/,info:/*@vacp.util_4*/"Error 调用 $.TimeLoop.addFunc 时 options.fnCall 必须是一个function"/*$*/,height:200,width:320});
				}
			},
			/**
			 * /**
			 * 清除 指定key的 interval 函数，如果key 不输入则清除所有
			 * 
			 * @param menuName  选输 功能菜单名称
			 * @param id   选输 唯一索引  
			 */
			clear : function(menuName,id){
				if(menuName){
					if(id){
						if($.TimeLoop._timeLoopMap && $.TimeLoop._timeLoopMap[menuName])$.TimeLoop._timeLoopMap[menuName][id] = undefined;
					}else{
						if($.TimeLoop._timeLoopMap)$.TimeLoop._timeLoopMap[menuName] = undefined;
					}
					var needStop = true;
					outer:
					for ( var name in $.TimeLoop._timeLoopMap) {
						if($.TimeLoop._timeLoopMap[name] == null)continue;
						for(var i in $.TimeLoop._timeLoopMap[name]){
							if($.TimeLoop._timeLoopMap[name][i] && $.isFunction($.TimeLoop._timeLoopMap[name][i].fnCall)){
								needStop = false;
								break outer;
							}
						}
					}
					if(needStop){
						$.TimeLoop.stop();
						$.TimeLoop._timeLoopMap = {"length":0};
					}else{
						var length = $.TimeLoop._timeLoopMap["length"];
						$.TimeLoop._timeLoopMap["length"] = length-1;
					}
				}else{
					$.TimeLoop._timeLoopMap = {"length":0};
					$.TimeLoop.stop();
				}
			},
			/**
			 * 启动间歇调用
			 */
			start:function(){
				//只能启动一次
				if($.TimeLoop._intervalKey != null )return;
				var fnStart = function(){
					var name = null,id = null;
					try{
						if($.TimeLoop._timeLoopMap==null || $.TimeLoop._timeLoopMap.length<1){
							window.clearInterval($.TimeLoop._intervalKey);
							$.TimeLoop._intervalKey = null;
							$.TimeLoop._intervalCount = 0;
							$.TimeLoop._isLock = false;
							return;
						}
						$.TimeLoop._intervalCount += 1;
						var sc = Math.floor($.TimeLoop.intervalTime/1000);
						if(sc < 1)sc = 1;
						var tmpArr,len,i,batchBegined = false;
						//启用批量调用减少页面范围量
						
						for (name in $.TimeLoop._timeLoopMap) {
							id = null;
							tmpArr = $.TimeLoop._timeLoopMap[name];
							if(tmpArr == null)continue;
							for(id in tmpArr){
								var opt = tmpArr[id];
								if(opt && $.isFunction(opt.fnCall)){
									var cts = Math.floor( opt.period / sc);
									if($.TimeLoop._intervalCount % cts == 0){
										if(batchBegined == false){
											batchBegined = true;
											dwr.engine.beginBatch();
										}									
										opt.fnCall(opt);
									}
								}
								
								var count = 0;
								if(dwr.engine._batch && dwr.engine._batch.map && dwr.engine._batch.map.callCount != null){
									count = dwr.engine._batch.map.callCount;//获取批量回调函数数量
								}
								//取  dwr.engine._batch.callCount 做为当前调用次数更准确
								if(count > 0 && (count % (dwr.maxCallCount||20 )== 0) && batchBegined){
									//如果达到最大调用数则 重新启动批量。
									dwr.engine.endBatch({
										async:false,
										timeout:3*60*1000
									});
									//dwr.engine.beginBatch();// $.isFunction(opt.fnCall) 没有经过判断,所以使用batchBegined = false标示符来重启批量
									batchBegined = false;
								}
								
							}
						}
						//同步调用 避免刷新函数并行运行，超时 3分钟
						if(batchBegined){
							dwr.engine.endBatch({
								async:false,
								timeout:3*60*1000
							});
						}
					}catch(e){
						if (window['JsDebug']) {
							if(name!=null){
								$.TimeLoop.clear(name,id);
								$.showError({title:"定时调用异常",info:replaceJs("定时调用  NAME : {-0-},ID : {-1-},已被移除,出现异常:{-2-}",[""+name,""+id,""+e.message])});
							}
						}
					}finally{
						$.TimeLoop._isLock = false;
					}
				};
				$.TimeLoop._intervalKey = window.setInterval(fnStart, $.TimeLoop.intervalTime);//一秒一刷
			},
			/**
			 * 停止间隙调用
			 */
			stop : function(){
				if($.TimeLoop._intervalKey != null){
					window.clearInterval($.TimeLoop._intervalKey);
					$.TimeLoop._intervalKey = null;
					$.TimeLoop._intervalCount = 0;
				}
			}
	};
	
	

	$.debug = function (message) {
//		if(ctp && ctp.core && ctp.core.log){
//			ctp.core.log.err("dwr error",message);
//		}
		//Debug窗口div
		if (window['JsDebug'] && $("#dwr-debug").length == 0) {
			$(document).ready(function(){
				$(document.body).append('<div><input type="button" value="clear Debug Info" onclick="$(\'#dwr-debug\').empty()"/><span id="dwr-debug"></span></div>');
			});
		}
		
		if (window['JsDebug']) {
			if(typeof message != "string"){
				message = dwr.util.toDescriptiveString(message,20);
			}
			var contents = message +"<br/>"+$("#dwr-debug")[0].innerHTML;
			if (contents.length > 20480){ 
				contents = contents.substring(0, 20480);
			}
			$("#dwr-debug")[0].innerHTML = contents;
		}
	};
	//changed by 2011-11-9 lj
	//$(document).ready(function () {
	//设置jQuery ajax访问错误处理
	$(document).ajaxError(function (event, request, settings) {
		// alert("访问:" + settings.url + "时出错！请确认session是否超时！\n");//+request.responseText
		$.AjaxErr = true;
		if (window['JsDebug'])$.debug(request.responseText);
		if(request.responseText == "sessionTimeOut"){
			 //window.location.href="/icbc/vacp/sesserror.jsp?errRetPath=index.jsp";
		}else{
			$(document.body).empty();
			$(document.body).append(request.responseText);
		}
	});

	if (window['dwr']) {
		$.dwr = window['dwr'];
		dwr.engine.setErrorHandler(function (message, ex) {
			//if (window['JsDebug']) {
				//$.LoadingBox.close(true);
				$.showError({ title: /*@vacp.util_5*/"请检查是否已Session超时!"/*$*/, info: message + "<br/>" + dwr.util.toDescriptiveString(ex, 20) });
				if (window['JsDebug'])$.debug(dwr.util.toDescriptiveString(ex,20));
			//} else {
			//}
		});

		dwr.engine.setWarningHandler(function (message, ex) {
			//if (window['JsDebug']) {
				//$.LoadingBox.close(true);
				$.showError({ title: /*@vacp.util_5*/"请检查是否已Session超时!"/*$*/, info: message + "<br/>" + dwr.util.toDescriptiveString(ex, 20) });
				if (window['JsDebug'])$.debug(dwr.util.toDescriptiveString(ex,20));
			//} else {
			//}
		});
		//50分钟超时；
		dwr.engine.setTimeout(50 * 60 * 1000);
		dwr.engine.setTextHtmlHandler(function (resp) {
			if(resp.responseText == "sessionTimeOut"){
				$.showError({ title: /*@vacp.util_6*/"服务器返回数据错误，请检查是否已Session超时!"/*$*/, info: resp.responseText });
				//$.LoadingBox.close(true);
				if (window['JsDebug'])$.debug(dwr.util.toDescriptiveString(resp,20));
				//window.location.href="/icbc/vacp/sesserror.jsp?errRetPath=index.jsp";
			}
		});
	}

	$.getDicBeansByType = function (type) {
		return _dic_map[type];
	};
	//});
	
	/**
	 * get all element 
	 */
	var recursionEls = function(el,$Arr,elArr){
		if(!el)return;
		var i = el.length||0;
		for(i = i - 1;i >= 0;i--){
			recursionEls(el[i],$Arr,elArr);
		}
		var tmp = el.childNodes;
		if (tmp && (i = tmp.length)) {
			for (i = i -1; i >= 0; i--) {
				recursionEls(tmp[i],$Arr,elArr);
			}
		}
		if(el[jQuery.expando]){
			$Arr.push(el);
		}
		if(el.attributes && el.attributes.length ){
			elArr.push(el);
		}
	};
	/*
	 * delete jquery datas and events
	 */
	var deal$El = function(el){
		var d$ = $(el);
		d$.unbind();
		d$.removeData();
		d$ = null;
	};
	/**
	 * remove dom props 
	 */
	var _exProps = {};
	var dealEl = function(el){
		for(var i in el){
			try{
				if(!_exProps[i]){
					if(typeof el[i] === "string")
						el[i] = "";
					else					
						el[i] = undefined;	
				}
			}catch(e){//on Exception the prop can't be seted.
				_exProps[i] = true;
			}
		}
		try{
			if(el.removeNode){
					el.removeNode(true);
			}
		}catch(e){}
	};
		
	/**
	 * synchronous clear leaks 
	 */
	$.clearLeaks = function(obj){
		if(!obj)return;
		var $Arr = [],elArr = [];
		recursionEls(obj,$Arr,elArr);
//synchronous clear leaks
		//make sure clear jquery data and event first
//		for(d in $Arr){
//			var d$ = $($Arr[d]);
//			d$.unbind();
//			d$.removeData();
//			d$ = null;
//		}
//		for(var d in elArr){
//			var el = elArr[d];
//			for(var i in el){
//				try{
//					el[i] = null;	
//				}catch(e){}
//			}
//			try{
//				if(el.removeNode){
//						el.removeNode(true);
//				}
//			}catch(e){}
//		}
//		elArr.length = 0;
//		$Arr.length = 0;
//synchronous clear leaks
		$($Arr).AsynEach({
				fnCall:deal$El,
				loopTimes:100,
				loadingBox:false,
				fnDown:function(){//必须先处理 jquery对象数据和事件
					$(elArr).AsynEach({
						fnCall:dealEl,
						loopTimes:100,
						loadingBox:false,
						fnDown:function(){
								elArr.length = 0;
								elArr = null;
							},
						between:1
					});
					$Arr.length = 0;
					$Arr = null;
				},
				between:1
			});
	};
	/**
	 * 用于将简单的文本数字转换为 arr2ctpAutoCompleteSource需要的数组
	 */
	$.arr2ctpAutoCompleteSource = function(arr){
		var source = [],i = 0,len = arr.length;
		for(i = 0;i < len;i++){
			source[i] = {text:arr[i],value:arr[i]};
		}
		return source;
	};
	/**
	 * 填充字符串
	 * str:原字符串
	 * fillchar：填充字符
	 * number：填充到的字符串长度
	 * postfix: true 填充到后面,false填充到前面
	 */
	$.fill = function(str,fillchar,number,postfix){
		if(str == null ||str.length >= number){
			return str;
		}
		while(str.length < number){
			if(postfix){
				str = str + String(fillchar);
			}else{
				str = String(fillchar) + str;
			}
		}
		return str;
	};
	
})(jQuery);