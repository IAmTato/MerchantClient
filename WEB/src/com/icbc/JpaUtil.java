package com.icbc;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class JpaUtil {
//	/**
//	 * ctp数据源模块名称，必须和 app-modules.xml里面数据源模块名称一致。
//	 */
//	private static final String CTP_DATA_SOURCE_MODEL_NAME = "ORACLEJDBC";
//	/**
//	 * jpa数据源jndi名称，必须和 persistence.xml配置一致
//	 */
//	private static final String JPA_DATA_SOURCE_NAME = "jpaDataSource"; 
	/**
	 * jta数据单元名称必须和 persistence.xml配置一致
	 */
	private static final String PERSISSTANCE_UNIT_NAME = "eMerchantWeb";

	private static EntityManagerFactory emf = null;
	
	public static EntityManagerFactory getEmf(){
	if(emf == null){
			synchronized (EntityManagerFactory.class) {
				
				emf = Persistence.createEntityManagerFactory(PERSISSTANCE_UNIT_NAME);
				//TODO 
			}			
		}
		return emf;
	}
}
