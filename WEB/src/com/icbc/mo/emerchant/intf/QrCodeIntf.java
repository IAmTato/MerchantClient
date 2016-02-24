package com.icbc.mo.emerchant.intf;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import com.icbc.IcbcUtil;
import com.icbc.mo.emerchant.order.HsTrMasterOrder;
import com.icbc.mo.emerchant.order.controller.HsTrMasterOrderManager;
import com.icbc.mo.emerchant.qr.HsTrQrcode;
import com.icbc.mo.emerchant.qr.controller.HsTrQrcodeManager;
import com.icbc.mo.emerchant.store.StoreToken;

public class QrCodeIntf {
	
	private static HsTrMasterOrderManager masterOrderManager = new HsTrMasterOrderManager();
	private static HsTrQrcodeManager qrCodeManager = new HsTrQrcodeManager();
	private static HsTrMasterOrder hsTrMasterOrder  = new HsTrMasterOrder();
	//private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
	//private static HsTrStoreDetailManager storeDeatilManager = new HsTrStoreDetailManager();
	
	
	public HsTrQrcode qrCodeRead(String qrCodeId, StoreToken token){
		
		HsTrQrcode qrCode = new HsTrQrcode();
		try{
			qrCode = qrCodeManager.findHsTrQrcodeByQrCodeId(qrCodeId);
			if(qrCode != null) {
				String storeId = token.getStoreDetail().getStoreId();
				
				//更新二维码表--状态已扫描
				qrCode.setStoreId(storeId);
				qrCode.setQrFunc(100);//扫码付款
				qrCode.setStatus(2);//二维码已读取
				qrCode.setCreateTime(new Timestamp(System.currentTimeMillis()));
				qrCodeManager.updateHsTrQrcode(qrCode);
			}
		} catch (Exception e) {
			IcbcUtil.Execption2String(e);
		}
		return qrCode;
	}
	
	public IntfReturnObj insertOneMasterOrderRecord(String custId, Long costAmount, StoreToken token) throws Exception {
		
		IntfReturnObj r = new IntfReturnObj();
		
		Date createDate = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
		int seqId = new Random().nextInt(1000);//后续获取HS_ORDER_NO_SEQ获取
		String orderId = "m"+sdf.format(createDate)+ seqId;
		String storeId = token.getStoreDetail().getStoreId();
		
		try {
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
			hsTrMasterOrder.setDiscountAmount((long) 0);//DISCOUNT_AMOUNT
			hsTrMasterOrder.setOrderStatus("01");//等待付款
			hsTrMasterOrder.setDiscountAmount((long) 0);
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
	
	public HsTrMasterOrder getThisOrderInfo(StoreToken token){
		String orderId = hsTrMasterOrder.getOrderId();

		return masterOrderManager.findHsTrMasterOrderByOrderId(orderId);
	}

	
	
}
