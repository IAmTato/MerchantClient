package com.icbc.mo.emerchant.store.controller;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

import com.ibm.jpa.web.Action;
import com.ibm.jpa.web.JPAManager;
import com.icbc.JpaUtil;
import com.icbc.mo.emerchant.store.HsTrStoreTokenInfo;


@JPAManager(targetEntity = com.icbc.mo.emerchant.store.HsTrStoreTokenInfo.class)
public class HsTrStoreTokenInfoManager {

	private EntityManagerFactory emf;

	public HsTrStoreTokenInfoManager() {
	
	}

	public HsTrStoreTokenInfoManager(EntityManagerFactory emf) {
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
	public String createHsTrStoreTokenInfo(HsTrStoreTokenInfo hsTrStoreTokenInfo) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			em.persist(hsTrStoreTokenInfo);
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
	public String deleteHsTrStoreTokenInfo(HsTrStoreTokenInfo hsTrStoreTokenInfo) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			hsTrStoreTokenInfo = em.merge(hsTrStoreTokenInfo);
			em.remove(hsTrStoreTokenInfo);
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
	public String updateHsTrStoreTokenInfo(HsTrStoreTokenInfo hsTrStoreTokenInfo) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			hsTrStoreTokenInfo = em.merge(hsTrStoreTokenInfo);
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
	public HsTrStoreTokenInfo findHsTrStoreTokenInfoByToken(String token) {
		HsTrStoreTokenInfo hsTrStoreTokenInfo = null;
		EntityManager em = getEntityManager();
		try {
			hsTrStoreTokenInfo = (HsTrStoreTokenInfo) em.find(HsTrStoreTokenInfo.class, token);
		} finally {
			em.close();
		}
		return hsTrStoreTokenInfo;
	}

	@Action(Action.ACTION_TYPE.NEW)
	public HsTrStoreTokenInfo getNewHsTrStoreTokenInfo() {
	
		HsTrStoreTokenInfo hsTrStoreTokenInfo = new HsTrStoreTokenInfo();
	
		return hsTrStoreTokenInfo;
	}

}