package org.directwebremoting;

import org.directwebremoting.emerchant.TokenIdNullException;
import org.directwebremoting.emerchant.TokenNotExistsException;
import org.directwebremoting.extend.Call;
import org.directwebremoting.extend.MethodDeclaration;
import org.directwebremoting.extend.Module;
import org.directwebremoting.extend.Reply;
import org.directwebremoting.impl.DefaultRemoter;
import org.directwebremoting.util.JavascriptUtil;
import org.directwebremoting.util.LocalUtil;

import com.icbc.IcbcUtil;
import com.icbc.mo.emerchant.intf.IntfReturnObj;
import com.icbc.mo.emerchant.store.HsTrStoreTokenInfo;
 

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
                if (!(LocalUtil.isServletClass(paramTypes[j])|| paramTypes[j].equals(HsTrStoreTokenInfo.class))) 
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
			if(r != null && r.getReply() instanceof IntfReturnObj) {
				return r;
			}
			if(r.getThrowable() != null){
				System.err.println(IcbcUtil.Execption2String(r.getThrowable()));
				boolean isAuthErr = false;
				if(r.getThrowable() instanceof TokenNotExistsException ||r.getThrowable() instanceof TokenIdNullException ) {
					isAuthErr = true;
				}
				r = new Reply(call.getCallId(), new IntfReturnObj(r.getThrowable(),isAuthErr));
				return r;
			}
			return new Reply(call.getCallId(), new IntfReturnObj(r.getReply()));
		}catch(TokenNotExistsException tokenNotExists) {
			return new Reply(call.getCallId(), new IntfReturnObj(tokenNotExists,true));
		}catch(TokenIdNullException tokenNull) {
			return new Reply(call.getCallId(), new IntfReturnObj(tokenNull,true));
		}
		catch (Exception e) {
			r = new Reply(call.getCallId(), new DwrExceptionInfo(e));
			return r;
		}
	}

	@Override
	public Reply execute(final Call call) {
		return executeCatchExecption(call);
	}
	 
}
