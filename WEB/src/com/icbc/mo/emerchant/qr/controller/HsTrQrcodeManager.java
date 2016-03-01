package com.icbc.mo.emerchant.qr.controller;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

import com.ibm.jpa.web.Action;
import com.ibm.jpa.web.JPAManager;
import com.icbc.JpaUtil;
import com.icbc.mo.emerchant.qr.HsTrQrcode;


@JPAManager(targetEntity = com.icbc.mo.emerchant.qr.HsTrQrcode.class)
public class HsTrQrcodeManager {

	private EntityManagerFactory emf;
	
	public HsTrQrcodeManager() {
	
	}

	public HsTrQrcodeManager(EntityManagerFactory emf) {
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
	public String createHsTrQrcode(HsTrQrcode hsTrQrcode) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			em.persist(hsTrQrcode);
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
	public String deleteHsTrQrcode(HsTrQrcode hsTrQrcode) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			hsTrQrcode = em.merge(hsTrQrcode);
			em.remove(hsTrQrcode);
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
	public String updateHsTrQrcode(HsTrQrcode hsTrQrcode) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			hsTrQrcode = em.merge(hsTrQrcode);
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
		return "true";
	}

	@Action(Action.ACTION_TYPE.FIND)
	public HsTrQrcode findHsTrQrcodeByQrCodeId(String qrCodeId) {
		HsTrQrcode hsTrQrcode = null;
		EntityManager em = getEntityManager();
		try {
			hsTrQrcode = (HsTrQrcode) em.find(HsTrQrcode.class, qrCodeId);
		} finally {
			em.close();
		}
		return hsTrQrcode;
	}

	@Action(Action.ACTION_TYPE.NEW)
	public HsTrQrcode getNewHsTrQrcode() {
	
		HsTrQrcode hsTrQrcode = new HsTrQrcode();
	
		return hsTrQrcode;
	}
	
}