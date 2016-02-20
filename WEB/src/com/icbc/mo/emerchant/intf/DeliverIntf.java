package com.icbc.mo.emerchant.intf;

import java.math.BigDecimal;
import java.sql.Timestamp;

import com.icbc.IcbcUtil;
import com.icbc.mo.emerchant.deliver.controller.HsTrDeliverCountManager;
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
public class DeliverIntf {
	private static HsTrDeliverCountManager deliverCountMgr = new HsTrDeliverCountManager();

	/**
	 * 登陆方法
	 * 
	 * @param userId
	 *            用户名
	 * @param pass
	 *            密码 //TODO 根据pc端情况增加加密算法
	 * @return IntfReturnObj 
	 */
	public IntfReturnObj addDeliver(String userId, BigDecimal dueAmount) {
		IntfReturnObj r = new IntfReturnObj();
		try {
			boolean exists = deliverCountMgr.checkExist(userId);
			if(exists) {
				//Add this to existing count
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
