package com.icbc.mo.emerchant.pay.controller;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

import com.ibm.jpa.web.Action;
import com.ibm.jpa.web.JPAManager;
import com.icbc.JpaUtil;
import com.icbc.mo.emerchant.pay.HsTrPayResult;


@JPAManager(targetEntity = com.icbc.mo.emerchant.pay.HsTrPayResult.class)
public class HsTrPayResultManager {

	private EntityManagerFactory emf;

	public HsTrPayResultManager() {
	
	}

	public HsTrPayResultManager(EntityManagerFactory emf) {
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
	public String createHsTrPayResult(HsTrPayResult hsTrPayResult) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			em.persist(hsTrPayResult);
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
	public String deleteHsTrPayResult(HsTrPayResult hsTrPayResult) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			hsTrPayResult = em.merge(hsTrPayResult);
			em.remove(hsTrPayResult);
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
	public String updateHsTrPayResult(HsTrPayResult hsTrPayResult) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			hsTrPayResult = em.merge(hsTrPayResult);
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
	public HsTrPayResult findHsTrPayResultByResultId(String resultId) {
		HsTrPayResult hsTrPayResult = null;
		EntityManager em = getEntityManager();
		try {
			hsTrPayResult = (HsTrPayResult) em.find(HsTrPayResult.class, resultId);
		} finally {
			em.close();
		}
		return hsTrPayResult;
	}

	@Action(Action.ACTION_TYPE.NEW)
	public HsTrPayResult getNewHsTrPayResult() {
	
		HsTrPayResult hsTrPayResult = new HsTrPayResult();
	
		return hsTrPayResult;
	}

}