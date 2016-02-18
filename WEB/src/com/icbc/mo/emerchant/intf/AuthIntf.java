package com.icbc.mo.emerchant.intf;

import java.sql.Timestamp;

import com.icbc.IcbcUtil;
import com.icbc.mo.emerchant.store.StoreToken;
import com.icbc.mo.emerchant.store.controller.StoreTokenManager;
import com.icbc.mo.emerchant.user.HsTrStoreUser;
import com.icbc.mo.emerchant.user.controller.HsTrStoreUserManager;

/**
 * 登陆接口
 * 
 * @author gyyz-bobbynie
 * 
 */
public class AuthIntf {
	private static StoreTokenManager tokenMgr = new StoreTokenManager();
	private static HsTrStoreUserManager userMgr = new HsTrStoreUserManager();
	/**
	 * 登陆方法
	 * 
	 * @param userId
	 *            用户名
	 * @param pass
	 *            密码 //TODO 根据pc端情况增加加密算法
	 * @return IntfReturnObj 
	 */
	public IntfReturnObj login(String userId, String pass) {
		IntfReturnObj r = new IntfReturnObj();
		try {
			HsTrStoreUser user = userMgr.findHsTrStoreUserById(userId);
			if(user == null) {
				r.setAuthErr(false);
				r.setRes(false);
				r.setErrMsg("User Name Not Exists!");
				return r;
			}
			if(!user.getPassWord().equals( pass)) {
				r.setAuthErr(false);
				r.setRes(false);
				r.setErrMsg("password not match!");
				return r;
			}
			//用户非启用状态
			if(!"1".equals(user.getUserStatus())) {
				r.setAuthErr(false);
				r.setRes(false);
				r.setErrMsg("User Not Active!");
				return r;
			}
			/**
			 * USER_TYPE	CHAR(1)	N	N		用户类型1-商户管理员2-商户操作员3-门店管理员4-门店操作员
			 * 用户类型必须为门店用户  3、4；
			 */
			if(!("3".equals(user.getUserType()) || "4".equals(user.getUserType()))){
				r.setAuthErr(false);
				r.setRes(false);
				r.setErrMsg("User Not Store User!");
				return r;
			}
			
			
			StoreToken token = tokenMgr.getTokenByUser(userId);
			if (token != null) {
				tokenMgr.deleteHsTrStoreTokenInfo(token);
				StoreTokenManager.removeTokenCatched(token.getToken());
			}
			
			token = new StoreToken();
			token.setStoreUser(userId);
			token.setPhone(user.getPhone());
			token.setToken(StoreTokenManager.newTokenId());
			token.setUserData(user);
			token.setCreateTime(new Timestamp(System.currentTimeMillis()));
			tokenMgr.createHsTrStoreTokenInfo(token);
			r.setRes(true);
			r.setData(token);
		} catch (Exception e) {
			return new IntfReturnObj(false,null,"Server error can't login, please try again later!",IcbcUtil.Execption2String(e),false);
		}
		return r;
	}
}
