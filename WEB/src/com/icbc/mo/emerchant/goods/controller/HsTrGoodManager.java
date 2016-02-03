package com.icbc.mo.emerchant.goods.controller;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

import com.ibm.jpa.web.Action;
import com.ibm.jpa.web.JPAManager;
import com.icbc.JpaUtil;
import com.icbc.mo.emerchant.goods.HsTrGood;


@JPAManager(targetEntity = com.icbc.mo.emerchant.goods.HsTrGood.class)
public class HsTrGoodManager {

	private EntityManagerFactory emf;

	public HsTrGoodManager() {
	
	}

	public HsTrGoodManager(EntityManagerFactory emf) {
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
	public String createHsTrGood(HsTrGood hsTrGood) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			em.persist(hsTrGood);
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
	public String deleteHsTrGood(HsTrGood hsTrGood) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			hsTrGood = em.merge(hsTrGood);
			em.remove(hsTrGood);
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
	public String updateHsTrGood(HsTrGood hsTrGood) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			hsTrGood = em.merge(hsTrGood);
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
	public HsTrGood findHsTrGoodByGoodsId(String goodsId) {
		HsTrGood hsTrGood = null;
		EntityManager em = getEntityManager();
		try {
			hsTrGood = (HsTrGood) em.find(HsTrGood.class, goodsId);
		} finally {
			em.close();
		}
		return hsTrGood;
	}

	@Action(Action.ACTION_TYPE.NEW)
	public HsTrGood getNewHsTrGood() {
	
		HsTrGood hsTrGood = new HsTrGood();
	
		return hsTrGood;
	}

}