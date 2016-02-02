package org.directwebremoting;

import org.directwebremoting.extend.Call;
import org.directwebremoting.extend.MethodDeclaration;
import org.directwebremoting.extend.Module;
import org.directwebremoting.extend.Reply;
import org.directwebremoting.impl.DefaultRemoter;
import org.directwebremoting.util.JavascriptUtil;
import org.directwebremoting.util.LocalUtil;
 

/** 
 * 
 * @author kfzx-niebo
 * @createDate 
 */
public class AngularRemoter extends DefaultRemoter  {

	public int getMaxCallCount() {
		return this.maxCallCount;
	}

	 /* (non-Javadoc)
     * @see org.directwebremoting.extend.Remoter#generateInterfaceScript(java.lang.String, java.lang.String, java.lang.String)
     */
	@Override
    public String generateInterfaceJavaScript(String scriptName, String indent, String assignVariable, String contextServletPath) throws SecurityException
    {
        StringBuilder buffer = new StringBuilder();
        buffer.append(indent + assignVariable + " = {};\n");
        buffer.append("var cn = \""+scriptName+"\";\n");
        Module module = moduleManager.getModule(scriptName, false);

        MethodDeclaration[] methods = module.getMethods();
        for (MethodDeclaration method : methods)
        {
            String methodName = method.getName();

            // Is it on the list of banned names
            if (JavascriptUtil.isReservedWord(methodName))
            {
                continue;
            }

            Class<?>[] paramTypes = method.getParameterTypes();
            // Create the function definition
            buffer.append(indent + assignVariable + "." + methodName + " = function(");
            for (int j = 0; j < paramTypes.length; j++)
            {
                if (!(LocalUtil.isServletClass(paramTypes[j]) )) //TODO 检查 token
                {
                    buffer.append("p");
                    buffer.append(j);
                    buffer.append(", ");
                }
            }
            buffer.append("cb) {\n");

            // The method body calls into engine.js
            buffer.append(indent + "  return ");
            buffer.append("dwr.$qcall.call");
            buffer.append("(");
            buffer.append(assignVariable);
            buffer.append(",cn,'");
            buffer.append(methodName);
            buffer.append("\', arguments,cb);\n");
            buffer.append(indent + "};\n");
            
            //set className and methodName
            buffer.append(assignVariable + "." + methodName + ".className = cn;\n");
            buffer.append(assignVariable + "." + methodName + ".methodName = \""+methodName+"\";\n");
            
        }

        return buffer.toString();
    }
 
	/**
	 * catche 掉所有异常，并将异常作为Reply返回给浏览器
	 * @param call
	 * @return
	 */
	private Reply executeCatchExecption(Call call){
		Reply r;
		try{
			r = super.execute(call);
			if(r.getThrowable() != null){
				r = new Reply(call.getCallId(), new DwrExceptionInfo(r.getThrowable()));
			}
			return r;
		}catch (Exception e) {
			r = new Reply(call.getCallId(), new DwrExceptionInfo(e));
			return r;
		}
		 
	}
	//private ISessionManager manager = null;
	@Override
	public Reply execute(final Call call) {
//		HttpServletRequest req = WebContextFactory.get().getHttpServletRequest();
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
//		
//		String clientIp = getRemoteAddr(req);
//		//IcbcUtil.encodePass 在登陆前调用 无session
//		if(!( call.getScriptName().equals("IcbcUtil") && call.getMethodName().equals("encodePass"))){
//			
//			//添加ctpsession数据
//			CtpRequestServlet.addSystemData(req);
//			
//			IChannelSession session = null;
//			try {
//				if(manager == null) {
//					manager = (ISessionManager) FileSystemXmlApplicationContext.get("sessionManager");
//				}
//				//获取session后ctp会自动更新session超时时间。
//				session = manager.getSession(dse_sessionId);
//				session.setLastAccessTime(System.currentTimeMillis());
//			} catch (Exception e) { 
//				return new Reply(call.getCallId(), new DwrExceptionInfo(e));
//			}
//			//注入 ctpsession 数据
//			if(dse_sessionId != null) {
//				SystemRuntimeDataHelper srdh = SystemRuntimeDataHelper.getCurInstance();
//				CtpDseSession dwrCtpSession = CtpDseSession.getCurrSession();
//				dwrCtpSession.setClientIp(clientIp);
//				if(!dse_sessionId.equals(dwrCtpSession.getDseSessionId())){
//					//sessionId不一致 清理数据后重新设置
//					dwrCtpSession.clearData();
//					
//					dwrCtpSession.setDseSessionId(dse_sessionId);
//					dwrCtpSession.setUserId(srdh.getUserId());
//					dwrCtpSession.setSession(session);
//					try{
//						Object user=session.getSessionContext().getValueAt("user");
//						dwrCtpSession.setUserBean((UserBean) user);
//						Object local = session.getSessionContext().getValueAt("Language");
//						if(local != null) {
//							dwrCtpSession.setLocale(local.toString());
//						}
//					}catch(Exception e){}
//				}
//			}
//
//		}
		return executeCatchExecption(call);
		
		
	}
	 
}
