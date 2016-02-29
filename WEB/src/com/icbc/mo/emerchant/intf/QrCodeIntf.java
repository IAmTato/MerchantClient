package com.icbc.mo.emerchant.intf;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;

import com.ibm.jpa.web.NamedQueryTarget;
import com.icbc.IcbcUtil;
import com.icbc.JpaUtil;
import com.icbc.mo.emerchant.cust.HsTrCustInfo;
import com.icbc.mo.emerchant.cust.controller.HsTrCustInfoManager;
import com.icbc.mo.emerchant.order.HsTrMasterOrder;
import com.icbc.mo.emerchant.order.controller.HsTrMasterOrderManager;
import com.icbc.mo.emerchant.qr.HsTrQrcode;
import com.icbc.mo.emerchant.qr.controller.HsTrQrcodeManager;
import com.icbc.mo.emerchant.store.StoreToken;

public class QrCodeIntf {
	
	//TODO: custId --> phone
	
	private static HsTrMasterOrderManager masterOrderManager = new HsTrMasterOrderManager();
	private static HsTrQrcodeManager qrCodeManager = new HsTrQrcodeManager();
	private static HsTrMasterOrder hsTrMasterOrder  = new HsTrMasterOrder();
	private static HsTrCustInfoManager custInfoManager = new HsTrCustInfoManager();
	//private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
	//private static HsTrStoreDetailManager storeDeatilManager = new HsTrStoreDetailManager();
	
	
	protected static final class NamedQueries {

		protected static final String TestQrCodeFunc = "UPDATE HsTrMasterOrder h set h.orderStatus = :orderStatus WHERE h.costAmount = :costAmount";
	}
	
	private EntityManagerFactory emf;
	
	private EntityManager getEntityManager() {
		if (emf == null) {
			emf = JpaUtil.getEmf();
		}
		return emf.createEntityManager();
	}
	
	//获取客户手机号码
	public String getCustInfoByQrCodeId(String qrCodeId, StoreToken token){
		HsTrQrcode qrCode = new HsTrQrcode();
		HsTrCustInfo custInfo = new HsTrCustInfo();
		String result = null;
		try {
			qrCode = qrCodeManager.findHsTrQrcodeByQrCodeId(qrCodeId);
			custInfo = custInfoManager.findHsTrCustInfoByCustId(qrCode.getCustId());
			result = custInfo.getPhone();
			updateQrCodeTable(qrCode, 100, 2, token);
			
		} catch (Exception e) {
			IcbcUtil.Execption2String(e);
		}
		return result;
	}
	
	//更新二维码表状态
	public IntfReturnObj updateQrCodeTable(HsTrQrcode qrCode, int funcCode, int qrCodeStatus, StoreToken token){
		IntfReturnObj r = new IntfReturnObj();
		try {
			if(qrCode != null) {
				String storeId = token.getStoreDetail().getStoreId();
				
				//更新二维码表--状态已扫描
				qrCode.setStoreId(storeId);
				qrCode.setQrFunc(funcCode);//扫码付款
				qrCode.setStatus(qrCodeStatus);//二维码已读取
				qrCode.setCreateTime(new Timestamp(System.currentTimeMillis()));
				String result = qrCodeManager.updateHsTrQrcode(qrCode);

				if(result != "true") {		
					r.setData(null);
					r.setAuthErr(false);
					r.setRes(false);
					r.setErrMsg("更新二维码状态失败");
					return r;
				}
			}
			r.setData(null);
			r.setAuthErr(false);
			r.setRes(true);
			return r;
		} catch (Exception e) {
			return new IntfReturnObj(false,null,"服務器錯誤，請重試",IcbcUtil.Execption2String(e),false);
		}
		
	}
	
	public IntfReturnObj insertOneMasterOrderRecord(String custPhone, Double costAmount, StoreToken token) throws Exception {
		
		IntfReturnObj r = new IntfReturnObj();
		
		Date createDate = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
		int seqId = new Random().nextInt(1000);//后续获取HS_ORDER_NO_SEQ获取
		String orderId = "m"+sdf.format(createDate)+ seqId;
		
		
		try {
			String storeId = token.getStoreDetail().getStoreId();
			String custId = custInfoManager.getCustIdbyPhone(custPhone);
			
			if(hsTrMasterOrder != null){
				hsTrMasterOrder  = new HsTrMasterOrder();
			}
			hsTrMasterOrder.setOrderId(orderId);
			hsTrMasterOrder.setCreateDate(createDate);
			hsTrMasterOrder.setOrderType("1");//订购单
			hsTrMasterOrder.setCustId(custId);
			hsTrMasterOrder.setStoreId(storeId);
			hsTrMasterOrder.setCurrency("MOP");
			hsTrMasterOrder.setCostAmount(costAmount);//COST_AMOUNT
			hsTrMasterOrder.setRealAmount(costAmount);//REAL_AMOUNT 未做
			hsTrMasterOrder.setDiscountAmount((double) 0);//DISCOUNT_AMOUNT
			hsTrMasterOrder.setOrderStatus("01");//等待付款
			hsTrMasterOrder.setDiscountAmount((double) 0);
			hsTrMasterOrder.setPayType("3");//扫码支付
			
			//二维码表创建一条记录
			String result = masterOrderManager.createHsTrMasterOrder(hsTrMasterOrder);
			if(result == "true"){
				r.setAuthErr(false);
				r.setRes(true);
				r.setErrMsg("Success");
			}else{
				r.setAuthErr(false);
				r.setRes(false);
				r.setErrMsg("Insert order record failed");
			}

		} catch (Exception e) {
			return new IntfReturnObj(false,null,"Server error, please try again later!",IcbcUtil.Execption2String(e),false);
		}
		return r;
	}
	
	public String getThisOrderStatus(StoreToken token){
		String orderId = hsTrMasterOrder.getOrderId();
		return masterOrderManager.findHsTrMasterOrderByOrderId(orderId).getOrderStatus();
	}
	
	public List<HsTrMasterOrder> getFinalOrderResults(StoreToken token){
		return masterOrderManager.getFinalOrderResults(token);
	}
	
	public HsTrMasterOrder getThisOrderInfo(StoreToken token){
		String orderId = hsTrMasterOrder.getOrderId();

		return masterOrderManager.findHsTrMasterOrderByOrderId(orderId);
	}
	
	
	@NamedQueryTarget("TestQrCodeFunc")
	public boolean TestQrCodeFunc(double costAmount, String orderStatus){
		EntityManager em = getEntityManager();
		boolean results = false;
		try {
			em.getTransaction().begin();
			Query query = em.createQuery(NamedQueries.TestQrCodeFunc);
			query.setParameter("orderStatus", orderStatus);
			query.setParameter("costAmount", costAmount);
			int rs = query.executeUpdate();
			if (rs == 1) {
				results = true;
			}else{
				results = false;
			}
			em.getTransaction().commit();
		} finally {
			em.close();
		}
		
		return results;
	}

	
	
}
