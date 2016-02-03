package com.icbc.mo.emerchant.pay.controller;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

import com.ibm.jpa.web.Action;
import com.ibm.jpa.web.JPAManager;
import com.icbc.JpaUtil;
import com.icbc.mo.emerchant.pay.HsTrPayInfo;


@JPAManager(targetEntity = com.icbc.mo.emerchant.pay.HsTrPayInfo.class)
public class HsTrPayInfoManager {

	private EntityManagerFactory emf;

	public HsTrPayInfoManager() {
	
	}

	public HsTrPayInfoManager(EntityManagerFactory emf) {
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
	public String createHsTrPayInfo(HsTrPayInfo hsTrPayInfo) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			em.persist(hsTrPayInfo);
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
	public String deleteHsTrPayInfo(HsTrPayInfo hsTrPayInfo) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			hsTrPayInfo = em.merge(hsTrPayInfo);
			em.remove(hsTrPayInfo);
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
	public String updateHsTrPayInfo(HsTrPayInfo hsTrPayInfo) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			hsTrPayInfo = em.merge(hsTrPayInfo);
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
	public HsTrPayInfo findHsTrPayInfoByPayId(String payId) {
		HsTrPayInfo hsTrPayInfo = null;
		EntityManager em = getEntityManager();
		try {
			hsTrPayInfo = (HsTrPayInfo) em.find(HsTrPayInfo.class, payId);
		} finally {
			em.close();
		}
		return hsTrPayInfo;
	}

	@Action(Action.ACTION_TYPE.NEW)
	public HsTrPayInfo getNewHsTrPayInfo() {
	
		HsTrPayInfo hsTrPayInfo = new HsTrPayInfo();
	
		return hsTrPayInfo;
	}

}