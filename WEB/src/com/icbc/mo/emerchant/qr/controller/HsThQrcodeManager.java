package com.icbc.mo.emerchant.qr.controller;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;

import com.ibm.jpa.web.Action;
import com.ibm.jpa.web.JPAManager;
import com.ibm.jpa.web.NamedQueryTarget;
import com.icbc.JpaUtil;
import com.icbc.mo.emerchant.qr.HsThQrcode;


@JPAManager(targetEntity = com.icbc.mo.emerchant.qr.HsThQrcode.class)
public class HsThQrcodeManager {

	protected static final class NamedQueries {

		protected static final String getHsThQrcode = "SELECT h FROM HsThQrcode h WHERE h.custId = :custId";}

	private EntityManagerFactory emf;

	public HsThQrcodeManager() {
	
	}

	public HsThQrcodeManager(EntityManagerFactory emf) {
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
	public String createHsThQrcode(HsThQrcode hsThQrcode) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			em.persist(hsThQrcode);
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
	public String deleteHsThQrcode(HsThQrcode hsThQrcode) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			hsThQrcode = em.merge(hsThQrcode);
			em.remove(hsThQrcode);
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
	public String updateHsThQrcode(HsThQrcode hsThQrcode) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			hsThQrcode = em.merge(hsThQrcode);
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
	public HsThQrcode findHsThQrcodeByQrCodeId(String qrCodeId) {
		HsThQrcode hsThQrcode = null;
		EntityManager em = getEntityManager();
		try {
			hsThQrcode = (HsThQrcode) em.find(HsThQrcode.class, qrCodeId);
		} finally {
			em.close();
		}
		return hsThQrcode;
	}

	@Action(Action.ACTION_TYPE.NEW)
	public HsThQrcode getNewHsThQrcode() {
	
		HsThQrcode hsThQrcode = new HsThQrcode();
	
		return hsThQrcode;
	}

	@SuppressWarnings("unchecked")
	@NamedQueryTarget("getHsThQrcode")
	public List<HsThQrcode> getHsThQrcodeByCust(String custId) {
		EntityManager em = getEntityManager();
		List<HsThQrcode> results = null;
		try {
			Query query = em.createQuery(NamedQueries.getHsThQrcode);
			query.setParameter("custId", custId);
			results = (List<HsThQrcode>) query.getResultList();
		} finally {
			em.close();
		}
		return results;
	}

}