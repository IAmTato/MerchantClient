package com.icbc.mo.emerchant.order.controller;

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

	protected static final class NamedQueries {

	protected static final String getViewMasterOrder = "SELECT h FROM ViewMasterOrder h WHERE h.storeId = :parm";

	//protected static final String getDeliverOrder = "SELECT h.orderId, h.currency, h.costAmount, h.realAmount, h.userName, h.createDate, h.custPhone FROM ViewMasterOrder h WHERE h.storeId = :parm and h.orderStatus in ('21')";
	
	protected static final String getDeliverOrder = "SELECT h FROM ViewMasterOrder h WHERE h.storeId = :parm and h.orderStatus in ('21')";
	
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
	public List<ViewMasterOrder> getViewMasterOrder(StoreToken token) {
		EntityManager em = getEntityManager();
		List<ViewMasterOrder> results = null;
		try {
			String parm = token.getStoreDetail().getStoreId();
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
			String parm = token.getStoreDetail().getStoreId();//"200"; 
			Query query = em.createQuery(NamedQueries.getDeliverOrder);
			query.setParameter("parm", parm);
			results = (List<ViewMasterOrder>) query.getResultList();
		} finally {
			em.close();
		}
		return results;
	}

}
