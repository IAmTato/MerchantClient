package com.icbc.mo.emerchant.store.controller;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;

import com.ibm.jpa.web.Action;
import com.ibm.jpa.web.JPAManager;
import com.ibm.jpa.web.NamedQueryTarget;
import com.icbc.JpaUtil;
import com.icbc.mo.emerchant.store.HsTrStoreDetail;
import com.icbc.mo.emerchant.store.StoreToken;

@JPAManager(targetEntity = com.icbc.mo.emerchant.store.HsTrStoreDetail.class)
public class HsTrStoreDetailManager {

	protected static final class NamedQueries {

		protected static final String getHsTrStoreDetailByToken = "SELECT h FROM HsTrStoreDetail h,HsTrStoreUser u WHERE h.storeId = u.orgId and u.id = :userId";
	}

	private EntityManagerFactory emf;

	public HsTrStoreDetailManager() {

	}

	public HsTrStoreDetailManager(EntityManagerFactory emf) {
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
	public String createHsTrStoreDetail(HsTrStoreDetail hsTrStoreDetail) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			em.persist(hsTrStoreDetail);
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
	public String deleteHsTrStoreDetail(HsTrStoreDetail hsTrStoreDetail) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			hsTrStoreDetail = em.merge(hsTrStoreDetail);
			em.remove(hsTrStoreDetail);
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
	public String updateHsTrStoreDetail(HsTrStoreDetail hsTrStoreDetail) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			hsTrStoreDetail = em.merge(hsTrStoreDetail);
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
	public HsTrStoreDetail findHsTrStoreDetailByStoreId(String storeId) {
		HsTrStoreDetail hsTrStoreDetail = null;
		EntityManager em = getEntityManager();
		try {
			hsTrStoreDetail = (HsTrStoreDetail) em.find(HsTrStoreDetail.class, storeId);
		} finally {
			em.close();
		}
		return hsTrStoreDetail;
	}

	@Action(Action.ACTION_TYPE.NEW)
	public HsTrStoreDetail getNewHsTrStoreDetail() {

		HsTrStoreDetail hsTrStoreDetail = new HsTrStoreDetail();

		return hsTrStoreDetail;
	}

	/**
	 * 通过 用户token 查询 用户所在门店信息。
	 * 
	 * @param token
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@NamedQueryTarget("getHsTrStoreDetailByToken")
	public HsTrStoreDetail getHsTrStoreDetailByUser(StoreToken token) {
		EntityManager em = getEntityManager();
		List<HsTrStoreDetail> results = null;
		try {
			Query query = em.createQuery(NamedQueries.getHsTrStoreDetailByToken);
			query.setParameter("userId", token.getStoreUser());
			results = (List<HsTrStoreDetail>) query.getResultList();
			if (results != null && results.size() > 0) {
				return results.get(0);
			}
			return null;
		} finally {
			em.close();
		}
	}

}