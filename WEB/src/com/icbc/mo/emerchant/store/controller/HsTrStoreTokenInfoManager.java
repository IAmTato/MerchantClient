package com.icbc.mo.emerchant.store.controller;

import java.util.List;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;

import org.directwebremoting.ConversionException;
import org.directwebremoting.WebContextFactory;
import org.directwebremoting.emerchant.TokenIdNullException;
import org.directwebremoting.emerchant.TokenNotExistsException;
import org.directwebremoting.emerchant.TokenTimeOutException;
import org.directwebremoting.util.Base64;

import com.ibm.jpa.web.Action;
import com.ibm.jpa.web.JPAManager;
import com.ibm.jpa.web.NamedQueryTarget;
import com.icbc.JpaUtil;
import com.icbc.mo.emerchant.store.HsTrStoreTokenInfo;


@JPAManager(targetEntity = com.icbc.mo.emerchant.store.HsTrStoreTokenInfo.class)
public class HsTrStoreTokenInfoManager {
	
	/**
	 * 
	 * @return 返回随机uuid 对应的 base64表达。作为唯一token标记
	 */
	public static String newTokenId(){
		UUID id = UUID.randomUUID();
		long m = id.getMostSignificantBits();
		long l = id.getLeastSignificantBits();
		byte[] tmpByte = new byte[] {
				(byte) ((m >> 7*8) & 0xFF), 	
				(byte) ((m >> 6*8) & 0xFF), 	
				(byte) ((m >> 5*8) & 0xFF), 	
				(byte) ((m >> 4*8) & 0xFF), 	
				(byte) ((m >> 3*8) & 0xFF), 	
				(byte) ((m >> 2*8) & 0xFF), 	
				(byte) ((m >> 1*8) & 0xFF), 	
				(byte) ((m >> 0*8) & 0xFF), 	
				(byte) ((l >> 7*8) & 0xFF), 	
				(byte) ((m >> 6*8) & 0xFF), 	
				(byte) ((m >> 5*8) & 0xFF), 	
				(byte) ((m >> 4*8) & 0xFF), 	
				(byte) ((m >> 3*8) & 0xFF), 	
				(byte) ((m >> 2*8) & 0xFF), 	
				(byte) ((m >> 1*8) & 0xFF), 	
				(byte) ((m >> 0*8) & 0xFF), 	
		};
		
		return new String(Base64.encodeBase64(tmpByte));		
	}

	public class TokenByUserResult {
		private String storeUser;
	
		public TokenByUserResult() {
		}
	
		public TokenByUserResult(String storeUser) {
			this.storeUser = storeUser;
		}
	
		public String getstoreUser() {
			return storeUser;
		}
	
		public void setstoreUser(String storeUser) {
			this.storeUser = storeUser;
		}
	}

	protected static final class NamedQueries {

		protected static final String getHsTrStoreTokenInfo = "SELECT h FROM HsTrStoreTokenInfo h";
		protected static final String getTokenByUser = "SELECT h FROM HsTrStoreTokenInfo h WHERE h.storeUser = :storeUser";}

	/**
	 * token id 标记
	 */
	private static final String USER_TOKEN_ID = "USER_TOKEN_ID";

	/**
	 * 默认两天 //TODO 后续改为参数
	 */
	private static final long LOGIN_TIME_OUT = 24*60*60*1000;


	public HsTrStoreTokenInfoManager() {
	
	}

	public HsTrStoreTokenInfoManager(EntityManagerFactory emf) {
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
	public String createHsTrStoreTokenInfo(HsTrStoreTokenInfo hsTrStoreTokenInfo) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			em.persist(hsTrStoreTokenInfo);
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
	public String deleteHsTrStoreTokenInfo(HsTrStoreTokenInfo hsTrStoreTokenInfo) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			hsTrStoreTokenInfo = em.merge(hsTrStoreTokenInfo);
			em.remove(hsTrStoreTokenInfo);
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
	public String updateHsTrStoreTokenInfo(HsTrStoreTokenInfo hsTrStoreTokenInfo) throws Exception {
		EntityManager em = getEntityManager();
		try {
			em.getTransaction().begin();
			hsTrStoreTokenInfo = em.merge(hsTrStoreTokenInfo);
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
	public HsTrStoreTokenInfo findHsTrStoreTokenInfoByToken(String token) {
		HsTrStoreTokenInfo hsTrStoreTokenInfo = null;
		EntityManager em = getEntityManager();
		try {
			hsTrStoreTokenInfo = (HsTrStoreTokenInfo) em.find(HsTrStoreTokenInfo.class, token);
		} finally {
			em.close();
		}
		return hsTrStoreTokenInfo;
	}

	@Action(Action.ACTION_TYPE.NEW)
	public HsTrStoreTokenInfo getNewHsTrStoreTokenInfo() {
	
		HsTrStoreTokenInfo hsTrStoreTokenInfo = new HsTrStoreTokenInfo();
	
		return hsTrStoreTokenInfo;
	}
	
	private static HsTrStoreTokenInfoManager mgr = new HsTrStoreTokenInfoManager();
	
	 
	private static ConcurrentHashMap<String, HsTrStoreTokenInfo> tokenCatch = new ConcurrentHashMap<String, HsTrStoreTokenInfo>();

	private EntityManagerFactory emf;

	/**
	 * 获取当前request对应的token对象。
	 * @return 返回token对象
	 * @throws ConversionException 如果没有正常登陆 抛出异常。
	 */
	public static HsTrStoreTokenInfo getTokenInRequest() throws ConversionException {
		HttpServletRequest req = WebContextFactory.get().getHttpServletRequest();
		String tokenId = req.getHeader(USER_TOKEN_ID);
		if(tokenId==null){
			tokenId = req.getParameter(USER_TOKEN_ID);
			if(tokenId==null){
				tokenId = (String)req.getAttribute(USER_TOKEN_ID);
			}
		}
		
		if(tokenId == null) {
			throw new TokenIdNullException();
		}
		HsTrStoreTokenInfo token = tokenCatch.get(tokenId);
		if(token == null) {
			token = mgr.findHsTrStoreTokenInfoByToken(tokenId);
			if(token != null) {
				tokenCatch.put(tokenId, token);
			}else {
				throw new TokenNotExistsException();
			}
		}
		if( System.currentTimeMillis() - token.getCreateTime().getTime() > LOGIN_TIME_OUT ) {
			throw new TokenTimeOutException();
		}
		
		return token;
	}
 
	@SuppressWarnings("unchecked")
	@NamedQueryTarget("getTokenByUser")
	public HsTrStoreTokenInfo getTokenByUser(String storeUser) {
		EntityManager em = getEntityManager();
		try {
			Query query = em.createQuery(NamedQueries.getTokenByUser);
			query.setParameter("storeUser", storeUser);
			List<HsTrStoreTokenInfo> list = (List<HsTrStoreTokenInfo>)query.getResultList();
			if(list == null || list.size() == 0) {
				return null;
			}
			return list.get(0);
		} finally {
			em.close();
		}
	}
}