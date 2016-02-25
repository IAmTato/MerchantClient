package com.icbc.mo.emerchant.deliver.controller;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

import com.ibm.jpa.web.Action;
import com.ibm.jpa.web.JPAManager;
import com.icbc.JpaUtil;
import com.icbc.mo.emerchant.deliver.HsTrDeliveryAddr;
 
@JPAManager(targetEntity = com.icbc.mo.emerchant.deliver.HsTrDeliveryAddr.class)
public class HsTrDeliveryAddrManager {

	private EntityManagerFactory emf;

	public HsTrDeliveryAddrManager() {
	
	}

	public HsTrDeliveryAddrManager(EntityManagerFactory emf) {
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
	public String createHsTrDeliveryAddr(HsTrDeliveryAddr hsTrDeliveryAddr) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			em.persist(hsTrDeliveryAddr);
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
	public String deleteHsTrDeliveryAddr(HsTrDeliveryAddr hsTrDeliveryAddr) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			hsTrDeliveryAddr = em.merge(hsTrDeliveryAddr);
			em.remove(hsTrDeliveryAddr);
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
	public String updateHsTrDeliveryAddr(HsTrDeliveryAddr hsTrDeliveryAddr) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			hsTrDeliveryAddr = em.merge(hsTrDeliveryAddr);
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
	public HsTrDeliveryAddr findHsTrDeliveryAddrById(String id) {
		HsTrDeliveryAddr hsTrDeliveryAddr = null;
		EntityManager em = getEntityManager();
		try {
			hsTrDeliveryAddr = (HsTrDeliveryAddr) em.find(HsTrDeliveryAddr.class, id);
		} finally {
			em.close();
		}
		return hsTrDeliveryAddr;
	}

	@Action(Action.ACTION_TYPE.NEW)
	public HsTrDeliveryAddr getNewHsTrDeliveryAddr() {
	
		HsTrDeliveryAddr hsTrDeliveryAddr = new HsTrDeliveryAddr();
	
		return hsTrDeliveryAddr;
	}

}