package com.icbc.mo.emerchant.sys.controller;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;

import com.ibm.jpa.web.Action;
import com.ibm.jpa.web.JPAManager;
import com.ibm.jpa.web.NamedQueryTarget;
import com.icbc.JpaUtil;
import com.icbc.mo.emerchant.sys.HsTpDict;


@JPAManager(targetEntity = com.icbc.mo.emerchant.sys.HsTpDict.class)
public class HsTpDictManager {

	protected static final class NamedQueries {

		protected static final String getHsTpDict = "SELECT h FROM HsTpDict h";}

	private EntityManagerFactory emf;

	public HsTpDictManager() {
	
	}

	public HsTpDictManager(EntityManagerFactory emf) {
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
	public String createHsTpDict(HsTpDict hsTpDict) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			em.persist(hsTpDict);
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
	public String deleteHsTpDict(HsTpDict hsTpDict) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			hsTpDict = em.merge(hsTpDict);
			em.remove(hsTpDict);
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
	public String updateHsTpDict(HsTpDict hsTpDict) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			hsTpDict = em.merge(hsTpDict);
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
	public HsTpDict findHsTpDictById(String id) {
		HsTpDict hsTpDict = null;
		EntityManager em = getEntityManager();
		try {
			hsTpDict = (HsTpDict) em.find(HsTpDict.class, id);
		} finally {
			em.close();
		}
		return hsTpDict;
	}

	@Action(Action.ACTION_TYPE.NEW)
	public HsTpDict getNewHsTpDict() {
	
		HsTpDict hsTpDict = new HsTpDict();
	
		return hsTpDict;
	}

	@SuppressWarnings("unchecked")
	@NamedQueryTarget("getHsTpDict")
	public List<HsTpDict> getHsTpDict() {
		EntityManager em = getEntityManager();
		List<HsTpDict> results = null;
		try {
			Query query = em.createQuery(NamedQueries.getHsTpDict);
			results = (List<HsTpDict>) query.getResultList();
		} finally {
			em.close();
		}
		return results;
	}

}