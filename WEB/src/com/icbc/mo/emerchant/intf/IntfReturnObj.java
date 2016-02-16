package com.icbc.mo.emerchant.intf;

import com.icbc.IcbcUtil;

public class IntfReturnObj {
	public boolean isRes() {
		return res;
	}
	public IntfReturnObj(boolean res, Object data, String errMsg, String trace, boolean isAuthErr) {
		super();
		this.res = res;
		this.data = data;
		this.errMsg = errMsg;
		this.trace = trace;
		this.isAuthErr = isAuthErr;
	}
	
	/**
	 * 调用成功时使用该函数构造返回对象
	 * @param succobj
	 */
	public IntfReturnObj(Object succobj) {
		this(true,succobj ,null,null,false);
	}
	
	/**
	 * 调用异常是使用
	 * @param throwable
	 * @param isAuthErr2
	 */
	public IntfReturnObj(Throwable throwable, boolean isAuthErr) {
		this(false,null ,throwable.getMessage(),IcbcUtil.Execption2String(throwable),isAuthErr);
	}
	
	public IntfReturnObj() {
	}
	public void setRes(boolean res) {
		this.res = res;
	}
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}
	public String getErrMsg() {
		return errMsg;
	}
	public void setErrMsg(String errMsg) {
		this.errMsg = errMsg;
	}
	public String getTrace() {
		return trace;
	}
	public void setTrace(String trace) {
		this.trace = trace;
	}
	public boolean isAuthErr() {
		return isAuthErr;
	}
	public void setAuthErr(boolean isAuthErr) {
		this.isAuthErr = isAuthErr;
	}
	private boolean res;
	private Object data;
	private String errMsg;
	private String trace;
	private boolean isAuthErr;
}
