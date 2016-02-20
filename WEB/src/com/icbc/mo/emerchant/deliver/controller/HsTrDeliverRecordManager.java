package com.icbc.mo.emerchant.deliver.controller;

import com.ibm.jpa.web.JPAManager;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import com.ibm.jpa.web.NamedQueryTarget;
import com.ibm.jpa.web.Action;
import com.icbc.JpaUtil;
import com.icbc.mo.emerchant.deliver.HsTrDeliverRecord;
import java.util.List;
import javax.persistence.Query;

@SuppressWarnings("unchecked")
@JPAManager(targetEntity = com.icbc.mo.emerchant.deliver.HsTrDeliverRecord.class)
public class HsTrDeliverRecordManager {

	protected static final class NamedQueries {

		protected static final String getNoEndTimeCount = "SELECT h FROM HsTrDeliverRecord h WHERE h.userId = :userId";}

	private EntityManagerFactory emf;

	public HsTrDeliverRecordManager() {
	
	}

	public HsTrDeliverRecordManager(EntityManagerFactory emf) {
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
	public String createHsTrDeliverRecord(HsTrDeliverRecord hsTrDeliverRecord) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			em.persist(hsTrDeliverRecord);
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
	public String deleteHsTrDeliverRecord(HsTrDeliverRecord hsTrDeliverRecord) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			hsTrDeliverRecord = em.merge(hsTrDeliverRecord);
			em.remove(hsTrDeliverRecord);
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
	public String updateHsTrDeliverRecord(HsTrDeliverRecord hsTrDeliverRecord) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			hsTrDeliverRecord = em.merge(hsTrDeliverRecord);
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
	public HsTrDeliverRecord findHsTrDeliverRecordById(String id) {
		HsTrDeliverRecord hsTrDeliverRecord = null;
		EntityManager em = getEntityManager();
		try {
			hsTrDeliverRecord = (HsTrDeliverRecord) em.find(HsTrDeliverRecord.class, id);
		} finally {
			em.close();
		}
		return hsTrDeliverRecord;
	}

	@Action(Action.ACTION_TYPE.NEW)
	public HsTrDeliverRecord getNewHsTrDeliverRecord() {
	
		HsTrDeliverRecord hsTrDeliverRecord = new HsTrDeliverRecord();
	
		return hsTrDeliverRecord;
	}

	@NamedQueryTarget("getNoEndTimeCount")
	public List<HsTrDeliverRecord> getNoEndTimeCount(String userId) {
		EntityManager em = getEntityManager();
		List<HsTrDeliverRecord> results = null;
		try {
			Query query = em.createQuery(NamedQueries.getNoEndTimeCount);
			query.setParameter("userId", userId);
			results = (List<HsTrDeliverRecord>) query.getResultList();
		} finally {
			em.close();
		}
		return results;
	}

}