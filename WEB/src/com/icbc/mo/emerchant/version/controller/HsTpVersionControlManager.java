package com.icbc.mo.emerchant.version.controller;

import com.ibm.jpa.web.JPAManager;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import com.ibm.jpa.web.Action;
import com.icbc.mo.emerchant.version.HsTpVersionControl;

@SuppressWarnings("unchecked")
@JPAManager(targetEntity = com.icbc.mo.emerchant.version.HsTpVersionControl.class)
public class HsTpVersionControlManager {

	private EntityManagerFactory emf;

	public HsTpVersionControlManager() {
	
	}

	public HsTpVersionControlManager(EntityManagerFactory emf) {
		this.emf = emf;
	}

	public void setEntityManagerFactory(EntityManagerFactory emf) {
		this.emf = emf;
	}

	private EntityManager getEntityManager() {
		if (emf == null) {
			throw new RuntimeException(
					"The EntityManagerFactory is null.  This must be passed in to the constructor or set using the setEntityManagerFactory() method.");
		}
		return emf.createEntityManager();
	}

	@Action(Action.ACTION_TYPE.CREATE)
	public String createHsTpVersionControl(HsTpVersionControl hsTpVersionControl)
			throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			em.persist(hsTpVersionControl);
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
	public String deleteHsTpVersionControl(HsTpVersionControl hsTpVersionControl)
			throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			hsTpVersionControl = em.merge(hsTpVersionControl);
			em.remove(hsTpVersionControl);
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
	public String updateHsTpVersionControl(HsTpVersionControl hsTpVersionControl)
			throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			hsTpVersionControl = em.merge(hsTpVersionControl);
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
	public HsTpVersionControl findHsTpVersionControlById(String id) {
		HsTpVersionControl hsTpVersionControl = null;
		EntityManager em = getEntityManager();
		try {
			hsTpVersionControl = (HsTpVersionControl) em.find(
					HsTpVersionControl.class, id);
		} finally {
			em.close();
		}
		return hsTpVersionControl;
	}

	@Action(Action.ACTION_TYPE.NEW)
	public HsTpVersionControl getNewHsTpVersionControl() {
	
		HsTpVersionControl hsTpVersionControl = new HsTpVersionControl();
	
		return hsTpVersionControl;
	}

}