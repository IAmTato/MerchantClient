package org.directwebremoting.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name="dwrservlet",urlPatterns="/dwr/*")
public class DwrServletWithToken extends DwrServlet {
	private static final long serialVersionUID = 5404120223558420816L;
	String webDebug = null;
	//private ISessionManager manager;
	/**
	 * 处理ctpSession等内容
	 */
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		if(webDebug == null) {
			//webDebug =  CTEConstance.getEnvProperty("webDebug");
		}
		
		//js文件不需要检查session,
		if(req.getRequestURI().endsWith(".js")) {
			super.doPost(req, resp);
			return ;
		}
//		String dse_sessionId = req.getHeader(CTPKey.SESSIONID);
//		if(dse_sessionId==null){
//			dse_sessionId = req.getParameter(CTPKey.SESSIONID);
//			if(dse_sessionId==null){
//				dse_sessionId = (String)req.getAttribute(CTPKey.SESSIONID);
//				if(dse_sessionId == null) {
//					dse_sessionId = CtpDseSession.getCurrSession().getDseSessionId();
//				}
//			}
//		}
//		if(dse_sessionId!=null){
//			req.setAttribute(CTPKey.SESSIONID, dse_sessionId);
//			try {
//				if(manager == null) {
//					manager = (ISessionManager) FileSystemXmlApplicationContext.get("sessionManager");
//				}
//				//获取session后ctp会自动更新session超时时间。
//				IChannelSession session = manager.getSession(dse_sessionId);
//				session.setLastAccessTime(System.currentTimeMillis());
//			} catch (Exception e) { 
//				returnSessionErr(resp);
//				return ;
//			}
//		}else {
//			//当dwr调用为 文件上传类型调用时 无法在request获取sessionid 所以，放过dwr调用的请求，在SyncRemoter做session检查。
//			if(req.getRequestURI().indexOf("call") < 0) {
//				returnSessionErr(resp);
//				return ;
//			}
//		}
		
//		//写入session到headers的js文件  **/dwr?ctpSessionScript=true&dse_sessionId=xxxxxxxxxxxxxx
//		String ctpSessionFlag = req.getParameter("ctpSessionScript");
//		if(ctpSessionFlag != null && !ctpSessionFlag.equals("")) {
//			ServletOutputStream out = resp.getOutputStream();
//			resp.resetBuffer();
//			resp.setContentType( "text/javascript");
//		//	out.println("dwr.engine.setHeaders({\""+CTPKey.SESSIONID+"\":\""+dse_sessionId+"\"});");
//			out.println("window.JsDebug="+webDebug+";");
//			out.flush();
//			out.close();
//			resp.setStatus(200);
//			return ;
//		}
		

//		//如果直接输入 **/dwr?dse_sessionId自动跳转到 **/dwr/index.html?dse_sessionId=xxx
//		if(dealDwrIndexHtml(req, resp, dse_sessionId)) {
//			resp.setStatus(200);
//			return ;
//		}
	//	CTEConstance.getCurrentTime(fmt)
		super.doPost(req, resp);
	//	处理完一个请求清理线程数据
	//	CtpDseSession.getCurrSession().clearData();
	}
	
//	private void returnSessionErr(HttpServletResponse resp) throws IOException {
//		ServletOutputStream out = resp.getOutputStream();
//		resp.resetBuffer();
//		resp.setContentType( "text/html");
//		out.println("session time out!"); 
//		out.flush();
//		out.close();
//		resp.setStatus(200);
//	}
//	
//	private boolean dealDwrIndexHtml(HttpServletRequest request, HttpServletResponse response,String dse_sessionId) {
//		String pathInfo = request.getPathInfo();
//        String requestContextPath = request.getContextPath();
//
//        try {
//        	if (pathInfo == null || pathInfo.length() == 0 || "/".equals(pathInfo))
//        	{
//				response.sendRedirect(requestContextPath + request.getServletPath() + "/index.html?dse_sessionId="+dse_sessionId);
//				return true;
//        	}
//        } catch (IOException e) {
//			e.printStackTrace();
//		}
//        return false;
//	}
	
}
