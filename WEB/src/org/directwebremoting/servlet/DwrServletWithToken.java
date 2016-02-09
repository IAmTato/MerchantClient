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
		super.doPost(req, resp); 
	}
	 
}
