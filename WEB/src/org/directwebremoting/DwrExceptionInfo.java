package org.directwebremoting;

import com.icbc.IcbcUtil;

/**
 * 当dwr方法调用过程发生异常的时候 返回对象，用户页面查证。
 * @author kfzx-niebo
 *
 */
public class DwrExceptionInfo {
	final private boolean hasDwrExecption_ = true;
	private String message ;
	private String trace;
	public DwrExceptionInfo(Throwable throwable) {
		if(throwable == null) return;
		message = throwable.getMessage();
		trace = IcbcUtil.Execption2String(throwable); 
	}

 
	public String getMessage() {
		return message;
	}
	public String getTrace() {
		return trace;
	}

	public boolean isHasDwrExecption_() {
		return hasDwrExecption_;
	}
}
