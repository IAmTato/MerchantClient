package com.icbc.mo.emerchant.goods.controller;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

import com.ibm.jpa.web.Action;
import com.ibm.jpa.web.JPAManager;
import com.icbc.JpaUtil;
import com.icbc.mo.emerchant.goods.HsTrGoodsAttachRel;


@JPAManager(targetEntity = com.icbc.mo.emerchant.goods.HsTrGoodsAttachRel.class)
public class HsTrGoodsAttachRelManager {

	private EntityManagerFactory emf;

	public HsTrGoodsAttachRelManager() {
	
	}

	public HsTrGoodsAttachRelManager(EntityManagerFactory emf) {
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
	public String createHsTrGoodsAttachRel(HsTrGoodsAttachRel hsTrGoodsAttachRel) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			em.persist(hsTrGoodsAttachRel);
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
	public String deleteHsTrGoodsAttachRel(HsTrGoodsAttachRel hsTrGoodsAttachRel) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			hsTrGoodsAttachRel = em.merge(hsTrGoodsAttachRel);
			em.remove(hsTrGoodsAttachRel);
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
	public String updateHsTrGoodsAttachRel(HsTrGoodsAttachRel hsTrGoodsAttachRel) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			hsTrGoodsAttachRel = em.merge(hsTrGoodsAttachRel);
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
	public HsTrGoodsAttachRel findHsTrGoodsAttachRelById(String id) {
		HsTrGoodsAttachRel hsTrGoodsAttachRel = null;
		EntityManager em = getEntityManager();
		try {
			hsTrGoodsAttachRel = (HsTrGoodsAttachRel) em.find(HsTrGoodsAttachRel.class, id);
		} finally {
			em.close();
		}
		return hsTrGoodsAttachRel;
	}

	@Action(Action.ACTION_TYPE.NEW)
	public HsTrGoodsAttachRel getNewHsTrGoodsAttachRel() {
	
		HsTrGoodsAttachRel hsTrGoodsAttachRel = new HsTrGoodsAttachRel();
	
		return hsTrGoodsAttachRel;
	}

}