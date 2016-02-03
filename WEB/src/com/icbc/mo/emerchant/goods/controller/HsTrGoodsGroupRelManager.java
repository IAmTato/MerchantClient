package com.icbc.mo.emerchant.goods.controller;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

import com.ibm.jpa.web.Action;
import com.ibm.jpa.web.JPAManager;
import com.icbc.JpaUtil;
import com.icbc.mo.emerchant.goods.HsTrGoodsGroupRel;


@JPAManager(targetEntity = com.icbc.mo.emerchant.goods.HsTrGoodsGroupRel.class)
public class HsTrGoodsGroupRelManager {

	private EntityManagerFactory emf;

	public HsTrGoodsGroupRelManager() {
	
	}

	public HsTrGoodsGroupRelManager(EntityManagerFactory emf) {
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
	public String createHsTrGoodsGroupRel(HsTrGoodsGroupRel hsTrGoodsGroupRel) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			em.persist(hsTrGoodsGroupRel);
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
	public String deleteHsTrGoodsGroupRel(HsTrGoodsGroupRel hsTrGoodsGroupRel) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			hsTrGoodsGroupRel = em.merge(hsTrGoodsGroupRel);
			em.remove(hsTrGoodsGroupRel);
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
	public String updateHsTrGoodsGroupRel(HsTrGoodsGroupRel hsTrGoodsGroupRel) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			hsTrGoodsGroupRel = em.merge(hsTrGoodsGroupRel);
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
	public HsTrGoodsGroupRel findHsTrGoodsGroupRelById(String id) {
		HsTrGoodsGroupRel hsTrGoodsGroupRel = null;
		EntityManager em = getEntityManager();
		try {
			hsTrGoodsGroupRel = (HsTrGoodsGroupRel) em.find(HsTrGoodsGroupRel.class, id);
		} finally {
			em.close();
		}
		return hsTrGoodsGroupRel;
	}

	@Action(Action.ACTION_TYPE.NEW)
	public HsTrGoodsGroupRel getNewHsTrGoodsGroupRel() {
	
		HsTrGoodsGroupRel hsTrGoodsGroupRel = new HsTrGoodsGroupRel();
	
		return hsTrGoodsGroupRel;
	}

}