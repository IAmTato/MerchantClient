(function ($) {

	///为Dialog记录数据
	//$._DialogInfo = $._DialogInfo || {};
	//$._DialogInfo.mod = $._DialogInfo.mod || { title: "确认框", info: "请确认！" };
	var info$;
	$(document).ready(function(){
		//动态必要的添加divs
		info$ = $('<div id="_infoeffect" style="background-color:yellow;border:2px dotted black; font-size: large;text-align: center;vertical-align: middle;width: 357px;height: 87px;border-color :green;color:green;z-index:2147483646; font-weight: 700;"> <span id="_infospan"></span></div>');
		$(document.body).append(info$);
		info$.hide();
	}); 

	/**
	*
	*/
	$.openModelDialog = function (options) {
		///	<summary>
		///		1:显示一个模态对话框,已回调形式处理<br>.
		///	</summary>
		///	<param name="info" type="object"> 
		///		1: html - A string of HTML to create on the fly.<br>
		///		2: elements - DOM element(s) to be encapsulated by a jQuery object. <br>
		///	</param>
		///	<param name="title" type="String">
		///		1: String - A 标题字符串.
		///	</param>
		///	<param name="fncallback" type="Function">
		///		1: Function - A 回调函数，当选择确定时将调用fncallback（true）,点击取消是调用fncallback（false).
		///	</param>
		///	<returns type="jQuery" />
		options = $.extend({
			bgiframe: false,
			resizable: true,
			closeOnEscape: true,
			title: /*@jquery.ui.vacp_1*/"消息框"/*$*/,
			info: /*@fileJobItemLogListViewer.js.4*/"请确认"/*$*/,
			stack: true,
			modal: true,
			height: 300,
			width: 400,
			autoOpen: false,
			fncallback: function (isOk) { },
			buttons: {
				/*@common.confirm*/'确认'/*$*/: function () {
					if ($.isFunction(options.fncallback)) {
						options.fncallback(true);
					}
					try{
						$(this).dialog('destroy');
					}catch(e){}
				},
				/*@common.concel*/'取消'/*$*/: function () {
					if ($.isFunction(options.fncallback)) {
						options.fncallback(false);
					}
					try{
						$(this).dialog('destroy');
					}catch(e){}
				}
			}
		},options);
		
		var Modeldialog$ = $("<div><p ><span  class='ui-icon ui-icon-alert' style='float:left; margin:0 7px 20px 0;'></span><span id='_ModeldialogInfo'></span></p></div>");
		var ModeldialogDlg$ = Modeldialog$.dialog(options);//构造
		$("#_ModeldialogInfo",Modeldialog$).append(options.info);//设置窗口内容信息
		ModeldialogDlg$.dialog("open");//打开
		return ModeldialogDlg$;
	};
	

	var LoadingBoxdialog$ = $("<div id=\"_showLoadingBoxDiv_vacp_util\" style=\"textAlign:center\"></div>");
	/**
	 * 公共进度条。
	 * $.LoadingBox.show(msg) 显示进度条 进度条提示信息,
	 * $.LoadingBox.close(force) 关闭进度条,force  true 强制关闭（不管打开过多少次） 其他 正常关闭（如果打开次数大于1 则打开次数减一 ）。
	 * $.LoadingBox.setValue();设置进度条进度 0 - 100,
	 * $.LoadingBox.autoValue() 打开自动进度功能
	 * $.LoadingBox.closeAuto() 关闭自动进度功能
	 */
	$.LoadingBox = {
		_openTimes:0,
		_intervalId:null,
		_msg:/*@jquery.ui.vacp_2*/"系统正在处理中,请稍候......"/*$*/,
		_dialog:null,
		show:function(msg){
			$.LoadingBox._msg=(msg===undefined?/*@jquery.ui.vacp_2*/"系统正在处理中,请稍候......"/*$*/:msg);
			
			if($.LoadingBox.processBar==null){
				//构造进度条
				$.LoadingBox.processBar = $("<div id=\"__progressbar_vacp_util\"></div>");
				$.LoadingBox.processBar.progressbar({value:0,needDestroy:false});
				LoadingBoxdialog$.append($.LoadingBox.processBar);
			}
			if($.LoadingBox._intervalId!=null){
				//有自动刷新,则需要关闭
				$.LoadingBox.endAutoValue();
			}
			
			//不能移动位置,重置进度条进度值
			$.LoadingBox.setValue(1);
			
			if($.LoadingBox._dialog!=null){
				$.LoadingBox._dialog.dialog("option", "title", $.LoadingBox._msg);
				$.LoadingBox._dialog.dialog("open");
				return;
			}
			//构造对话框
			$.LoadingBox._dialog = LoadingBoxdialog$.dialog({
				needDestroy:false,
				bgiframe: false,
				resizable: false,
				closeOnEscape: false,
				height: 70,
				minHeight:70,
				width: 380,
				stack: true,
				modal: true,
				autoOpen: false,
				beforeClose:function(){
					//存在自动刷新,因此不能关闭
					if($.LoadingBox._intervalId!=null){
						return false;
					}
				}
			});
			$.LoadingBox._dialog.dialog( "option", "title", $.LoadingBox._msg);
			$.LoadingBox._dialog.dialog( "open" );
		},
		close:function(force){
			if($.LoadingBox._dialog){
				if(force===true){
					$.LoadingBox.endAutoValue();
					//关闭
					$.LoadingBox.close();
				}else if($.LoadingBox._intervalId==null){
					//延迟关闭,达到进度条加载100%效果
					$.LoadingBox.processBar.progressbar({value:100});
					var fnClose = function(){
						$.LoadingBox._dialog.dialog("close");
					};
					window.setTimeout(fnClose, 20);
				}else{
					//必须等待,直到它自动关闭
				}
			}
		},
		//value 0 到 100
		setValue:function(value){
			if($.LoadingBox._dialog){
				//设置进度条进度值
				$.LoadingBox.processBar.progressbar("option","value",value);
			}
		},
		autoValue:function(msg){
			//开启
			$.LoadingBox.show(msg);
			//开启自动刷新，0.01秒钟 进度条进度+1
			var fnAuto = function(){
				$.LoadingBox._aboutSetValue();
			};
			$.LoadingBox._intervalId = window.setInterval(fnAuto, 10);
		},
		endAutoValue:function(){
			//关闭自动刷新
			if($.LoadingBox._intervalId != null){
				window.clearInterval($.LoadingBox._intervalId);
				$.LoadingBox._intervalId = null;
			}
		},
		_aboutSetValue:function(){
			var i = $.LoadingBox.processBar.progressbar("option","value");
			if(i<0){
				i = 0;
			}else if(i>99){
				//已经加载到了100,也就意味着 1秒,所以自动关闭
				$.LoadingBox.close(true);
				return;
			}
			$.LoadingBox.setValue(i+1);
		}
	};
	
	/**
	 * 为showInfo 设置close事件
	 */
	$(document).mousedown(function(e){
		if(!info$)return ;
		if(info$.is(":hidden")) return;
		var offset = info$.offset();
		var x = e.clientX;
		var y = e.clientY;
		
		var width = info$.width();
		var hight = info$.height();
		
		if(x < offset.left || x > offset.left + width || y < offset.top || y > offset.top + hight ){
			info$.effect("highlight",{},200,function(){
				info$.hide(300);
			});	
		}
		
	});
	
	
	$.showInfo = function (options) {
		var fnShowInfoOpen = function(){
			//$.debug($.extend({ fun: "$.showInfo" }, options));
			try {
				var opWidth=document.body.clientWidth/2 - 3 + document.body.scrollLeft;
				var opHeight=32+document.body.scrollTop;
				options = $.extend({ 
					info:/*@jquery.ui.vacp_3*/"处理成功!"/*$*/,
					width:opWidth,
					height:opHeight
				},options);
				
				info$.hide();
				//替换回车 为 br
				options.info = options.info.replace("\n","<br/>");
				
				var tmparr = options.info.split("<br");
				var line = tmparr.length;
				var maxLength = 0;
				for(var i = 0;i < line;i++){
					var tmp = tmparr[i].realLength();
					if(tmp > maxLength){
						maxLength = tmp;
					}
				}
				options.width = maxLength * 24+48;
				options.height = line * 32;
				
				var divLeft = document.body.clientWidth/2 - options.width / 2 + document.body.scrollLeft;
				var divTop = options.height / 2 + document.body.scrollTop;
				info$.css({ "position": "absolute","height":options.height,width:options.width,top: divTop, left: divLeft,fontSize:24});
				
				$("#_infospan",info$).empty().append(options.info);
				
				info$.effect("highlight",{},500,function(){
					info$.show();
				});
			} catch (e) {
			}
		};
		setTimeout(fnShowInfoOpen,200);
	};

	$.showError = function (options) {
		$.debug($.extend({ fun: "$.showError" }, options));
		options = $.extend({
			dialogClass: "ui-state-error ui-corner-all",
			//show: 'shake',
			info:"error...",
			position: 'top',
			height: 300,
			width: 400,
			modal: true,
			buttons: {
				/*@common.confirm*/'确认'/*$*/: function () {
					$(this).dialog('destroy');
				}
			}
		}, options);

		var ModelErrordialog$ = $("<div><p ><span  class='ui-icon ui-icon-alert' style='float:left; margin:0 7px 20px 0;'></span><span id='_ErrorDialogInfo' style='word-break: break-all;'></span></p></div>");
		var ModelErrordialogDlg$ = ModelErrordialog$.dialog(options);//构造
		$("#_ErrorDialogInfo",ModelErrordialog$).append(options.info);//设置窗口内容信息
		ModelErrordialogDlg$.dialog("open");//打开
		$.LoadingBox.close(true);//发生错误时关闭进度条。
		return ModelErrordialogDlg$;
	};

})(jQuery);


/**
*下拉框创建者
*/
(function ($) {
	
	$.fn.selectCreater = function(options){
		options = $.extend({ 
			id:null,
			name:false,
			"Class":false,
			please:false,
			beans:this,
			deValue:null,
			bvName:"name",
			bvValue:"value"
		},options);
		var optionLen = 0;
		var sc = $("<select "+(options.name?" name=\""+options.name+"\"":"") +(options.Class?" class=\""+options.Class+"\"":"")+"></select>");
		if(options.id!=null){
			sc.attr("id",options.id);
		}
		var _keyMap = {};
		
		var i,len = options.beans.length;
		optionLen = len;
		var bl = false;
		for(i = 0 ;i < len;i++){
			var e = options.beans[i];
			var name ,value;
			if($.isFunction(options.bvValue)){
				value = options.bvValue.call(e,e);
			}else{
				value = e[options.bvValue];
			}

			if($.isFunction(options.bvName)){
				name = options.bvName.call(e,e);
			}else{
				name = e[options.bvName];
			}
			
			_keyMap[value]=name;
			if(options.deValue==null && i == 0){
				bl = true;
				sc.append("<option selected=\"selected\" value=\""+value+"\">"+name+"</option>");
			}else if(options.deValue == value){
				bl = true;
				sc.append("<option selected=\"selected\" value=\""+value+"\">"+name+"</option>");
			}else{
				sc.append("<option value=\""+value+"\">"+name+"</option>");
			}
			
		};
		if(options.please){
			if(bl==false){
				sc.append("<option selected=\"selected\" value=\"\">"+/*@vacp.ui.jobAdder.js.5*/"请选择"/*$*/+"</option>");
			}else{
				sc.append("<option value=\"\">"+/*@vacp.ui.jobAdder.js.5*/"请选择"/*$*/+"</option>");
			}
			optionLen+=1;
		}
		sc.changeOptions = function(data,deValue){
			try{
				options.deValue = deValue;
			}catch(e){
				options.deValue = null;
			}
			try {
				$(this).children().remove();
			} catch (e) {
			}
			_keyMap = {};
			var bl = false;
			optionLen = data.length;
			for(var iD = 0,iDLen = data.length;iD<iDLen;iD++){
				var e = data[iD];
				var name ,value;
				if($.isFunction(options.bvValue)){
					value = options.bvValue.call(e,e);
				}else{
					value = e[options.bvValue];
				}

				if($.isFunction(options.bvName)){
					name = options.bvName.call(e,e);
				}else{
					name = e[options.bvName];
				}
				
				_keyMap[value]=name;
				if(options.deValue==null && iD == 0){
					bl = true;
					$(this).append("<option selected=\"selected\" value=\""+value+"\">"+name+"</option>");
				}else if(options.deValue == value){
					bl = true;
					$(this).append("<option selected=\"selected\" value=\""+value+"\">"+name+"</option>");
				}else{
					$(this).append("<option value=\""+value+"\">"+name+"</option>");
				}
			}
			
			if(options.please){
				if(bl==false){
					$(this).append("<option selected=\"selected\" value=\"\">"+/*@vacp.ui.jobAdder.js.5*/"请选择"/*$*/+"</option>");
				}else{
					$(this).append("<option value=\"\">"+/*@vacp.ui.jobAdder.js.5*/"请选择"/*$*/+"</option>");
				}
				optionLen+=1;
			}
		},
		sc.newSelection = function(opt){
			var scr = sc.clone();
			opt = $.extend({
				 id:"sId_"+Math.random(),
				 name:false,
				"Class":false,
				 selected:undefined
			},opt); 
			scr.attr("id",opt.id);
			if(opt.name)scr.attr("name",opt.name);
			if(opt.Class)scr.attr("Class",opt.Class);
			if(opt.selected !== undefined){
				$("option[value='"+opt.selected+"']",scr).attr( "selected","selected");
			}
			scr.val = function(value){
				if(value !== undefined){
					$("option[value='"+value+"']",scr).attr( "selected","selected");
				}else{
					return $('option:selected',scr).val(); 
				}
				return value;
			};
			return scr;
		};
		sc.getText = function(value){
			//var opt = $("option[value='"+value+"']",sc);
			//if(opt.length ==0)return value;
			//return opt.text();
			var r = _keyMap[value];
			return r?r:"";
		};
		sc.getOptionLen = function(){
			return optionLen;
		};
		return sc;
	};

})(jQuery);
