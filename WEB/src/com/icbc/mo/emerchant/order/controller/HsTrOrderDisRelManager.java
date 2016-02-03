package com.icbc.mo.emerchant.order.controller;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

import com.ibm.jpa.web.Action;
import com.ibm.jpa.web.JPAManager;
import com.icbc.JpaUtil;
import com.icbc.mo.emerchant.order.HsTrOrderDisRel;


@JPAManager(targetEntity = com.icbc.mo.emerchant.order.HsTrOrderDisRel.class)
public class HsTrOrderDisRelManager {

	private EntityManagerFactory emf;

	public HsTrOrderDisRelManager() {
	
	}

	public HsTrOrderDisRelManager(EntityManagerFactory emf) {
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
	public String createHsTrOrderDisRel(HsTrOrderDisRel hsTrOrderDisRel) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			em.persist(hsTrOrderDisRel);
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
	public String deleteHsTrOrderDisRel(HsTrOrderDisRel hsTrOrderDisRel) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			hsTrOrderDisRel = em.merge(hsTrOrderDisRel);
			em.remove(hsTrOrderDisRel);
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
	public String updateHsTrOrderDisRel(HsTrOrderDisRel hsTrOrderDisRel) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			hsTrOrderDisRel = em.merge(hsTrOrderDisRel);
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
	public HsTrOrderDisRel findHsTrOrderDisRelByRelId(String relId) {
		HsTrOrderDisRel hsTrOrderDisRel = null;
		EntityManager em = getEntityManager();
		try {
			hsTrOrderDisRel = (HsTrOrderDisRel) em.find(HsTrOrderDisRel.class, relId);
		} finally {
			em.close();
		}
		return hsTrOrderDisRel;
	}

	@Action(Action.ACTION_TYPE.NEW)
	public HsTrOrderDisRel getNewHsTrOrderDisRel() {
	
		HsTrOrderDisRel hsTrOrderDisRel = new HsTrOrderDisRel();
	
		return hsTrOrderDisRel;
	}

}