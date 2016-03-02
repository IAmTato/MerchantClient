package com.icbc.mo.emerchant.user.controller;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;

import com.ibm.jpa.web.Action;
import com.ibm.jpa.web.JPAManager;
import com.ibm.jpa.web.NamedQueryTarget;
import com.icbc.JpaUtil;
import com.icbc.mo.emerchant.user.HsTrStoreUser;

@JPAManager(targetEntity = com.icbc.mo.emerchant.user.HsTrStoreUser.class)
public class HsTrStoreUserManager {

	protected static final class NamedQueries {

		protected static final String getUser = "SELECT h FROM HsTrStoreUser h WHERE h.userAliasEncrypt = :userAliasEncrypt or h.userNameEncrypt = :userNameEncrypt";

	}

	private EntityManagerFactory emf;

	public HsTrStoreUserManager() {

	}

	public HsTrStoreUserManager(EntityManagerFactory emf) {
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
	public String createHsTrStoreUser(HsTrStoreUser hsTrStoreUser)
			throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			em.persist(hsTrStoreUser);
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
	public String deleteHsTrStoreUser(HsTrStoreUser hsTrStoreUser)
			throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			hsTrStoreUser = em.merge(hsTrStoreUser);
			em.remove(hsTrStoreUser);
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
	public String updateHsTrStoreUser(HsTrStoreUser hsTrStoreUser)
			throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			hsTrStoreUser = em.merge(hsTrStoreUser);
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
	public HsTrStoreUser findHsTrStoreUserById(String id) {
		HsTrStoreUser hsTrStoreUser = null;
		EntityManager em = getEntityManager();
		try {
			hsTrStoreUser = (HsTrStoreUser) em.find(HsTrStoreUser.class, id);
		} finally {
			em.close();
		}
		return hsTrStoreUser;
	}

    @NamedQueryTarget("getUser")
    public HsTrStoreUser getUser(String userName) {
        EntityManager em = getEntityManager();
        List<HsTrStoreUser> results = null;
        try {
            Query query = em.createQuery(NamedQueries.getUser, HsTrStoreUser.class);
            query.setParameter("userAliasEncrypt", userName);
            query.setParameter("userNameEncrypt", userName);
            
            results = (List<HsTrStoreUser>) query.getResultList();
            if (results != null && results.size() > 0) {
				return results.get(0);
			}
			return null;
            
        } finally {
            em.close();
        }
    }
	
	@Action(Action.ACTION_TYPE.NEW)
	public HsTrStoreUser getNewHsTrStoreUser() {

		HsTrStoreUser hsTrStoreUser = new HsTrStoreUser();

		return hsTrStoreUser;
	}

}