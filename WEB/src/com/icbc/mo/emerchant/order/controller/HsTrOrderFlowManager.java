package com.icbc.mo.emerchant.order.controller;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

import com.ibm.jpa.web.Action;
import com.ibm.jpa.web.JPAManager;
import com.icbc.JpaUtil;
import com.icbc.mo.emerchant.order.HsTrOrderFlow;


@JPAManager(targetEntity = com.icbc.mo.emerchant.order.HsTrOrderFlow.class)
public class HsTrOrderFlowManager {

	private EntityManagerFactory emf;

	public HsTrOrderFlowManager() {
	
	}

	public HsTrOrderFlowManager(EntityManagerFactory emf) {
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
	public String createHsTrOrderFlow(HsTrOrderFlow hsTrOrderFlow) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			em.persist(hsTrOrderFlow);
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
	public String deleteHsTrOrderFlow(HsTrOrderFlow hsTrOrderFlow) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			hsTrOrderFlow = em.merge(hsTrOrderFlow);
			em.remove(hsTrOrderFlow);
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
	public String updateHsTrOrderFlow(HsTrOrderFlow hsTrOrderFlow) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			hsTrOrderFlow = em.merge(hsTrOrderFlow);
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
	public HsTrOrderFlow findHsTrOrderFlowByFlowId(String flowId) {
		HsTrOrderFlow hsTrOrderFlow = null;
		EntityManager em = getEntityManager();
		try {
			hsTrOrderFlow = (HsTrOrderFlow) em.find(HsTrOrderFlow.class, flowId);
		} finally {
			em.close();
		}
		return hsTrOrderFlow;
	}

	@Action(Action.ACTION_TYPE.NEW)
	public HsTrOrderFlow getNewHsTrOrderFlow() {
	
		HsTrOrderFlow hsTrOrderFlow = new HsTrOrderFlow();
	
		return hsTrOrderFlow;
	}

}