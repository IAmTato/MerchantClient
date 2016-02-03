package com.icbc.mo.emerchant.sys.controller;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;

import com.ibm.jpa.web.Action;
import com.ibm.jpa.web.JPAManager;
import com.ibm.jpa.web.NamedQueryTarget;
import com.icbc.JpaUtil;
import com.icbc.mo.emerchant.sys.HsTpBaseParam;


@JPAManager(targetEntity = com.icbc.mo.emerchant.sys.HsTpBaseParam.class)
public class HsTpBaseParamManager {

	protected static final class NamedQueries {

		protected static final String getHsTpBaseParam = "SELECT h FROM HsTpBaseParam h";}

	private EntityManagerFactory emf;

	public HsTpBaseParamManager() {
	
	}

	public HsTpBaseParamManager(EntityManagerFactory emf) {
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
	public String createHsTpBaseParam(HsTpBaseParam hsTpBaseParam) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			em.persist(hsTpBaseParam);
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
	public String deleteHsTpBaseParam(HsTpBaseParam hsTpBaseParam) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			hsTpBaseParam = em.merge(hsTpBaseParam);
			em.remove(hsTpBaseParam);
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
	public String updateHsTpBaseParam(HsTpBaseParam hsTpBaseParam) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			hsTpBaseParam = em.merge(hsTpBaseParam);
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
	public HsTpBaseParam findHsTpBaseParamByParamId(String paramId) {
		HsTpBaseParam hsTpBaseParam = null;
		EntityManager em = getEntityManager();
		try {
			hsTpBaseParam = (HsTpBaseParam) em.find(HsTpBaseParam.class, paramId);
		} finally {
			em.close();
		}
		return hsTpBaseParam;
	}

	@Action(Action.ACTION_TYPE.NEW)
	public HsTpBaseParam getNewHsTpBaseParam() {
	
		HsTpBaseParam hsTpBaseParam = new HsTpBaseParam();
	
		return hsTpBaseParam;
	}

	@SuppressWarnings("unchecked")
	@NamedQueryTarget("getHsTpBaseParam")
	public List<HsTpBaseParam> getHsTpBaseParam() {
		EntityManager em = getEntityManager();
		List<HsTpBaseParam> results = null;
		try {
			Query query = em.createQuery(NamedQueries.getHsTpBaseParam);
			results = (List<HsTpBaseParam>) query.getResultList();
		} finally {
			em.close();
		}
		return results;
	}

}