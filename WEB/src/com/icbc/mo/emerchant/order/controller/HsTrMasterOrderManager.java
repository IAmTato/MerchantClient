package com.icbc.mo.emerchant.order.controller;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;

import com.ibm.jpa.web.Action;
import com.ibm.jpa.web.JPAManager;
import com.ibm.jpa.web.NamedQueryTarget;
import com.icbc.JpaUtil;
import com.icbc.mo.emerchant.order.HsTrMasterOrder;
import com.icbc.mo.emerchant.order.ViewSubOrder;
import com.icbc.mo.emerchant.store.HsTrStoreDetail;
import com.icbc.mo.emerchant.store.StoreToken;

@SuppressWarnings("unchecked")
@JPAManager(targetEntity = com.icbc.mo.emerchant.order.HsTrMasterOrder.class)
public class HsTrMasterOrderManager {

	protected static final class NamedQueries {

		protected static final String getHsTrMasterOrder = "SELECT h FROM HsTrMasterOrder h WHERE h.storeId = :parm";

		protected static final String finishDeliverOrder = "UPDATE HsTrMasterOrder h set h.orderStatus = '31' WHERE h.orderId = :parm and h.orderStatus in ('21')";
		protected static final String restoreDeliverOrder = "UPDATE HsTrMasterOrder h set h.orderStatus = '21' WHERE h.orderId = :parm and h.orderStatus in ('31')";
		protected static final String getTodayFinishedOrder = "SELECT h FROM HsTrMasterOrder h WHERE h.storeId = :storeId and h.orderStatus = '31' and h.createDate = CURRENT_DATE";
		protected static final String getTodayFinishedOrderCount = "SELECT sum(h.realAmount) as totalAmount, count(1) as totalCount FROM HsTrMasterOrder h WHERE h.storeId = :storeId and h.orderStatus = '31' and h.createDate = CURRENT_DATE";//to_char(h.create_date, 'YYYYMMDD') = to_char(sysdate, 'YYYYMMDD')";
		protected static final String getTodayFinishedOrder2 = "SELECT h.* FROM Hs_Tr_Master_Order h WHERE h.store_Id = ?1 and h.order_Status = '31' and to_char(h.create_date, 'YYYYMMDD') = to_char(sysdate, 'YYYYMMDD')";
		protected static final String getTodayFinishedOrderCount2 = "SELECT sum(h.real_Amount) as totalAmount, count(1) as totalCount FROM Hs_Tr_Master_Order h WHERE h.store_Id = ?1 and h.order_Status = '31' and to_char(h.create_date, 'YYYYMMDD') = to_char(sysdate, 'YYYYMMDD')";

	}

	private EntityManagerFactory emf;

	public HsTrMasterOrderManager() {
	
	}

	public HsTrMasterOrderManager(EntityManagerFactory emf) {
		this.emf = emf;
	}

	public void setEntityManagerFactory(EntityManagerFactory emf) {
		this.emf = emf;
	}

	private EntityManager getEntityManager() {
		if (emf == null) {
			emf = JpaUtil.getEmf();
		}
		return emf.createEntityManager();
	}

	@Action(Action.ACTION_TYPE.CREATE)
	public String createHsTrMasterOrder(HsTrMasterOrder HsTrMasterOrder) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			em.persist(HsTrMasterOrder);
			em.getTransaction().commit();
		} catch (Exception ex) {
			try {
				if (em.getTransaction().isActive()) {
					em.getTransaction().rollback();
				}
			} catch (Exception e) {
				ex.printStackTrace();
				throw e;
			}
			throw ex;
		} finally {
			em.close();
		}
		return "";
	}

	@Action(Action.ACTION_TYPE.DELETE)
	public String deleteHsTrMasterOrder(HsTrMasterOrder HsTrMasterOrder) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			HsTrMasterOrder = em.merge(HsTrMasterOrder);
			em.remove(HsTrMasterOrder);
			em.getTransaction().commit();
		} catch (Exception ex) {
			try {
				if (em.getTransaction().isActive()) {
					em.getTransaction().rollback();
				}
			} catch (Exception e) {
				ex.printStackTrace();
				throw e;
			}
			throw ex;
		} finally {
			em.close();
		}
		return "";
	}

	@Action(Action.ACTION_TYPE.UPDATE)
	public String updateHsTrMasterOrder(HsTrMasterOrder HsTrMasterOrder) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			HsTrMasterOrder = em.merge(HsTrMasterOrder);
			em.getTransaction().commit();
		} catch (Exception ex) {
			try {
				if (em.getTransaction().isActive()) {
					em.getTransaction().rollback();
				}
			} catch (Exception e) {
				ex.printStackTrace();
				throw e;
			}
			throw ex;
		} finally {
			em.close();
		}
		return "";
	}

	@Action(Action.ACTION_TYPE.FIND)
	public HsTrMasterOrder findHsTrMasterOrderByOrderId(String orderId) {
		HsTrMasterOrder hsTrMasterOrder = null;
		EntityManager em = getEntityManager();
		try {
			hsTrMasterOrder = (HsTrMasterOrder) em.find(HsTrMasterOrder.class, orderId);
			if(hsTrMasterOrder != null) {//在 em close 之前调用get方法 load ViewSubOrder list
				List<ViewSubOrder> list = hsTrMasterOrder.getViewsuborderList();
				list.size();
			}
		} finally {
			em.close();
		}
		return hsTrMasterOrder;
	}

	@Action(Action.ACTION_TYPE.NEW)
	public HsTrMasterOrder getNewHsTrMasterOrder() {
	
		HsTrMasterOrder HsTrMasterOrder = new HsTrMasterOrder();
	
		return HsTrMasterOrder;
	}

	@NamedQueryTarget("getHsTrMasterOrder")
	public List<HsTrMasterOrder> getHsTrMasterOrder(StoreToken token) {
		EntityManager em = getEntityManager();
		List<HsTrMasterOrder> results = null;
		try {
			String parm = token.getStoreDetail().getStoreId();
			Query query = em.createQuery(NamedQueries.getHsTrMasterOrder);
			query.setParameter("parm", parm);
			results = (List<HsTrMasterOrder>) query.getResultList();
		} finally {
			em.close();
		}
		return results;
	}
	
	@NamedQueryTarget("finishDeliverOrder")
	public boolean finishDeliverOrder(String orderId) {
		EntityManager em = getEntityManager();
		boolean results = false;
		try {
			em.getTransaction().begin();
			Query query = em.createQuery(NamedQueries.finishDeliverOrder);
			query.setParameter("parm", orderId);
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

	@NamedQueryTarget("restoreDeliverOrder")
	public int restoreDeliverOrder(String parm) {
		EntityManager em = getEntityManager();
		int result = 9999;
		try {
			em.getTransaction().begin();
			Query query = em.createQuery(NamedQueries.restoreDeliverOrder);
			query.setParameter("parm", parm);
			result = query.executeUpdate();
			em.getTransaction().commit();
		} finally {
			em.close();
		}
		return result;
	}
	
	@SuppressWarnings("rawtypes")
	@NamedQueryTarget("getTodayFinishedOrderCount")
	public List getTodayFinishedOrderCount(StoreToken token) {
		
		String storeId = token.getStoreDetail().getStoreId();
		List rs = null;		
		EntityManager em = getEntityManager();
		try {
			Query query = em.createQuery(NamedQueries.getTodayFinishedOrderCount);
			query.setParameter("storeId", storeId);
			rs = query.getResultList();
			
		} finally {
			em.close();
		}
		return rs;
	}
	
	@NamedQueryTarget("getTodayFinishedOrder")
	public List<HsTrMasterOrder> getTodayFinishedOrder(StoreToken token) {
		
		String storeId = token.getStoreDetail().getStoreId();
		List<HsTrMasterOrder> results = null;
		EntityManager em = getEntityManager();
		try {
			Query query = em.createQuery(NamedQueries.getTodayFinishedOrder);
			query.setParameter("storeId", storeId);
			results = query.getResultList();
			
		} finally {
			em.close();
		}
		return results;
	}
	
	@SuppressWarnings("rawtypes")
	@NamedQueryTarget("getTodayFinishedOrderCount2")
	public List getTodayFinishedOrderCount2(StoreToken token) {
		
		String storeId = token.getStoreDetail().getStoreId();
		List rs = null;		
		EntityManager em = getEntityManager();
		try {
			Query query = em.createNativeQuery(NamedQueries.getTodayFinishedOrderCount2);
			query.setParameter(1, storeId);
			rs = query.getResultList();
			
		} finally {
			em.close();
		}
		return rs;
	}
	
	@NamedQueryTarget("getTodayFinishedOrder2")
	public List getTodayFinishedOrder2(StoreToken token) {
		
		String storeId = token.getStoreDetail().getStoreId();
		List results = null;
		EntityManager em = getEntityManager();
		try {
			Query query = em.createNativeQuery(NamedQueries.getTodayFinishedOrder2);
			query.setParameter(1, storeId);
			results = query.getResultList();
			
		} finally {
			em.close();
		}
		return results;
	}
	
	public int insertQrPayRecord(HsTrMasterOrder HsTrMasterOrder) throws Exception {
		int result = 9999;

		Date createDate = new Date();
		int orderId = new Random().nextInt(1000);
		
		HsTrMasterOrder.setOrderId(String.valueOf(orderId));
		HsTrMasterOrder.setCreateDate(createDate);
		HsTrMasterOrder.setDiscountAmount(BigDecimal.ZERO);
		
		
		createHsTrMasterOrder(HsTrMasterOrder);
		return result;
	}
}
