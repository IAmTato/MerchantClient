package com.icbc.mo.emerchant.order.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;

import com.ibm.jpa.web.Action;
import com.ibm.jpa.web.JPAManager;
import com.ibm.jpa.web.NamedQueryTarget;
import com.icbc.JpaUtil;
import com.icbc.mo.emerchant.order.ViewMasterOrder;
import com.icbc.mo.emerchant.store.StoreToken;

@SuppressWarnings("unchecked")
@JPAManager(targetEntity = com.icbc.mo.emerchant.order.ViewMasterOrder.class)
public class ViewMasterOrderManager {

	public class ViewMasterOrderCountsResult {
		private String addFeeAmount;
		private String txnCount;
	
		public ViewMasterOrderCountsResult() {
		}
	
		public ViewMasterOrderCountsResult(String addFeeAmount, String txnCount) {
			this.addFeeAmount = addFeeAmount;
			this.txnCount = txnCount;
		}
	
		public String getaddFeeAmount() {
			return addFeeAmount;
		}
	
		public void setaddFeeAmount(String addFeeAmount) {
			this.addFeeAmount = addFeeAmount;
		}
	
		public String getaddFeeRate() {
			return txnCount;
		}
	
		public void setaddFeeRate(String txnCount) {
			this.txnCount = txnCount;
		}
	}
	protected static final class NamedQueries {

	protected static final String getViewMasterOrder = "SELECT h FROM ViewMasterOrder h WHERE h.storeId = :parm";

	//protected static final String getDeliverOrder = "SELECT h.orderId, h.currency, h.costAmount, h.realAmount, h.userName, h.createDate, h.custPhone FROM ViewMasterOrder h WHERE h.storeId = :parm and h.orderStatus in ('21')";
	
	protected static final String getDeliverOrder = "SELECT h FROM ViewMasterOrder h WHERE h.storeId = :parm and h.orderStatus in ('21')";
	
//	protected static final String getTodayFinishedOrder = "SELECT h FROM HsTrMasterOrder h WHERE h.storeId = :storeId and h.orderStatus = '31' and h.createDate >= :dateStart";
//	protected static final String getTodayFinishedOrderCount = "SELECT sum(h.realAmount) as totalAmount, count(1) as totalCount FROM HsTrMasterOrder h WHERE h.storeId = :storeId and h.orderStatus = '31' and h.createDate >= :dateStart";//CURRENT_DATE";//to_char(h.create_date, 'YYYYMMDD') = to_char(sysdate, 'YYYYMMDD')";
//	protected static final String getTodayFinishedOrder2 = "SELECT h.* FROM Hs_Tr_Master_Order h WHERE h.store_Id = ?1 and h.order_Status = '31' and to_char(h.create_date, 'YYYYMMDD') = to_char(sysdate, 'YYYYMMDD')";
//	protected static final String getTodayFinishedOrderCount2 = "SELECT sum(h.real_Amount) as totalAmount, count(1) as totalCount FROM Hs_Tr_Master_Order h WHERE h.store_Id = ?1 and h.order_Status = '31' and to_char(h.create_date, 'YYYYMMDD') = to_char(sysdate, 'YYYYMMDD')";

	protected static final String getTodayFinishedOrder = "SELECT h FROM ViewMasterOrder h WHERE h.storeId = :storeId and h.orderStatus = '31' and h.createDateComp >= :dateStart";
	protected static final String getTodayFinishedOrderCount = "SELECT sum(h.realAmount) as totalAmount, count(1) as totalCount FROM ViewMasterOrder h WHERE h.storeId = :storeId and h.orderStatus = '31' and h.createDateComp >= :dateStart";//CURRENT_DATE";//to_char(h.create_date, 'YYYYMMDD') = to_char(sysdate, 'YYYYMMDD')";
	protected static final String getTodayFinishedOrder2 = "SELECT h.* FROM View_Master_Order h WHERE h.store_Id = ?1 and h.order_Status = '31' and to_char(to_date(h.create_date, 'YYYY-MM-DD HH24:MI'), 'YYYYMMDD') = to_char(sysdate, 'YYYYMMDD')";
	protected static final String getTodayFinishedOrderCount2 = "SELECT sum(h.real_Amount) as totalAmount, count(1) as totalCount FROM View_Master_Order h WHERE h.store_Id = ?1 and h.order_Status = '31' and to_char(h.create_date_comp, 'YYYYMMDD') = to_char(sysdate, 'YYYYMMDD')";

	
	}

	private EntityManagerFactory emf;

	public ViewMasterOrderManager() {
	
	}

	public ViewMasterOrderManager(EntityManagerFactory emf) {
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
	public String createViewMasterOrder(ViewMasterOrder ViewMasterOrder) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			em.persist(ViewMasterOrder);
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
	public String deleteViewMasterOrder(ViewMasterOrder ViewMasterOrder) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			ViewMasterOrder = em.merge(ViewMasterOrder);
			em.remove(ViewMasterOrder);
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
	public String updateViewMasterOrder(ViewMasterOrder ViewMasterOrder) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			ViewMasterOrder = em.merge(ViewMasterOrder);
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
	public ViewMasterOrder findViewMasterOrderByOrderId(String orderId) {
		ViewMasterOrder ViewMasterOrder = null;
		EntityManager em = getEntityManager();
		try {
			ViewMasterOrder = (ViewMasterOrder) em.find(ViewMasterOrder.class, orderId);
		} finally {
			em.close();
		}
		return ViewMasterOrder;
	}

	@Action(Action.ACTION_TYPE.NEW)
	public ViewMasterOrder getNewViewMasterOrder() {
	
		ViewMasterOrder ViewMasterOrder = new ViewMasterOrder();
	
		return ViewMasterOrder;
	}

	@NamedQueryTarget("getViewMasterOrder")
	public List<ViewMasterOrder> getViewMasterOrder() {
		EntityManager em = getEntityManager();
		List<ViewMasterOrder> results = null;
		try {
			String parm = "200";
			Query query = em.createQuery(NamedQueries.getViewMasterOrder);
			query.setParameter("parm", parm);
			results = (List<ViewMasterOrder>) query.getResultList();
		} finally {
			em.close();
		}
		return results;
	}
	
	@NamedQueryTarget("getDeliverOrder")
	public List<ViewMasterOrder> getDeliverOrder(StoreToken token) {
		EntityManager em = getEntityManager();
		List<ViewMasterOrder> results = null;
		try {
			//String parm = token.getStoreDetail().getStoreId();//"200"; 
			String parm =  "200";
			Query query = em.createQuery(NamedQueries.getDeliverOrder);
			query.setParameter("parm", parm);
			results = (List<ViewMasterOrder>) query.getResultList();
		} finally {
			em.close();
		}
		return results;
	}

	
	@NamedQueryTarget("getTodayFinishedOrder")
	public List<ViewMasterOrder> getTodayFinishedOrder(StoreToken token) {
		
		String storeId = token.getStoreDetail().getStoreId();
		List<ViewMasterOrder> results = null;
		EntityManager em = getEntityManager();
		try {
			Query query = em.createQuery(NamedQueries.getTodayFinishedOrder,ViewMasterOrder.class);
			query.setParameter("storeId", storeId);
			query.setParameter("dateStart", getDayWholePointDate(new Date()));
			results = query.getResultList();
			
		} finally {
			em.close();
		}
		return results;
	}
	
	
	@NamedQueryTarget("getTodayFinishedOrder2")
	public List getTodayFinishedOrder2(StoreToken token) {
		
		String storeId = token.getStoreDetail().getStoreId();
		List results = null;
		EntityManager em = getEntityManager();
		try {
			Query query = em.createNativeQuery(NamedQueries.getTodayFinishedOrder2,ViewMasterOrder.class);
			query.setParameter(1, storeId);
			results = query.getResultList();
			
		} finally {
			em.close();
		}
		return results;
	}
	
	
	@NamedQueryTarget("getTodayFinishedOrderCount")
	public List<ViewMasterOrderCountsResult> getTodayFinishedOrderCount(StoreToken token) {
		EntityManager em = getEntityManager();
		List<ViewMasterOrderCountsResult> results = new ArrayList<ViewMasterOrderCountsResult>();
		try {
			String storeId = token.getStoreDetail().getStoreId();
			Query query = em.createQuery(NamedQueries.getTodayFinishedOrderCount);
			query.setParameter("storeId", storeId);
			query.setParameter("dateStart", getDayWholePointDate(new Date()));
			//results = query.getResultList();
			List<Object[]> multipleResults = (List<Object[]>) query.getResultList();
			for (Object[] result : multipleResults) {
				results.add(new ViewMasterOrderCountsResult(result[0].toString(), result[1].toString()));
			}
		} finally {
			em.close();
		}
		return results;
	}

	
	/** 
     * 返回今天的整点信息 
     *  
     * @param date 
     * @return 2014-3-3 00:00:00 
     */  
    public static Date getDayWholePointDate(Date date) {  
  
        GregorianCalendar gc = new GregorianCalendar();  
        gc.setTime(date);  
        if ((gc.get(gc.HOUR_OF_DAY) == 0) && (gc.get(gc.MINUTE) == 0)  
                && (gc.get(gc.SECOND) == 0)) {  
            return new Date(date.getTime());  
        } else {  
            Date date2 = new Date(date.getTime() - gc.get(gc.HOUR_OF_DAY) * 60 * 60  
                    * 1000 - gc.get(gc.MINUTE) * 60 * 1000 - gc.get(gc.SECOND)  
                    * 1000);  
            return date2;  
        }  
  
    }  

    
	
	public static void main(String[] args) {  
        
        Date date = new Date();  
          
        System.out.println(date.toString());  
          
        date = getDayWholePointDate(date);  
          
        System.out.println(date.toLocaleString());  
          
    }  
}
