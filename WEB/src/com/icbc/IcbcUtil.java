/*
 *  
 */
package com.icbc;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.Arrays;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ScheduledExecutorService;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.UserTransaction;

import org.apache.commons.lang.math.RandomUtils;
import org.directwebremoting.SyncRemoter;
import org.directwebremoting.impl.StartupUtil;
 

/**
 * @author kfzx-niebo
 * 
 */
public class IcbcUtil { 
	/**
	 * 
	 * 将trace答应到 string中。 
	 * <pre>
	 *
	 * </pre>
	 * @param rep
	 * @param execptions
	 * @return
	 */
	public static String Execption2String(Throwable... execptions) {
		return Execption2String(false, execptions);
	}
	
	/**
	 * 
	 * 将trace答应到 string中。 
	 * <pre>
	 *
	 * </pre>
	 * @param rep
	 * @param execptions
	 * @return
	 */
	public static String Execption2String(boolean rep, Throwable... execptions) {
		StringWriter sw = new StringWriter();
		PrintWriter pw = new PrintWriter(sw);
		for (Throwable e : execptions) {
			e.printStackTrace(pw);
		}
		if (rep) {
			return sw.toString().replaceAll("\r\n|\n\r|\r|\n", "<br/>\n");
		}
		return sw.toString();
	}
	
	 
	 

	

	/**
	 * 替换 {-\d-} 内容
	 * 
	 * @param str
	 *            需要替换的内容
	 * @param args
	 *            替换列表
	 * @return
	 */
	public static String replaceJava(String str, String... args) {
		if (args == null || args.length == 0)
			return str;
		String tempArg ;
		for (int i = 0, iLen = args.length; i < iLen; i++) {
			//tempArg = args[i].replace("$", "\\$");
			tempArg = Matcher.quoteReplacement(args[i]);
			str = str.replaceAll("\\{\\-" + i + "\\-\\}", tempArg);
		}
		return str;
	}
  
	public static int getRandomNum(int max){
		return RandomUtils.nextInt(max);
	}



	private static UserTransaction utx;

	public static UserTransaction getUtx() {
		if (utx == null) {
			InitialContext ctx;
			try {
				ctx = new InitialContext();
				utx = (UserTransaction) ctx.lookup("java:comp/UserTransaction");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return utx;
	}
 
 
	
	private static ScheduledExecutorService scheduledService = null;

	public static void shutdownScheduledService() {
		if(scheduledService != null) {
			scheduledService.shutdown();
		}
	}
	 

	/**
	 * @return 获取dwr的 最大调用数。
	 */
	public static int getDwrMaxCallCount() {
		SyncRemoter sr = (SyncRemoter) StartupUtil.getSingletonServerContext().getContainer().getBean("org.directwebremoting.extend.Remoter");
		return sr.getMaxCallCount();
	}


	/**
	 * 获取当前文件下次数
	 * 
	 * @return
	 * ServerJobPkgCallable已迁移到slave此处废除 js
	 */ 
	public static long getDownloadCount() {
		return 0;
		//return ServerJobPkgCallable.getDownloadCount();
	}

	/**
	 * 将 list 字符串格式输出打印
	 * 
	 * @param list
	 * @return
	 */
	public static String listTransform(List<?> list) {
		if (list == null)
			return "null";
		return Arrays.toString(list.toArray());
	}

	public static String setTransform(Set<?> set) {
		if (set == null)
			return "null";
		return Arrays.toString(set.toArray());
	}
	/**
	 * null 转换为 ""
	 * @param str
	 * @return
	 */
	public static String nullString2Empty(String str) {
		if(str == null) return "";
		return str;
	}
	
	/**
	 * 获取客户端IP地址(2015-1-23配合F5的SNAT改造)
	 * 
	 * @param request
	 * @return
	 */
	public static String getRemoteAddr(HttpServletRequest request) {
		if (request.getHeader("X-Forwarded-For") == null || "".equals(request.getHeader("X-Forwarded-For"))) {
			return request.getRemoteAddr();
		} else {
			return request.getHeader("X-Forwarded-For");
		}
	}
	
	public static boolean mactchStr(String matchStr,String checkVal){
		 Pattern p = Pattern.compile(matchStr);
		 Matcher m = p.matcher(checkVal);
		 return m.matches();
	} 
	
}
