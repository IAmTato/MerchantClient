package com.icbc.mo.emerchant.deliver.controller;

import com.ibm.jpa.web.JPAManager;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import com.ibm.jpa.web.Action;
import com.icbc.JpaUtil;
import com.icbc.mo.emerchant.deliver.HsTrDelivery;

@SuppressWarnings("unchecked")
@JPAManager(targetEntity = com.icbc.mo.emerchant.deliver.HsTrDelivery.class)
public class HsTrDeliveryManager {
	
	private EntityManagerFactory emf;

	public HsTrDeliveryManager() {
	
	}

	public HsTrDeliveryManager(EntityManagerFactory emf) {
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
	public String createHsTrDelivery(HsTrDelivery hsTrDelivery) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			em.persist(hsTrDelivery);
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
	public String deleteHsTrDelivery(HsTrDelivery hsTrDelivery)
			throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			hsTrDelivery = em.merge(hsTrDelivery);
			em.remove(hsTrDelivery);
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
	public String updateHsTrDelivery(HsTrDelivery hsTrDelivery) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			hsTrDelivery = em.merge(hsTrDelivery);
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
	public HsTrDelivery findHsTrDeliveryById(String id) {
		HsTrDelivery hsTrDelivery = null;
		EntityManager em = getEntityManager();
		try {
			hsTrDelivery = (HsTrDelivery) em.find(HsTrDelivery.class, id);
		} finally {
			em.close();
		}
		return hsTrDelivery;
	}

	@Action(Action.ACTION_TYPE.NEW)
	public HsTrDelivery getNewHsTrDelivery() {
	
		HsTrDelivery hsTrDelivery = new HsTrDelivery();
	
		return hsTrDelivery;
	}

}