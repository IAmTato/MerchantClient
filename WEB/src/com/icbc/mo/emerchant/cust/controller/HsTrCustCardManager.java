package com.icbc.mo.emerchant.cust.controller;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

import com.ibm.jpa.web.Action;
import com.ibm.jpa.web.JPAManager;
import com.icbc.JpaUtil;
import com.icbc.mo.emerchant.cust.HsTrCustCard;

@JPAManager(targetEntity = com.icbc.mo.emerchant.cust.HsTrCustCard.class)
public class HsTrCustCardManager {

	private EntityManagerFactory emf;

	public HsTrCustCardManager() {
	
	}

	public HsTrCustCardManager(EntityManagerFactory emf) {
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
	public String createHsTrCustCard(HsTrCustCard hsTrCustCard) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			em.persist(hsTrCustCard);
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
	public String deleteHsTrCustCard(HsTrCustCard hsTrCustCard) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			hsTrCustCard = em.merge(hsTrCustCard);
			em.remove(hsTrCustCard);
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
	public String updateHsTrCustCard(HsTrCustCard hsTrCustCard) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			hsTrCustCard = em.merge(hsTrCustCard);
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
	public HsTrCustCard findHsTrCustCardById(String id) {
		HsTrCustCard hsTrCustCard = null;
		EntityManager em = getEntityManager();
		try {
			hsTrCustCard = (HsTrCustCard) em.find(HsTrCustCard.class, id);
		} finally {
			em.close();
		}
		return hsTrCustCard;
	}

	@Action(Action.ACTION_TYPE.NEW)
	public HsTrCustCard getNewHsTrCustCard() {
	
		HsTrCustCard hsTrCustCard = new HsTrCustCard();
	
		return hsTrCustCard;
	}

}