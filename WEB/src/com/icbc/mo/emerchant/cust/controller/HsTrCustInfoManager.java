package com.icbc.mo.emerchant.cust.controller;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;

import com.ibm.jpa.web.Action;
import com.ibm.jpa.web.JPAManager;
import com.ibm.jpa.web.NamedQueryTarget;
import com.icbc.JpaUtil;
import com.icbc.mo.emerchant.cust.HsTrCustInfo;


@JPAManager(targetEntity = com.icbc.mo.emerchant.cust.HsTrCustInfo.class)
public class HsTrCustInfoManager {
	
	protected static final class NamedQueries {
	    protected static final String getCustIdbyPhone = "SELECT h.custId FROM HsTrCustInfo h WHERE h.phone = :phone";
		}

	private EntityManagerFactory emf;

	public HsTrCustInfoManager() {
	
	}

	public HsTrCustInfoManager(EntityManagerFactory emf) {
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
	public String createHsTrCustInfo(HsTrCustInfo hsTrCustInfo) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			em.persist(hsTrCustInfo);
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
	public String deleteHsTrCustInfo(HsTrCustInfo hsTrCustInfo) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			hsTrCustInfo = em.merge(hsTrCustInfo);
			em.remove(hsTrCustInfo);
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
	public String updateHsTrCustInfo(HsTrCustInfo hsTrCustInfo) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			hsTrCustInfo = em.merge(hsTrCustInfo);
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
	public HsTrCustInfo findHsTrCustInfoByCustId(String custId) {
		HsTrCustInfo hsTrCustInfo = null;
		EntityManager em = getEntityManager();
		try {
			hsTrCustInfo = (HsTrCustInfo) em.find(HsTrCustInfo.class, custId);
		} finally {
			em.close();
		}
		return hsTrCustInfo;
	}

	@Action(Action.ACTION_TYPE.NEW)
	public HsTrCustInfo getNewHsTrCustInfo() {
	
		HsTrCustInfo hsTrCustInfo = new HsTrCustInfo();
	
		return hsTrCustInfo;
	}
	
	@NamedQueryTarget("getCustIdbyPhone")
	public String getCustIdbyPhone(String phone) {
		EntityManager em = getEntityManager();
		String result = null;
		try {
			Query query = em.createQuery(NamedQueries.getCustIdbyPhone);
			query.setParameter("phone", phone);
			result = (String) query.getSingleResult();
		} finally {
			em.close();
		}
		return result;
	}
	

}