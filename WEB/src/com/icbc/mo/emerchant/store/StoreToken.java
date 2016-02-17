package com.icbc.mo.emerchant.store;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.icbc.mo.emerchant.store.controller.HsTrStoreDetailManager;
import com.icbc.mo.emerchant.user.HsTrStoreUser;


/**
 * The persistent class for the HS_TR_STORE_TOKEN_INFO database table.
 * 
 */
@Entity
@Table(name="HS_TR_STORE_TOKEN_INFO")
public class StoreToken implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String token;

	@Column(name="CREATE_TIME")
	private Timestamp createTime;

	private String phone;

	@Column(name="STORE_USER")
	private String storeUser;
	
	@Transient
	private HsTrStoreUser userData ;
	

	@Transient
	private HsTrStoreDetail storeDetail ;

    public StoreToken() {
    }

	public String getToken() {
		return this.token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public Timestamp getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getStoreUser() {
		return this.storeUser;
	}

	public void setStoreUser(String storeUser) {
		this.storeUser = storeUser;
	}

	public HsTrStoreUser getUserData() {
		return userData;
	}

	public void setUserData(HsTrStoreUser userData) {
		this.userData = userData;
	}

	/** 
	 * @return 返回上铺信息。
	 */
	public HsTrStoreDetail getStoreDetail() {
		if(storeDetail == null) {
			HsTrStoreDetailManager m = new HsTrStoreDetailManager();
			storeDetail = m.getHsTrStoreDetailByUser(this);
		}
		return storeDetail;
	}

	public void setStoreDetail(HsTrStoreDetail storeDetail) {
		this.storeDetail = storeDetail;
	}

}