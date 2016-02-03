// Decompiled by DJ v3.7.7.81 Copyright 2004 Atanas Neshkov  Date: 2010-5-24 12:36:07
// Home Page : http://members.fortunecity.com/neshkov/dj.html  - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   DefaultDebugPageGenerator.java

package org.directwebremoting.impl;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringWriter;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.directwebremoting.WebContext;
import org.directwebremoting.WebContextFactory;
import org.directwebremoting.extend.AccessControl;
import org.directwebremoting.extend.ConverterManager;
import org.directwebremoting.extend.Creator;
import org.directwebremoting.extend.CreatorManager;
import org.directwebremoting.extend.DebugPageGenerator;
import org.directwebremoting.util.CopyUtils;
import org.directwebremoting.util.JavascriptUtil;
import org.directwebremoting.util.LocalUtil;

public class IcbcDebugPageGenerator implements DebugPageGenerator {
 
	public IcbcDebugPageGenerator() {
		converterManager = null;
		creatorManager = null;
		accessControl = null;
		availableLibraries = null;
	}
	private String webroot = null;

	public String generateIndexPage(String root) throws SecurityException {
		
		setWebRoot();
		if (!creatorManager.isDebug()) {
			log.warn("Failed attempt to access test pages outside of debug mode. Set the debug init-parameter to true to enable.");
			throw new SecurityException("Access to debug pages is denied.");
		}
		//String dse_sessionId = getDseSessionId();
		StringBuffer buffer = new StringBuffer();
		buffer.append("<html>\n");
		buffer.append("<head><title>DWR Test Index</title></head>\n");
		buffer.append("<body>\n");
		buffer.append("<h2>Classes known to DWR:</h2>\n");
		buffer.append("<ul>\n");
		for (Iterator<?> i$ = creatorManager.getCreatorNames(false).iterator(); i$.hasNext(); buffer.append(")</li>\n")) {
			String name = (String) i$.next();
			Creator creator = creatorManager.getCreator(name, false);
			buffer.append("<li><a href='");
			buffer.append(root);
			buffer.append(testHandlerUrl);
			buffer.append(name);
			//buffer.append("?dse_sessionId="+dse_sessionId);
			buffer.append("'>");
			buffer.append(name);
			buffer.append("</a> (");
			buffer.append(creator.getType().getName());
		}

		buffer.append("</ul>\n");
		buffer.append("<div id='dwr-debug'></div>\n");
		buffer.append("</body></html>\n");
		return buffer.toString();
	}

	private void setWebRoot() {
		if(webroot == null) {
			WebContext webcx = WebContextFactory.get();
			webroot = webcx.getContextPath();
		}
	}
	
//	
//	private String getDseSessionId() {
//		//HttpServletRequest req = webcx.getHttpServletRequest();
//		String dse_sessionId = null;
//		
////		try {
////			dse_sessionId  = (String)req.getParameter(CTPKey.SESSIONID);
////			if(dse_sessionId == null){
////				dse_sessionId  = (String)req.getAttribute(CTPKey.SESSIONID);
////				if(dse_sessionId == null) {
////					dse_sessionId = CtpDseSession.getCurrSession().getDseSessionId();
////				}
////			}
////			if(dse_sessionId == null)
////				throw new Exception("dse_sessionId is null.");
////		} catch (Exception e) {
////			log.warn("dse_sessionId is null.");
////		}
//		
//		return dse_sessionId;
//	}

	public String generateTestPage(String root, String scriptName) throws SecurityException {
		setWebRoot();
		
		if (!creatorManager.isDebug()) {
			log.warn("Failed attempt to access test pages outside of debug mode. Set the debug init-parameter to true to enable.");
			throw new SecurityException("Access to debug pages is denied.");
		}
		//String dse_sessionId = getDseSessionId();
		
		String interfaceURL = root + interfaceHandlerUrl + scriptName + ".js";
		String engineURL = root + engineHandlerUrl;
		String utilURL = root + utilHandlerUrl;
		String proxyInterfaceURL = ".." + interfaceHandlerUrl + scriptName + ".js";
		String proxyEngineURL = ".." + engineHandlerUrl;
	//	String proxyUtilURL = ".." + utilHandlerUrl;
		Creator creator = creatorManager.getCreator(scriptName, true);
		Method methods[] = creator.getType().getDeclaredMethods();
		StringBuffer buffer = new StringBuffer();
		buffer.append("<html>\n");
		buffer.append("<head>\n");
		buffer.append("  <title>" + scriptName + "</title>\n");
		buffer.append("  <!-- These paths use .. so that they still work behind a path mapping proxy. The fully qualified version is more cut and paste friendly. -->\n");
		buffer.append("<link href=\""+webroot+"/css/jquery-ui.css\" rel=\"stylesheet\" type=\"text/css\" />\n");
		buffer.append("<script src=\""+webroot+"/js/angular.js\" type=\"text/javascript\"  charset=\"GB18030\"></script>\n");
		buffer.append("<script type='text/javascript' src='" + proxyEngineURL + "'></script>\n");	
		//buffer.append("<script src=\""+webroot+"/js/dwr.$qcall.js\" type=\"text/javascript\"></script>\n");
		//buffer.append("<script>function dwrHeaders(){dwr.engine.setHeaders({'dse_sessionId':'"+dse_sessionId+"','netType':'0','vacpAreaId':'"+areadId+"','vacpRoleId':'"+roleId+"','vacpUserId':'"+userId+"','vacpAppId':'"+vacpAppId+"','vacpEnvId':'"+vacpEnvId+"'});}\n dwrHeaders();</script>\n");
		buffer.append("<script type='text/javascript' src='" + proxyInterfaceURL + "'></script>\n");
		buffer.append("<script type='text/javascript' src='"+webroot+"/dwr/interface/IcbcUtil.js'></script>\n");
		//buffer.append("<script type='text/javascript' src='"+webroot+"/dwr?ctpSessionScript=true&"+CTPKey.SESSIONID+"="+dse_sessionId+"'></script>\n");
		buffer.append("<script type='text/javascript' src='"+webroot+"/js/jquery/jquery.js'></script>\n");
		buffer.append("<script type='text/javascript' src='"+webroot+"/js/jquery.o2es.js'></script>\n");
		buffer.append("<script src=\""+webroot+"/js/jqueryui/jquery-ui.js\" type=\"text/javascript\"></script>\n");
	//	buffer.append("<script src=\""+webroot+"/js/public/jquery.bgiframe.js\" type=\"text/javascript\" ></script>\n");
		buffer.append("<script src=\""+webroot+"/js/jquery.ui.eMerchant.js\" type=\"text/javascript\"  charset=\"GB18030\"></script>\n");
		buffer.append("<script language=\"JavaScript\" src=\""+webroot+"/js/icbc.util.js\"  charset=\"GB18030\"></script>\n");
		buffer.append("<script type='text/javascript' src='"+webroot+"/js/dwr.util.js'></script>\n");
		
	//	buffer.append("<script type='text/javascript' src='" + proxyUtilURL + "'></script>\n");
		buffer.append("<script type='text/javascript'>\n");
		buffer.append("window.JsDebug = true;");
		//buffer.append("dwr.util.useLoadingMessage('加载中...');");

		buffer.append("  function objectEval(text)\n");
		buffer.append("  {\n");
		buffer.append("    // eval() breaks when we use it to get an object using the { a:42, b:'x' }\n");
		buffer.append("    // syntax because it thinks that { and } surround a block and not an object\n");
		buffer.append("    // So we wrap it in an array and extract the first element to get around\n");
		buffer.append("    // this.\n");
		buffer.append("    // This code is only needed for interpreting the parameter input fields,\n");
		buffer.append("    // so you can ignore this for normal use.\n");
		buffer.append("    // The regex = [start of line][whitespace]{[stuff]}[whitespace][end of line]\n");
		buffer.append("    text = text.replace(/\\n/g, ' ');\n");
		buffer.append("    text = text.replace(/\\r/g, ' ');\n");
		buffer.append("    if (text.match(/^\\s*\\{.*\\}\\s*$/))\n");
		buffer.append("    {\n");
		buffer.append("      text = '[' + text + '][0]';\n");
		buffer.append("    }\n");
		buffer.append("    return eval(text);\n");
		buffer.append("  }\n");
		buffer.append("  </script>\n");
		buffer.append("  <style>\n");
		buffer.append("    input.itext { font-size: smaller; background: #E4E4E4; border: 0; }\n");
		buffer.append("    input.ibutton { font-size: xx-small; border: 1px outset; margin: 0px; padding: 0px; }\n");
		buffer.append("    span.reply { background: #ffffdd; white-space: pre; }\n");
		buffer.append("    span.warning { font-size: smaller; color: red; }\n");
		buffer.append("  </style>\n");
		
		buffer.append("\r\n" + 
				"	<script language=\"javascript\">\r\n" + 
				"	var dwrmodle =	angular.module(\"dwr.debug\",['$dwr']);\r\n" + 
				"	dwrmodle.controller('"+scriptName+"Ctrl',['$scope','$dwr','"+scriptName+"','dwrUtil',function($scope,dwr,"+scriptName+",dwrUtil){\r\n" + 
				"			var click = function(type,name,i,parmlen){\r\n" + 
				"				var parms = [], j,level,span;\r\n" + 
				"				for(j = 0;j < parmlen;j++){\r\n" + 
				"					parms[j] = $scope['ngm'+i+\"_\"+j];\r\n" + 
				"				}\r\n" + 
				"				level = $scope['level'+i];\r\n" + 
				"				parms[parms.length] = function(data){\r\n" + 
				"					$scope.$apply(function () {\r\n" + 
				"						if(type == 'executeClick'){\r\n" + 
				"							$scope['span'+i] = dwr.util.toDescriptiveString(data,level);\r\n" + 
				"						}else{\r\n" + 
				"							$scope['span'+i] = toEvalString(data);\r\n" +
				"						}\r\n" + 
				"						$scope['show'+i] = true;\r\n" + 
				"					})\r\n" + 
				"				}\r\n" + 
				"				var res = "+scriptName+"[name].apply("+scriptName+",parms);\r\n" + 
				"			};\r\n" + 
				"\r\n" + 
				"			$scope.executeClick = function(name,i,parmlen){\r\n" + 
				"				click('executeClick',name,i,parmlen);\r\n" + 
				"			};\r\n" + 
				"			$scope.evalStringClick = function(name,i,parmlen){\r\n" + 
				"				click('evalStringClick',name,i,parmlen);\r\n" + 
				"			};\r\n" + 
				"			$scope.clearClick = function(name,i,parmlen){\r\n" + 
				"				$scope['span'+i] = \"\";\r\n" +
				"				$scope['show'+i] = false;" + 
				"			};\r\n" + 
				"		}]);\r\n" + 
				"	</script>");
		
		buffer.append("</head>\n");
		buffer.append("<body ng-app=\"dwr.debug\" >\n");
		buffer.append("<h2>Methods For: " + scriptName + " +" + creator.getType().getName() + ")</h2>\n");
		buffer.append("<p>To use this class in your javascript you will need the following script includes:</p>\n");
		buffer.append("<pre>\n");
		buffer.append("  &lt;script type='text/javascript' src='<a href='" + engineURL + "'>" + engineURL).append("</a>'&gt;&lt;/script&gt;\n"); 
		//buffer.append("  &lt;script type='text/javascript' src='<a href='"+webroot+"/js/dwr.$qcall.js'>\""+webroot+"\"/js/dwr.$qcall.js").append("</a>'&gt;&lt;/script&gt;\n");
		buffer.append("  &lt;script type='text/javascript' src='<a href='" + interfaceURL + "'>" +  interfaceURL).append("</a>'&gt;&lt;/script&gt;\n");
		buffer.append("</pre>\n");
		buffer.append("<p>In addition there is an optional utility script:</p>\n");
		buffer.append("<pre>\n");
		buffer.append("  &lt;script type='text/javascript' src='<a href='" + utilURL + "'>" + utilURL + "</a>'&gt;&lt;/script&gt;\n");
		buffer.append("</pre>\n");
		buffer.append("<p>Replies from DWR are shown with a yellow background if they are simple or in an alert box otherwise.<br/>\n");
		buffer.append("The inputs are evaluated as Javascript so strings must be quoted before execution.</p>\n");
		
		buffer.append("<div ng-controller=\""+scriptName+"Ctrl\">\n");
		buffer.append("<ul>\n");
		
		for (int i = 0; i < methods.length; i++) {
			Method method = methods[i];
			String methodName = method.getName();
			
			boolean overloaded = false;
			for (int j = 0; j < methods.length; j++) {
				if (j != i && methods[j].getName().equals(methodName)) {
					overloaded = true;
					break;
				}
			}
			//do not show overloaded method
			if (overloaded)
				continue;
			
			if (JavascriptUtil.isReservedWord(methodName)) {
				buffer.append("<li style='color: #88A;'>" + scriptName + "." + methodName + "() is not available because it is a reserved word.</li>\n");
				continue;
			}
			buffer.append("<li>\n");
			buffer.append("  " + scriptName + "." + methodName + '(');
			Class<?> paramTypes[] = method.getParameterTypes();
			int idx = 0;
			for (int j = 0; j < paramTypes.length; j++,idx++) {
				Class<?> paramType = paramTypes[j];
				//CtpDseSession bean 自动注入
				if (LocalUtil.isServletClass(paramType) ) {//TODO add token验证规则
					buffer.append("AUTO");
				} else {
					String value = "";
					if (paramType == String.class)
						value = "\"\"";
					else if (paramType == Boolean.class || paramType == Boolean.TYPE)
						value = "true";
					else if (paramType == Integer.class || paramType == Integer.TYPE || paramType == Short.class || paramType == Short.TYPE
							|| paramType == Long.class || paramType == Long.TYPE || paramType == Byte.class || paramType == Byte.TYPE)
						value = "0";
					else if (paramType == Float.class || paramType == Float.TYPE || paramType == Double.class || paramType == Double.TYPE)
						value = "0.0";
					else if (paramType.isArray() || java.util.Collection.class.isAssignableFrom(paramType))
						value = "[]";
					else if (java.util.Map.class.isAssignableFrom(paramType))
						value = "{}";
					String ngm = "ngm"+i+"_"+idx;
					buffer.append("    <input class='itext' type='text' size='5' ng-model='")
					.append(ngm).append("'"+ ("".equals(value)?"":" ng-init='"+ngm+"="+value)+"' title='Will be converted to: ")
					.append(paramType.getName())
					.append("'/>");
				}
				buffer.append(j != paramTypes.length - 1 ? ", \n" : "");
			}

			buffer.append("  );\n");
			//String onclick = "dwrHeaders();";
			String onclick = "";
			onclick += scriptName + '.' + methodName + "(";
			for (int j = 0; j < paramTypes.length; j++)
				if (!(LocalUtil.isServletClass(paramTypes[j]) )) //TODO add token验证
					onclick = onclick + "objectEval($(\"#p" + i + "" + j + "\").val()), ";
 
			buffer.append("Disp Level")
			.append("<input type='text' size='2'  ng-model=\"level"+i+"\" ng-init=\"level"+i+"=5\" /> " +
					"<input class='ibutton' type='button' ng-click=\"executeClick('"+methodName+"',"+i+","+idx+")\""
					+ " value='Execute'  title='Calls " + scriptName + '.' + methodName + "(). View source for details.'/>\n");
			
			buffer.append("<input  class='ibutton' type='button'  ng-click=\"evalStringClick('"+methodName+"',"+i+","+idx+")\" value='evalString'/>\n");
 	
			buffer.append("<input  class='ibutton' type='button' ng-click=\"clearClick("+methodName+","+i+","+idx+")\" value='Clear'/>\n");
 
			buffer.append("<br/>  <span ng-show='show"+i+"' ng-init='show"+i+" =false;' ng-bind=\"span"  +i + "\" class='reply'></span>\n");
			
			Class<?> arr$[] = paramTypes;
			int len$ = arr$.length;
			for (int i$ = 0; i$ < len$; i$++) {
				Class<?> paramType1 = arr$[i$];
				if (!converterManager.isConvertable(paramType1))
					buffer.append("<br/><span class='warning'>(Warning: No Converter for " + paramType1.getName()
							+ ". See <a href='#missingConverter'>below</a>)</span>\n");
			}

			if (!converterManager.isConvertable(method.getReturnType()))
				buffer.append("<br/><span class='warning'>(Warning: No Converter for " + method.getReturnType().getName()).append(
						". See <a href='#missingConverter'>below</a>)</span>\n");
//			try {
//				accessControl.assertIsDisplayable(creator, scriptName, method);
//			} catch (SecurityException ex) {
//				buffer.append("<br/><span class='warning'>(Warning: " + methodName + "() is excluded: " + ex.getMessage()
//						+ ". See <a href='#excludedMethod'>below</a>)</span>\n");
//			}
			buffer.append("</li>\n");
		}

		buffer.append("</ul>\n");
		buffer.append("</div>\n");
		
		buffer.append("<h2>Other Links</h2>\n");
		buffer.append("<ul>\n");
		buffer.append("<li>Back to <a href='" + root + "/'>class index</a>.</li>\n");
		buffer.append("</ul>\n");
		synchronized (scriptCache) {
			String output = (String) scriptCache.get("/help.html");
			if (output == null) {
				java.io.InputStream raw = getClass().getResourceAsStream("/org/directwebremoting/help.html");
				if (raw == null) {
					log.error("Missing file /help.html. Check the dwr.jar file was built to include html files.");
					output = "<p>Failed to read help text from resource file. Check dwr.jar is built to include html files.</p>";
				} else {
					BufferedReader in = new BufferedReader(new InputStreamReader(raw));
					try {
						StringWriter writer = new StringWriter();
						CopyUtils.copy(in, writer);
						output = writer.toString();
					} catch (IOException ex) {
						log.error("Failed to read help text from resource file.", ex);
						output = "Failed to read help text from resource file.";
					}
				}
				scriptCache.put("/help.html", output);
			}
			buffer.append(output);
		}
		buffer.append("<div id='dwr-debug'></div>\n");
		buffer.append("</body></html>\n");
		return buffer.toString();
	}

	/**
	 * @deprecated Method generateInterfaceUrl is deprecated
	 */

	public String generateInterfaceUrl(String root, String scriptName) {
		return root + interfaceHandlerUrl + scriptName + ".js";
	}

	/**
	 * @deprecated Method generateEngineUrl is deprecated
	 */

	public String generateEngineUrl(String root) {
		return root + engineHandlerUrl;
	}

	/**
	 * @deprecated Method generateLibraryUrl is deprecated
	 */

	public String generateLibraryUrl(String root, String library) {
		return root + library;
	}

	/**
	 * @deprecated Method getAvailableLibraries is deprecated
	 */

	public Collection<String> getAvailableLibraries() {
		if (availableLibraries == null)
			availableLibraries = Collections.unmodifiableCollection(Arrays.asList(new String[] { utilHandlerUrl }));
		return availableLibraries;
	}

	public void setConverterManager(ConverterManager converterManager) {
		this.converterManager = converterManager;
	}

	public void setCreatorManager(CreatorManager creatorManager) {
		this.creatorManager = creatorManager;
	}

	public void setAccessControl(AccessControl accessControl) {
		this.accessControl = accessControl;
	}

	public void setEngineHandlerUrl(String engineHandlerUrl) {
		this.engineHandlerUrl = engineHandlerUrl;
	}

	public void setUtilHandlerUrl(String utilHandlerUrl) {
		this.utilHandlerUrl = utilHandlerUrl;
	}

	public void setTestHandlerUrl(String testHandlerUrl) {
		this.testHandlerUrl = testHandlerUrl;
	}

	public void setInterfaceHandlerUrl(String interfaceHandlerUrl) {
		this.interfaceHandlerUrl = interfaceHandlerUrl;
	}

	protected String engineHandlerUrl;
	protected String utilHandlerUrl;
	protected String testHandlerUrl;
	protected String interfaceHandlerUrl;
	protected ConverterManager converterManager;
	protected CreatorManager creatorManager;
	protected AccessControl accessControl;
	protected final Map<String, String> scriptCache = new HashMap<String, String>();
	private Collection<String> availableLibraries;
	private static final Log log = LogFactory.getLog(IcbcDebugPageGenerator.class);

}
