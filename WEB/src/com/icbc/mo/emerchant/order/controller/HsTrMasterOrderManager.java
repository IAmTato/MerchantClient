package com.icbc.mo.emerchant.order.controller;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;

import com.ibm.jpa.web.Action;
import com.ibm.jpa.web.JPAManager;
import com.ibm.jpa.web.NamedQueryTarget;
import com.icbc.JpaUtil;
import com.icbc.mo.emerchant.order.HsTrMasterOrder;
import com.icbc.mo.emerchant.store.StoreToken;

@SuppressWarnings("unchecked")
@JPAManager(targetEntity = com.icbc.mo.emerchant.order.HsTrMasterOrder.class)
public class HsTrMasterOrderManager {

	protected static final class NamedQueries {

	protected static final String getHsTrMasterOrder = "SELECT h FROM HsTrMasterOrder h WHERE h.storeId = :parm";

	protected static final String updateDeliverOrder = "UPDATE HsTrMasterOrder h set h.orderStatus = '31' WHERE h.orderId = :parm and h.orderStatus in ('21')";
	protected static final String restoreDeliverOrder = "UPDATE HsTrMasterOrder h set h.orderStatus = '21' WHERE h.orderId = :parm and h.orderStatus in ('31')";
	
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
		HsTrMasterOrder HsTrMasterOrder = null;
		EntityManager em = getEntityManager();
		try {
			HsTrMasterOrder = (HsTrMasterOrder) em.find(HsTrMasterOrder.class, orderId);
		} finally {
			em.close();
		}
		return HsTrMasterOrder;
	}

	@Action(Action.ACTION_TYPE.NEW)
	public HsTrMasterOrder getNewHsTrMasterOrder() {
	
		HsTrMasterOrder HsTrMasterOrder = new HsTrMasterOrder();
	
		return HsTrMasterOrder;
	}

	@NamedQueryTarget("getHsTrMasterOrder")
	public List<HsTrMasterOrder> getHsTrMasterOrder() {
		EntityManager em = getEntityManager();
		List<HsTrMasterOrder> results = null;
		try {
			String parm = "200";
			Query query = em.createQuery(NamedQueries.getHsTrMasterOrder);
			query.setParameter("parm", parm);
			results = (List<HsTrMasterOrder>) query.getResultList();
		} finally {
			em.close();
		}
		return results;
	}
	
	@NamedQueryTarget("updateDeliverOrder")
	public int updateDeliverOrder(String parm) {
		EntityManager em = getEntityManager();
		int result = 9999;
		try {
			em.getTransaction().begin();
			Query query = em.createQuery(NamedQueries.updateDeliverOrder);
			query.setParameter("parm", parm);
			result = query.executeUpdate();
			em.getTransaction().commit();
		} finally {
			em.close();
		}
		return result;
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
	
}
