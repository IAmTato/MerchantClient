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

@SuppressWarnings("unchecked")
@JPAManager(targetEntity = com.icbc.mo.emerchant.order.HsTrMasterOrder.class)
public class HsTrMasterOrderManager {

	protected static final class NamedQueries {

	protected static final String getHsTrMasterOrder = "SELECT h FROM HsTrMasterOrder h WHERE h.storeId = :parm";}

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
	public String createHsTrMasterOrder(HsTrMasterOrder hsTrMasterOrder) throws Exception {
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
	public String deleteHsTrMasterOrder(HsTrMasterOrder hsTrMasterOrder) throws Exception {
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
	public String updateHsTrMasterOrder(HsTrMasterOrder hsTrMasterOrder) throws Exception {
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
	public HsTrMasterOrder findHsTrMasterOrderByOrderId(String orderId) {
		HsTrMasterOrder hsTrMasterOrder = null;
		EntityManager em = getEntityManager();
		try {
			hsTrMasterOrder = (HsTrMasterOrder) em.find(HsTrMasterOrder.class, orderId);
		} finally {
			em.close();
		}
		return hsTrMasterOrder;
	}

	@Action(Action.ACTION_TYPE.NEW)
	public HsTrMasterOrder getNewHsTrMasterOrder() {
	
		HsTrMasterOrder hsTrMasterOrder = new HsTrMasterOrder();
	
		return hsTrMasterOrder;
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

}