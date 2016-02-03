package com.icbc.mo.emerchant.goods.controller;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

import com.ibm.jpa.web.Action;
import com.ibm.jpa.web.JPAManager;
import com.icbc.JpaUtil;
import com.icbc.mo.emerchant.goods.HsTrGoodsClassification;


@JPAManager(targetEntity = com.icbc.mo.emerchant.goods.HsTrGoodsClassification.class)
public class HsTrGoodsClassificationManager {

	private EntityManagerFactory emf;

	public HsTrGoodsClassificationManager() {
	
	}

	public HsTrGoodsClassificationManager(EntityManagerFactory emf) {
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
	public String createHsTrGoodsClassification(HsTrGoodsClassification hsTrGoodsClassification) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			em.persist(hsTrGoodsClassification);
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
	public String deleteHsTrGoodsClassification(HsTrGoodsClassification hsTrGoodsClassification) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			hsTrGoodsClassification = em.merge(hsTrGoodsClassification);
			em.remove(hsTrGoodsClassification);
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
	public String updateHsTrGoodsClassification(HsTrGoodsClassification hsTrGoodsClassification) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			hsTrGoodsClassification = em.merge(hsTrGoodsClassification);
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
	public HsTrGoodsClassification findHsTrGoodsClassificationById(String id) {
		HsTrGoodsClassification hsTrGoodsClassification = null;
		EntityManager em = getEntityManager();
		try {
			hsTrGoodsClassification = (HsTrGoodsClassification) em.find(HsTrGoodsClassification.class, id);
		} finally {
			em.close();
		}
		return hsTrGoodsClassification;
	}

	@Action(Action.ACTION_TYPE.NEW)
	public HsTrGoodsClassification getNewHsTrGoodsClassification() {
	
		HsTrGoodsClassification hsTrGoodsClassification = new HsTrGoodsClassification();
	
		return hsTrGoodsClassification;
	}

}