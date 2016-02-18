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

@SuppressWarnings("unchecked")
@JPAManager(targetEntity = com.icbc.mo.emerchant.order.ViewMasterOrder.class)
public class ViewMasterOrderManager {

	protected static final class NamedQueries {

	protected static final String getHsTrMasterOrder = "SELECT h FROM HsTrMasterOrder h WHERE h.storeId = :parm";

	protected static final String getDeliverOrder = "SELECT h FROM HsTrMasterOrder h WHERE h.storeId = :parm and h.orderStatus in ('21')";
	
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
	public String createHsTrMasterOrder(ViewMasterOrder hsTrMasterOrder) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			em.persist(hsTrMasterOrder);
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
	public String deleteHsTrMasterOrder(ViewMasterOrder hsTrMasterOrder) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			hsTrMasterOrder = em.merge(hsTrMasterOrder);
			em.remove(hsTrMasterOrder);
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
	public String updateHsTrMasterOrder(ViewMasterOrder hsTrMasterOrder) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			hsTrMasterOrder = em.merge(hsTrMasterOrder);
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
	public ViewMasterOrder findHsTrMasterOrderByOrderId(String orderId) {
		ViewMasterOrder hsTrMasterOrder = null;
		EntityManager em = getEntityManager();
		try {
			hsTrMasterOrder = (ViewMasterOrder) em.find(ViewMasterOrder.class, orderId);
		} finally {
			em.close();
		}
		return hsTrMasterOrder;
	}

	@Action(Action.ACTION_TYPE.NEW)
	public ViewMasterOrder getNewHsTrMasterOrder() {
	
		ViewMasterOrder hsTrMasterOrder = new ViewMasterOrder();
	
		return hsTrMasterOrder;
	}

	@NamedQueryTarget("getHsTrMasterOrder")
	public List<ViewMasterOrder> getHsTrMasterOrder() {
		EntityManager em = getEntityManager();
		List<ViewMasterOrder> results = null;
		try {
			String parm = "200";
			Query query = em.createQuery(NamedQueries.getHsTrMasterOrder);
			query.setParameter("parm", parm);
			results = (List<ViewMasterOrder>) query.getResultList();
		} finally {
			em.close();
		}
		return results;
	}
	
	@NamedQueryTarget("getDeliverOrder")
	public List<ViewMasterOrder> getDeliverOrder() {
		EntityManager em = getEntityManager();
		List<ViewMasterOrder> results = null;
		try {
			String parm = "200";
			Query query = em.createQuery(NamedQueries.getDeliverOrder);
			query.setParameter("parm", parm);
			results = (List<ViewMasterOrder>) query.getResultList();
		} finally {
			em.close();
		}
		return results;
	}

}
