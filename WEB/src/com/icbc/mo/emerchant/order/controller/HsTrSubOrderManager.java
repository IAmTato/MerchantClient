package com.icbc.mo.emerchant.order.controller;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

import com.ibm.jpa.web.Action;
import com.ibm.jpa.web.JPAManager;
import com.icbc.JpaUtil;
import com.icbc.mo.emerchant.order.HsTrSubOrder;


@JPAManager(targetEntity = com.icbc.mo.emerchant.order.HsTrSubOrder.class)
public class HsTrSubOrderManager {

	private EntityManagerFactory emf;

	public HsTrSubOrderManager() {
	
	}

	public HsTrSubOrderManager(EntityManagerFactory emf) {
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
	public String createHsTrSubOrder(HsTrSubOrder hsTrSubOrder) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			em.persist(hsTrSubOrder);
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
	public String deleteHsTrSubOrder(HsTrSubOrder hsTrSubOrder) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			hsTrSubOrder = em.merge(hsTrSubOrder);
			em.remove(hsTrSubOrder);
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
	public String updateHsTrSubOrder(HsTrSubOrder hsTrSubOrder) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			hsTrSubOrder = em.merge(hsTrSubOrder);
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
	public HsTrSubOrder findHsTrSubOrderBySubOrderId(String subOrderId) {
		HsTrSubOrder hsTrSubOrder = null;
		EntityManager em = getEntityManager();
		try {
			hsTrSubOrder = (HsTrSubOrder) em.find(HsTrSubOrder.class, subOrderId);
		} finally {
			em.close();
		}
		return hsTrSubOrder;
	}

	@Action(Action.ACTION_TYPE.NEW)
	public HsTrSubOrder getNewHsTrSubOrder() {
	
		HsTrSubOrder hsTrSubOrder = new HsTrSubOrder();
	
		return hsTrSubOrder;
	}

}