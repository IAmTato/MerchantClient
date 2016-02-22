package com.icbc.mo.emerchant.deliver.controller;

import com.ibm.jpa.web.JPAManager;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import com.ibm.jpa.web.NamedQueryTarget;
import com.ibm.jpa.web.Action;
import com.icbc.JpaUtil;
import com.icbc.mo.emerchant.deliver.HsTrDeliverCount;
import com.icbc.mo.emerchant.order.HsTrMasterOrder;

import java.math.BigDecimal;
import java.util.List;
import javax.persistence.Query;

@SuppressWarnings("unchecked")
@JPAManager(targetEntity = com.icbc.mo.emerchant.deliver.HsTrDeliverCount.class)
public class HsTrDeliverCountManager {

	protected static final class NamedQueries {

		protected static final String checkExist = "SELECT count(1) FROM HsTrDeliverCount h WHERE h.userId = :userId and h.handoverTime is null";
		protected static final String addNew = "Insert Into HsTrDeliverCount h (userId, totalAmount, totalCount) values (:userId, :dueAmount, 1)";
		protected static final String handover = "Update HsTrDeliverCount h set h.handoverTime = CURRENT_DATE WHERE h.userId = :userId and h.handoverTime is null";		
		protected static final String getExist = "SELECT h FROM HsTrDeliverCount h WHERE h.userId = :userId and h.handoverTime is null";
		protected static final String updateExist = "Update HsTrDeliverCount h set h.totalAmount = h.totalAmount + :dueAmount, h.totalCount = h.totalCount + 1 WHERE h.userId = :userId and h.handoverTime is null";
	}
	
	private EntityManagerFactory emf;

	public HsTrDeliverCountManager() {
	
	}

	public HsTrDeliverCountManager(EntityManagerFactory emf) {
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
	public String createHsTrDeliverCount(HsTrDeliverCount hsTrDeliverCount) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			em.persist(hsTrDeliverCount);
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
	public String deleteHsTrDeliverCount(HsTrDeliverCount hsTrDeliverCount) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			hsTrDeliverCount = em.merge(hsTrDeliverCount);
			em.remove(hsTrDeliverCount);
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
	public String updateHsTrDeliverCount(HsTrDeliverCount hsTrDeliverCount) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			hsTrDeliverCount = em.merge(hsTrDeliverCount);
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
	public HsTrDeliverCount findHsTrDeliverCountById(String id) {
		HsTrDeliverCount hsTrDeliverCount = null;
		EntityManager em = getEntityManager();
		try {
			hsTrDeliverCount = (HsTrDeliverCount) em.find(HsTrDeliverCount.class, id);
		} finally {
			em.close();
		}
		return hsTrDeliverCount;
	}

	@Action(Action.ACTION_TYPE.NEW)
	public HsTrDeliverCount getNewHsTrDeliverCount() {
	
		HsTrDeliverCount hsTrDeliverCount = new HsTrDeliverCount();
	
		return hsTrDeliverCount;
	}

	@NamedQueryTarget("checkExist")
	public Boolean checkExist(String userId) {
		EntityManager em = getEntityManager();
		Boolean results = null;
		try {
			Query query = em.createQuery(NamedQueries.checkExist);
			query.setParameter("userId", userId);
			String rs = query.getResultList().get(0).toString();
			if (Integer.valueOf(rs) >0) {
				results = true;
			}else{
				results = false;
			}
			
		} finally {
			em.close();
		}
		return results;
	}
	
	@NamedQueryTarget("addNew")
	public Boolean addNew(String userId, BigDecimal dueAmount ) {
		EntityManager em = getEntityManager();
		Boolean results = null;
		try {
			Query query = em.createQuery(NamedQueries.addNew);
			query.setParameter("userId", userId);
			query.setParameter("dueAmount", dueAmount);
			int rs = query.executeUpdate();
			if (rs == 0) {
				results = true;
			}else{
				results = false;
			}
			
		} finally {
			em.close();
		}
		return results;
	}
	
	@NamedQueryTarget("updateExist")
	public Boolean updateExist(String userId, BigDecimal dueAmount ) {
		EntityManager em = getEntityManager();
		Boolean results = null;
		try {
			em.getTransaction().begin();
			Query query = em.createQuery(NamedQueries.updateExist);
			query.setParameter("userId", userId);
			query.setParameter("dueAmount", dueAmount);
			int rs = query.executeUpdate();
			if (rs == 1) {
				results = true;
			}else{
				results = false;
			}
			
		} finally {
			em.getTransaction().commit();
			em.close();
		}
		return results;
	}
	
	@NamedQueryTarget("handover")
	public Boolean handover(String userId) {
		EntityManager em = getEntityManager();
		Boolean results = null;
		try {
			em.getTransaction().begin();
			Query query = em.createQuery(NamedQueries.handover);
			query.setParameter("userId", userId);
			int rs = query.executeUpdate();
			if (rs == 1) {
				results = true;
			}else{
				results = false;
			}
			
		} finally {
			em.getTransaction().commit();
			em.close();
		}
		return results;
	}
	
	@NamedQueryTarget("getExist")
	public List<HsTrDeliverCount> getExist(String userId) {
		EntityManager em = getEntityManager();
		List<HsTrDeliverCount> results = null; 
		try {
			Query query = em.createQuery(NamedQueries.getExist);
			query.setParameter("userId", userId);
			results = (List<HsTrDeliverCount>) query.getResultList();
		} finally {
			em.close();
		}
		return results;
	}
}