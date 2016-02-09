package com.icbc.mo.emerchant.intf;

import com.icbc.mo.emerchant.store.HsTrStoreTokenInfo;
import com.icbc.mo.emerchant.store.controller.HsTrStoreTokenInfoManager;
import com.icbc.mo.emerchant.user.HsTrStoreUser;
import com.icbc.mo.emerchant.user.controller.HsTrStoreUserManager;

/**
 * 登陆接口
 * 
 * @author gyyz-bobbynie
 * 
 */
public class AuthIntf {
	private static HsTrStoreTokenInfoManager tokenMgr = new HsTrStoreTokenInfoManager();
	private static HsTrStoreUserManager userMgr = new HsTrStoreUserManager();
	/**
	 * 登陆方法
	 * 
	 * @param userId
	 *            用户名
	 * @param pass
	 *            密码 //TODO 根据pc端情况增加加密算法
	 * @return 返回登陆后的token Id
	 */
	public IntfReturnObj login(String userId, String pass) {
		IntfReturnObj r = new IntfReturnObj();
		try {
			HsTrStoreUser user = userMgr.findHsTrStoreUserById(userId);
			if(user == null) {
				r.setAuthErr(false);
				r.setRes(false);
				r.setErrMsg("User Name Exists!");
				return r;
			}
			if(!user.getPassWord().equals( pass)) {
				r.setAuthErr(false);
				r.setRes(false);
				r.setErrMsg("password not match!");
				return r;
			}
			
			HsTrStoreTokenInfo token = tokenMgr.getTokenByUser(userId);
			if (token != null) {
				tokenMgr.deleteHsTrStoreTokenInfo(token);
			}
			
			token = new HsTrStoreTokenInfo();
			token.setStoreUser(userId);
			token.setPhone(user.getPhone());
			token.setToken(HsTrStoreTokenInfoManager.newTokenId());
			tokenMgr.createHsTrStoreTokenInfo(token);
			r.setRes(true);
			r.setData(token.getToken());
		} catch (Exception e) {
			return new IntfReturnObj(e,false);
		}
		return r;
	}
}
