package com.icbc.mo.emerchant.intf;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import com.icbc.IcbcUtil;
import com.icbc.mo.emerchant.deliver.HsTrDeliverCount;
import com.icbc.mo.emerchant.deliver.controller.HsTrDeliverCountManager;
import com.icbc.mo.emerchant.store.StoreToken;
import com.icbc.mo.emerchant.store.controller.StoreTokenManager;
import com.icbc.mo.emerchant.user.HsTrStoreUser;
import com.icbc.mo.emerchant.user.controller.HsTrStoreUserManager;

/**
 * 送货接口
 * 
 * @author gyam-TatoLu
 * 
 */
public class DeliverIntf {
	private static HsTrDeliverCountManager deliverCountMgr = new HsTrDeliverCountManager();

	/**
	 * 送货相关方法
	 *
	 * @return IntfReturnObj 
	 */
	public IntfReturnObj addDeliver(String userId, BigDecimal dueAmount) {
		IntfReturnObj r = new IntfReturnObj();
		try {
			boolean exists = deliverCountMgr.checkExist(userId);
			if(!exists) {
				//There is no existing count, this is the first transaction. 
				//So Add a new count
/*				我晕。。。JPA居然不给手工执行Sql语句，要问问聂波怎么玩 20160221
 * 				ArgumentException: "Encountered "Insert" at character 1, but expected: ["DELETE", "SELECT", "UPDATE"]." while parsing JPQL "Insert Into HsTrDeliverCount h (userId, totalAmount, totalCount) values (:userId, :dueAmount, 1)".
 * 				boolean result = deliverCountMgr.addNew(userId, dueAmount);
				if(result){
					r.setAuthErr(false);
					r.setRes(true);
					r.setErrMsg("Success");
				}else{
					r.setAuthErr(false);
					r.setRes(false);
					r.setErrMsg("Add New Deliver Failed");
				}*/
				Date date = new Date();
				//org.apache.openjpa.persistence.RollbackException: Unable to obtain an object lock on "null".
				HsTrDeliverCount hsTrDeliverCount = new HsTrDeliverCount();
				hsTrDeliverCount.settotalAmount(dueAmount);
				hsTrDeliverCount.setHandoverTime(null);
				hsTrDeliverCount.settotalCount(BigDecimal.valueOf(1));
				hsTrDeliverCount.setUserId(userId);
				deliverCountMgr.createHsTrDeliverCount(hsTrDeliverCount);
				
				r.setAuthErr(false);
				r.setRes(true);
				r.setErrMsg("Success");
				return r;
			}else{
				//There is existing count, only add this deliver to existing count
				boolean result = deliverCountMgr.updateExist(userId, dueAmount);
				if(result){
					r.setAuthErr(false);
					r.setRes(true);
					r.setErrMsg("Success");
				}else{
					r.setAuthErr(false);
					r.setRes(false);
					r.setErrMsg("Update Deliver Failed");
				}
				return r;
			}
		} catch (Exception e) {
			return new IntfReturnObj(false,null,"Server error, please try again later!",IcbcUtil.Execption2String(e),false);
		}
	}
	
	public IntfReturnObj handoverDeliver(String userId) {
		IntfReturnObj r = new IntfReturnObj();
		try {
			boolean exists = deliverCountMgr.checkExist(userId);
			if(!exists) {
				//There is no existing count, just raise a exception
				
				r.setAuthErr(false);
				r.setRes(false);
				r.setErrMsg("No Deliver to handover");

				return r;
			}else{
				//There is existing count, only add this deliver to existing count
				boolean result = deliverCountMgr.handover(userId);
				if(result){
					r.setAuthErr(false);
					r.setRes(true);
					r.setErrMsg("Success");
				}else{
					r.setAuthErr(false);
					r.setRes(false);
					r.setErrMsg("Handover Failed");
				}
				return r;
			}
		} catch (Exception e) {
			return new IntfReturnObj(false,null,"Server error, please try again later!",IcbcUtil.Execption2String(e),false);
		}
	}
	
	public IntfReturnObj getDeliver(String userId) {
		IntfReturnObj r = new IntfReturnObj();
		try {
			boolean exists = deliverCountMgr.checkExist(userId);
			if(!exists) {
				//There is no existing count, just return a 0 count
				HsTrDeliverCount hsTrDeliverCount = new HsTrDeliverCount();
				hsTrDeliverCount.settotalAmount(BigDecimal.valueOf(0));
				hsTrDeliverCount.settotalCount(BigDecimal.valueOf(0));
				r.setData(hsTrDeliverCount);
				r.setAuthErr(false);
				r.setRes(true);
				r.setErrMsg("Success");
				return r;
			}else{
				//There is existing count, return this deliver
				List<HsTrDeliverCount> result = deliverCountMgr.getExist(userId);
				HsTrDeliverCount hsTrDeliverCount = result.get(0);
				r.setData(hsTrDeliverCount);
				r.setAuthErr(false);
				r.setRes(true);
				r.setErrMsg("Success");
				return r;
			}
		} catch (Exception e) {
			return new IntfReturnObj(false,null,"Server error, please try again later!",IcbcUtil.Execption2String(e),false);
		}
	}
}